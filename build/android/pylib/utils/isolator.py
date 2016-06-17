# Copyright 2014 The Chromium Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

import fnmatch
import glob
import os
import shutil
import sys

from pylib import cmd_helper
from pylib import constants


_ISOLATE_SCRIPT = os.path.join(
    constants.DIR_SOURCE_ROOT, 'tools', 'swarming_client', 'isolate.py')


def DefaultPathVariables():
  return {
    'DEPTH': constants.DIR_SOURCE_ROOT,
    'PRODUCT_DIR': constants.GetOutDirectory(),
  }


def DefaultConfigVariables():
  # Note: This list must match the --config-vars in build/isolate.gypi
  return {
    'CONFIGURATION_NAME': constants.GetBuildType(),
    'OS': 'android',
    'asan': '0',
    'branding': 'Chromium',
    'chromeos': '0',
    'component': 'static_library',
    'fastbuild': '0',
    'icu_use_data_file_flag': '1',
    'kasko': '0',
    'lsan': '0',
    'msan': '0',
    # TODO(maruel): This may not always be true.
    'target_arch': 'arm',
    'tsan': '0',
    'use_custom_libcxx': '0',
    'use_instrumented_libraries': '0',
    'use_prebuilt_instrumented_libraries': '0',
    'use_openssl': '0',
    'use_ozone': '0',
    'use_x11': '0',
    'v8_use_external_startup_data': '1',
  }


class Isolator(object):
  """Manages calls to isolate.py for the android test runner scripts."""

  def __init__(self, isolate_deps_dir):
    """
    Args:
      isolate_deps_dir: The directory in which dependencies specified by
        isolate are or should be stored.
    """
    self._isolate_deps_dir = isolate_deps_dir

  def Clear(self):
    """Deletes the isolate dependency directory."""
    if os.path.exists(self._isolate_deps_dir):
      shutil.rmtree(self._isolate_deps_dir)

  def Remap(self, isolate_abs_path, isolated_abs_path,
            path_variables=None, config_variables=None):
    """Remaps data dependencies into |self._isolate_deps_dir|.

    Args:
      isolate_abs_path: The absolute path to the .isolate file, which specifies
        data dependencies in the source tree.
      isolated_abs_path: The absolute path to the .isolated file, which is
        generated by isolate.py and specifies data dependencies in
        |self._isolate_deps_dir| and their digests.
      path_variables: A dict containing everything that should be passed
        as a |--path-variable| to the isolate script. Defaults to the return
        value of |DefaultPathVariables()|.
      config_variables: A dict containing everything that should be passed
        as a |--config-variable| to the isolate script. Defaults to the return
        value of |DefaultConfigVariables()|.
    Raises:
      Exception if the isolate command fails for some reason.
    """
    if not path_variables:
      path_variables = DefaultPathVariables()
    if not config_variables:
      config_variables = DefaultConfigVariables()

    isolate_cmd = [
      sys.executable, _ISOLATE_SCRIPT, 'remap',
      '--isolate', isolate_abs_path,
      '--isolated', isolated_abs_path,
      '--outdir', self._isolate_deps_dir,
    ]
    for k, v in path_variables.iteritems():
      isolate_cmd.extend(['--path-variable', k, v])
    for k, v in config_variables.iteritems():
      isolate_cmd.extend(['--config-variable', k, v])

    if cmd_helper.RunCmd(isolate_cmd):
      raise Exception('isolate command failed: %s' % ' '.join(isolate_cmd))

  def VerifyHardlinks(self):
    """Checks |isolate_deps_dir| for a hardlink.

    Returns:
      True if a hardlink is found.
      False if nothing is found.
    Raises:
      Exception if a non-hardlink is found.
    """
    for root, _, filenames in os.walk(self._isolate_deps_dir):
      if filenames:
        linked_file = os.path.join(root, filenames[0])
        orig_file = os.path.join(
            self._isolate_deps_dir,
            os.path.relpath(linked_file, self._isolate_deps_dir))
        if os.stat(linked_file).st_ino == os.stat(orig_file).st_ino:
          return True
        else:
          raise Exception('isolate remap command did not use hardlinks.')
    return False

  def PurgeExcluded(self, deps_exclusion_list):
    """Deletes anything on |deps_exclusion_list| from |self._isolate_deps_dir|.

    Args:
      deps_exclusion_list: A list of globs to exclude from the isolate
        dependency directory.
    """
    excluded_paths = (
        x for y in deps_exclusion_list
        for x in glob.glob(
            os.path.abspath(os.path.join(self._isolate_deps_dir, y))))
    for p in excluded_paths:
      if os.path.isdir(p):
        shutil.rmtree(p)
      else:
        os.remove(p)

  def MoveOutputDeps(self):
    """Moves files from the output directory to the top level of
      |self._isolate_deps_dir|.

    Moves pak files from the output directory to to <isolate_deps_dir>/paks
    Moves files from the product directory to <isolate_deps_dir>
    """
    # On Android, all pak files need to be in the top-level 'paks' directory.
    paks_dir = os.path.join(self._isolate_deps_dir, 'paks')
    os.mkdir(paks_dir)

    deps_out_dir = os.path.join(
        self._isolate_deps_dir,
        os.path.relpath(os.path.join(constants.GetOutDirectory(), os.pardir),
                        constants.DIR_SOURCE_ROOT))
    for root, _, filenames in os.walk(deps_out_dir):
      for filename in fnmatch.filter(filenames, '*.pak'):
        shutil.move(os.path.join(root, filename), paks_dir)

    # Move everything in PRODUCT_DIR to top level.
    deps_product_dir = os.path.join(deps_out_dir, constants.GetBuildType())
    if os.path.isdir(deps_product_dir):
      for p in os.listdir(deps_product_dir):
        shutil.move(os.path.join(deps_product_dir, p), self._isolate_deps_dir)
      os.rmdir(deps_product_dir)
      os.rmdir(deps_out_dir)


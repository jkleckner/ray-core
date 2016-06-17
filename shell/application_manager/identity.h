// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef SHELL_APPLICATION_MANAGER_IDENTITY_H_
#define SHELL_APPLICATION_MANAGER_IDENTITY_H_

#include "url/gurl.h"

namespace shell {

/**
 * Represents the identity of an application. |url| is the url of the
 * application. |qualifier| is a string that allows to tie a specific instance
 * of an application to another. It is used by content handlers that need to be
 * run in the context of another application.
 */
struct Identity {
  Identity(const GURL& url, const std::string& qualifier);
  explicit Identity(const GURL& url);
  bool operator<(const Identity& other) const;

  const GURL url;
  const std::string qualifier;
};

}  // namespace shell

#endif  // SHELL_APPLICATION_MANAGER_IDENTITY_H_

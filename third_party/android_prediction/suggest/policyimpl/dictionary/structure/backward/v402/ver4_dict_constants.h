/*
 * Copyright (C) 2013, The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * !!!!! DO NOT EDIT THIS FILE !!!!!
 *
 * This file was generated from
 *   suggest/policyimpl/dictionary/structure/v4/ver4_dict_constants.h
 */

#ifndef LATINIME_BACKWARD_V402_VER4_DICT_CONSTANTS_H
#define LATINIME_BACKWARD_V402_VER4_DICT_CONSTANTS_H

#include "third_party/android_prediction/defines.h"

namespace latinime {
namespace backward {
namespace v402 {

// TODO: Create PtConstants under the pt_common and move some constant values there.
// Note that there are corresponding definitions in FormatSpec.java.
class Ver4DictConstants {
 public:
    static const char *const TRIE_FILE_EXTENSION;
    static const char *const HEADER_FILE_EXTENSION;
    static const char *const FREQ_FILE_EXTENSION;
    static const char *const TERMINAL_ADDRESS_TABLE_FILE_EXTENSION;
    static const char *const BIGRAM_FILE_EXTENSION;
    static const char *const BIGRAM_LOOKUP_TABLE_FILE_EXTENSION;
    static const char *const BIGRAM_CONTENT_TABLE_FILE_EXTENSION;
    static const char *const SHORTCUT_FILE_EXTENSION;
    static const char *const SHORTCUT_LOOKUP_TABLE_FILE_EXTENSION;
    static const char *const SHORTCUT_CONTENT_TABLE_FILE_EXTENSION;

    static const int MAX_DICTIONARY_SIZE;
    static const int MAX_DICT_EXTENDED_REGION_SIZE;

    static const int NOT_A_TERMINAL_ID;
    static const int PROBABILITY_SIZE;
    static const int FLAGS_IN_PROBABILITY_FILE_SIZE;
    static const int TERMINAL_ADDRESS_TABLE_ADDRESS_SIZE;
    static const int NOT_A_TERMINAL_ADDRESS;
    static const int TERMINAL_ID_FIELD_SIZE;
    static const int TIME_STAMP_FIELD_SIZE;
    static const int WORD_LEVEL_FIELD_SIZE;
    static const int WORD_COUNT_FIELD_SIZE;

    static const int BIGRAM_ADDRESS_TABLE_BLOCK_SIZE;
    static const int BIGRAM_ADDRESS_TABLE_DATA_SIZE;
    static const int SHORTCUT_ADDRESS_TABLE_BLOCK_SIZE;
    static const int SHORTCUT_ADDRESS_TABLE_DATA_SIZE;

    static const int BIGRAM_FLAGS_FIELD_SIZE;
    static const int BIGRAM_TARGET_TERMINAL_ID_FIELD_SIZE;
    static const int INVALID_BIGRAM_TARGET_TERMINAL_ID;
    static const int BIGRAM_PROBABILITY_MASK;
    static const int BIGRAM_HAS_NEXT_MASK;
    // Used when bigram list has time stamp.
    static const int BIGRAM_LARGE_PROBABILITY_FIELD_SIZE;

    static const int SHORTCUT_FLAGS_FIELD_SIZE;
    static const int SHORTCUT_PROBABILITY_MASK;
    static const int SHORTCUT_HAS_NEXT_MASK;

 private:
    DISALLOW_IMPLICIT_CONSTRUCTORS(Ver4DictConstants);
};
} // namespace v402
} // namespace backward
} // namespace latinime
#endif /* LATINIME_BACKWARD_V402_VER4_DICT_CONSTANTS_H */

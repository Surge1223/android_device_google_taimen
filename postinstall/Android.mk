#
# Copyright 2018, The Android Open Source Project
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use, copy,
# modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

LOCAL_PATH:= $(call my-dir)

avb_common_cflags := \
    -D_FILE_OFFSET_BITS=64 \
    -D_POSIX_C_SOURCE=199309L \
    -Wa,--noexecstack \
    -Werror \
    -fPIC \
    -Wall \
    -Wextra \
    -Wformat=2 \
    -Wno-psabi \
    -Wno-unused-parameter \
    -ffunction-sections \
    -fstack-protector-strong

avb_common_cppflags := \
    -Wnon-virtual-dtor \
    -fno-strict-aliasing

avb_common_ldflags := \
    -static

common_includes := \
   $(LOCAL_PATH)/include  \
   frameworks/native/include \
   frameworks/base/include \
   system/core/libutils/include \
   system/core/include \
   system/core/base/include

include $(CLEAR_VARS)
LOCAL_MODULE := avb_custom
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)
LOCAL_C_INCLUDES := $(common_includes)
LOCAL_CLANG := true
LOCAL_CFLAGS := $(avb_common_cflags) -DAVB_COMPILATION -DAVB_ENABLE_DEBUG
LOCAL_CPPFLAGS := $(avb_common_cppflags)
LOCAL_LDFLAGS := $(avb_common_ldflags)
LOCAL_STATIC_LIBRARIES := \
    libavb_user \
    libfs_mgr \
    libbase \
    liblog

LOCAL_SRC_FILES := \
    avb_custom.cpp
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_EXECUTABLE)

# - Try to find ILMBase
# Once done, this will define
#
#  ILMBase_FOUND - system has ILMBase
#  ILMBase_INCLUDE_DIRS - the ILMBase include directories
#  ILMBase_LIBRARIES - link these to use ILMBase
# questions: jason.p.marshall at gmail dot com
#
include(LibFindMacros)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(ILMBase_PKGCONF ILMBase)

# Include dir
find_path(ILMBase_INCLUDE_DIR
  NAMES OpenEXR
  PATHS ${ILMBase_PKGCONF_INCLUDE_DIRS}
  )

set(ILMBase_INCLUDE_DIR ${ILMBase_INCLUDE_DIR}/OpenEXR)

# Library location
find_library(ILMBaseHalf_LIBRARY
  NAMES Half
  PATHS ${ILMBase_PKGCONF_LIBRARY_DIRS}
  )

find_library(ILMBaseIex_LIBRARY
  NAMES Iex
  PATHS ${ILMBase_PKGCONF_LIBRARY_DIRS}
  )

find_library(ILMBaseIexMath_LIBRARY
  NAMES IexMath
  PATHS ${ILMBase_PKGCONF_LIBRARY_DIRS}
  )

find_library(ILMBaseIlmImf_LIBRARY
  NAMES IlmImf
  PATHS ${ILMBase_PKGCONF_LIBRARY_DIRS}
  )

find_library(ILMBaseIlmImfUtil_LIBRARY
  NAMES IlmImfUtil
  PATHS ${ILMBase_PKGCONF_LIBRARY_DIRS}
  )

find_library(ILMBaseIlmThread_LIBRARY
  NAMES IlmThread
  PATHS ${ILMBase_PKGCONF_LIBRARY_DIRS}
  )

find_library(ILMBaseImath_LIBRARY
  NAMES Imath
  PATHS ${ILMBase_PKGCONF_LIBRARY_DIRS}
  )

# Set the include dir variables and the libraries
# NOTE: Singular variables for this library, plural for libraries this lib depends on.
set(ILMBase_PROCESS_INCLUDES ILMBase_INCLUDE_DIR)
set(ILMBase_PROCESS_LIBS ILMBaseHalf_LIBRARY ILMBaseIex_LIBRARY ILMBaseIexMath_LIBRARY ILMBaseIlmImf_LIBRARY ILMBaseIlmImfUtil_LIBRARY ILMBaseIlmThread_LIBRARY ILMBaseImath_LIBRARY)
libfind_process(ILMBase)

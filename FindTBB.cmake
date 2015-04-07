# - Try to find TBB
# Once done, this will define
#
#  TBB_FOUND - system has TBB
#  TBB_INCLUDE_DIRS - the TBB include directories
#  TBB_LIBRARIES - link these to use TBB
# questions: jason.p.marshall at gmail dot com
#
include(LibFindMacros)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(TBB_PKGCONF TBB)

# Include dir
find_path(TBB_INCLUDE_DIR
  NAMES tbb
  PATHS ${TBB_PKGCONF_INCLUDE_DIRS}
  )

set(TBB_INCLUDE_DIR ${TBB_INCLUDE_DIR}/tbb)

find_library(TBB_LIBRARY
  NAMES tbb
  PATHS ${TBB_PKGCONF_LIBRARY_DIRS}
  )

find_library(TBBMALLOC_LIBRARY
  NAMES tbbmalloc
  PATHS ${TBB_PKGCONF_LIBRARY_DIRS}
  )

find_library(TBBMALLOCPROXY_LIBRARY
  NAMES tbbmalloc_proxy
  PATHS ${TBB_PKGCONF_LIBRARY_DIRS}
  )

# Set the include dir variables and the libraries
# NOTE: Singular variables for this library, plural for libraries this lib depends on.
set(TBB_PROCESS_INCLUDES TBB_INCLUDE_DIR)
set(TBB_PROCESS_LIBS TBB_LIBRARY TBBMALLOC_LIBRARY TBBMALLOCPROXY_LIBRARY)
libfind_process(TBB)
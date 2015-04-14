# - Try to find TBB
# Once done, this will define
#
#  TBB_FOUND - system has TBB
#  TBB_INCLUDE_DIRS - the TBB include directories
#  TBB_LIBRARIES - link these to use TBB
# questions: jason.p.marshall at gmail dot com
#

find_path(TBB_INCLUDE_DIR tbb)

find_library(TBB_LIBRARY NAMES tbb)
find_library(TBBMALLOC_LIBRARY NAMES tbbmalloc)
find_library(TBBMALLOCPROXY_LIBRARY NAMES tbbmalloc_proxy)

# handle the QUIETLY and REQUIRED arguments and set TBB_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(TBB DEFAULT_MSG TBB_LIBRARY TBBMALLOC_LIBRARY TBBMALLOCPROXY_LIBRARY TBB_INCLUDE_DIR)

if(TBB_FOUND)
  set(TBB_LIBRARIES ${TBB_LIBRARY} ${TBBMALLOC_LIBRARY} ${TBBMALLOCPROXY_LIBRARY})
endif()

mark_as_advanced(TBB_INCLUDE_DIR TBB_LIBRARY TBB_LIBRARIES)

if(0)
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
endif()
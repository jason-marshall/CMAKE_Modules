# - Try to find BLOSC
# Once done, this will define
#
#  BLOSC_FOUND - system has BLOSC
#  BLOSC_INCLUDE_DIR - the BLOSC include directories
#  BLOSC_LIBRARIES - link these to use BLOSC
# questions: jason.p.marshall at gmail dot com
#

find_path(BLOSC_INCLUDE_DIR blosc.h)

find_library(BLOSC_LIBRARY NAMES blosc)

# handle the QUIETLY and REQUIRED arguments and set BLOSC_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(BLOSC DEFAULT_MSG BLOSC_LIBRARY BLOSC_INCLUDE_DIR)

if(BLOSC_FOUND)
  set(BLOSC_LIBRARIES ${BLOSC_LIBRARY})
endif()

mark_as_advanced(BLOSC_INCLUDE_DIR BLOSC_LIBRARY BLOSC_LIBRARIES)

if(0)
include(LibFindMacros)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(BLOSC_PKGCONF BLOSC)

# Include dir
find_path(BLOSC_INCLUDE_DIR
  NAMES blosc.h
  PATHS ${BLOSC_PKGCONF_INCLUDE_DIRS}
  )

# Library location
find_library(BLOSC_LIBRARY
  NAMES blosc
  PATHS ${BLOSC_PKGCONF_LIBRARY_DIRS}
  )

# Set the include dir variables and the libraries
# NOTE: Singular variables for this library, plural for libraries this lib depends on.
set(BLOSC_PROCESS_INCLUDES BLOSC_INCLUDE_DIR)
set(BLOSC_PROCESS_LIBS BLOSC_LIBRARY)
libfind_process(BLOSC)
endif()
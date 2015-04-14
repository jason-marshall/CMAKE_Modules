# - Try to find OpenVDB
# Once done, this will define
#
#  OpenVDB_FOUND - system has OpenVDB
#  OpenVDB_INCLUDE_DIRS - the OpenVDB include directories
#  OpenVDB_LIBRARIES - link these to use OpenVDB
# questions: jason.p.marshall at gmail dot com
#

find_path(OpenVDB_INCLUDE_DIR openvdb)

find_library(OpenVDB_LIBRARY NAMES openvdb)

# handle the QUIETLY and REQUIRED arguments and set OpenVDB_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(OpenVDB DEFAULT_MSG OpenVDB_LIBRARY OpenVDB_INCLUDE_DIR)

if(OpenVDB_FOUND)
  set(OpenVDB_LIBRARIES ${OpenVDB_LIBRARY})
endif()

mark_as_advanced(OpenVDB_INCLUDE_DIR OpenVDB_LIBRARY OpenVDB_LIBRARIES)

if(0)
include(LibFindMacros)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(OpenVDB_PKGCONF OpenVDB)

# Include dir
find_path(OpenVDB_INCLUDE_DIR
  NAMES openvdb
  PATHS ${OpenVDB_PKGCONF_INCLUDE_DIRS}
  )

# Finally the library itself
find_library(OpenVDB_LIBRARY
  NAMES openvdb
  PATHS ${OpenVDB_PKGCONF_LIBRARY_DIRS}
)

set(OpenVDB_INCLUDE_DIR ${OpenVDB_INCLUDE_DIR}/OpenVDB)

# Set the include dir variables and the libraries
# NOTE: Singular variables for this library, plural for libraries this lib depends on.
set(OpenVDB_PROCESS_INCLUDES OpenVDB_INCLUDE_DIR )
set(OpenVDB_PROCESS_LIBS OpenVDB_LIBRARY)
libfind_process(OpenVDB)
endif()
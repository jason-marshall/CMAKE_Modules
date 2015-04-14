# - Try to find OpenEXR
# Once done, this will define
#
#  OpenEXR_FOUND - system has OpenEXR
#  OpenEXR_INCLUDE_DIRS - the OpenEXR include directories
# questions: jason.p.marshall at gmail dot com
#

find_path(OpenEXR_INCLUDE_DIR OpenEXR)

# handle the QUIETLY and REQUIRED arguments and set OpenEXR_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(OpenEXR DEFAULT_MSG OpenEXR_INCLUDE_DIR)

mark_as_advanced(OpenEXR_INCLUDE_DIR)

if(0)
include(LibFindMacros)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(OpenEXR_PKGCONF OpenEXR)

# Include dir
find_path(OpenEXR_INCLUDE_DIR
  NAMES OpenEXR
  PATHS ${OpenEXR_PKGCONF_INCLUDE_DIRS}
  )

set(OpenEXR_INCLUDE_DIR ${OpenEXR_INCLUDE_DIR}/OpenEXR)

# Set the include dir variables and the libraries
# NOTE: Singular variables for this library, plural for libraries this lib depends on.
set(OpenEXR_PROCESS_INCLUDES OpenEXR_INCLUDE_DIR)
libfind_process(OpenEXR)
endif()
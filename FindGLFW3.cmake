# - Try to find GLFW3
# Once done, this will define
#
#  GLFW3_FOUND - system has GLFW3
#  GLFW3_INCLUDE_DIRS - the GLFW3 include directories
#  GLFW3_LIBRARIES - link these to use GLFW3
# questions: jason.p.marshall at gmail dot com
#

find_path(GLFW3_INCLUDE_DIR GLFW)

find_library(GLFW3_LIBRARY NAMES glfw)

# handle the QUIETLY and REQUIRED arguments and set GLFW3_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GLFW3 DEFAULT_MSG GLFW3_LIBRARY GLFW3_INCLUDE_DIR)

if(GLFW3_FOUND)
  set(GLFW3_LIBRARIES ${GLFW3_LIBRARY})
endif()

mark_as_advanced(GLFW3_INCLUDE_DIR GLFW3_LIBRARY GLFW3_LIBRARIES)

if(0)
include(LibFindMacros)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(GLFW3_PKGCONF GLFW3)

# Include dir
find_path(GLFW3_INCLUDE_DIR
  NAMES GLFW
  PATHS ${GLFW3_PKGCONF_INCLUDE_DIRS}
  )

set(GLFW3_INCLUDE_DIR ${GLFW3_INCLUDE_DIR}/GLFW)

# Library location
find_library(GLFW3_LIBRARY
  NAMES glfw
  PATHS ${GLFW3_PKGCONF_LIBRARY_DIRS}
  )

# Set the include dir variables and the libraries
# NOTE: Singular variables for this library, plural for libraries this lib depends on.
set(GLFW3_PROCESS_INCLUDES GLFW3_INCLUDE_DIR)
set(GLFW3_PROCESS_LIBS GLFW3_LIBRARY)
libfind_process(GLFW3)
endif()
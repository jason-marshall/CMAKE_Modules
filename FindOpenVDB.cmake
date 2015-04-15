# - Try to find OpenVDB
# Once done, this will define
#
#  OpenVDB_FOUND - system has OpenVDB
#  OpenVDB_INCLUDE_DIRS - the OpenVDB include directories
#  OpenVDB_LIBRARIES - link these to use OpenVDB
# questions: jason.p.marshall at gmail dot com
#

find_path(OpenVDB_INCLUDE_DIRS openvdb)

find_library(OpenVDB_LIBRARY NAMES openvdb)

# handle the QUIETLY and REQUIRED arguments and set OpenVDB_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(OpenVDB DEFAULT_MSG OpenVDB_LIBRARY OpenVDB_INCLUDE_DIRS)

if(OpenVDB_FOUND)
  set(OpenVDB_LIBRARIES ${OpenVDB_LIBRARY})
endif()

mark_as_advanced(OpenVDB_INCLUDE_DIRS OpenVDB_LIBRARY OpenVDB_LIBRARIES)

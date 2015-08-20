# - Try to find H5PART
# Once done, this will define
#
#  H5PART_FOUND - system has H5PART
#  H5PART_INCLUDE_DIR - the H5PART include directories
#  H5PART_LIBRARIES - link these to use H5PART
# questions: jason.p.marshall at gmail dot com
#

find_path(H5PART_INCLUDE_DIR H5Part.h)

find_library(H5PART_LIBRARY NAMES H5Part)

# handle the QUIETLY and REQUIRED arguments and set H5PART_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(H5PART DEFAULT_MSG H5PART_LIBRARY H5PART_INCLUDE_DIR)

if(H5PART_FOUND)
  set(H5PART_LIBRARIES ${H5PART_LIBRARY})
endif()

mark_as_advanced(H5PART_INCLUDE_DIR H5PART_LIBRARY H5PART_LIBRARIES)

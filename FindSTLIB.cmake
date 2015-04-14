# - Try to find STLIB
# Once done, this will define
#
#  STLIB_FOUND - system has STLIB
#  STLIB_INCLUDE_DIR - the STLIB include directories
#  STLIB_LIBRARIES - link these to use STLIB
# questions: jason.p.marshall at gmail dot com
#

find_path(STLIB_INCLUDE_DIR stlib)

# handle the QUIETLY and REQUIRED arguments and set STLIB_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(STLIB DEFAULT_MSG STLIB_INCLUDE_DIR)

mark_as_advanced(STLIB_INCLUDE_DIR)

# - Try to find GTENGINE
# Once done, this will define
#
#  GTENGINE_FOUND - system has GTENGINE
#  GTENGINE_INCLUDE_DIR - the GTENGINE include directories
#  GTENGINE_LIBRARIES - link these to use GTENGINE
# questions: jason.p.marshall at gmail dot com
#

find_path(GTENGINE_INCLUDE_DIR gtengine)

find_library(GTENGINE_LIBRARY NAMES gtengine)

# handle the QUIETLY and REQUIRED arguments and set GTENGINE_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GTENGINE DEFAULT_MSG GTENGINE_INCLUDE_DIR GTENGINE_LIBRARY)

mark_as_advanced(GTENGINE_INCLUDE_DIR GTENGINE_LIBRARY)

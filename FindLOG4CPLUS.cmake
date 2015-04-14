# - Try to find LOG4CPLUS
# Once done, this will define
#
#  LOG4CPLUS_FOUND - system has LOG4CPLUS
#  LOG4CPLUS_INCLUDE_DIRS - the LOG4CPLUS include directories
#  LOG4CPLUS_LIBRARIES - link these to use LOG4CPLUS
# questions: jason.p.marshall at gmail dot com
#

find_path(LOG4CPLUS_INCLUDE_DIR log4cplus)

find_library(LOG4CPLUS_LIBRARY NAMES log4cplus)

# handle the QUIETLY and REQUIRED arguments and set LOG4CPLUS_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LOG4CPLUS DEFAULT_MSG LOG4CPLUS_LIBRARY LOG4CPLUS_INCLUDE_DIR)

if(LOG4CPLUS_FOUND)
  set(LOG4CPLUS_LIBRARIES ${LOG4CPLUS_LIBRARY})
endif()

mark_as_advanced(LOG4CPLUS_INCLUDE_DIR LOG4CPLUS_LIBRARY LOG4CPLUS_LIBRARIES)

# - Try to find LOG4CPLUS
# Once done, this will define
#
#  LOG4CPLUS_FOUND - system has LOG4CPLUS
#  LOG4CPLUS_INCLUDE_DIRS - the LOG4CPLUS include directories
#  LOG4CPLUS_LIBRARIES - link these to use LOG4CPLUS
# questions: jason.p.marshall at gmail dot com
#
include(LibFindMacros)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(LOG4CPLUS_PKGCONF LOG4CPLUS)

# Include dir
find_path(LOG4CPLUS_INCLUDE_DIR
  NAMES log4cplus
  PATHS ${LOG4CPLUS_PKGCONF_INCLUDE_DIRS}
  )

set(LOG4CPLUS_INCLUDE_DIR ${LOG4CPLUS_INCLUDE_DIR}/log4cplus)

# Library location
find_library(LOG4CPLUS_LIBRARY
  NAMES log4cplus
  PATHS ${LOG4CPLUS_PKGCONF_LIBRARY_DIRS}
  )

# Set the include dir variables and the libraries
# NOTE: Singular variables for this library, plural for libraries this lib depends on.
set(LOG4CPLUS_PROCESS_INCLUDES LOG4CPLUS_INCLUDE_DIR)
set(LOG4CPLUS_PROCESS_LIBS LOG4CPLUS_LIBRARY)
libfind_process(LOG4CPLUS)

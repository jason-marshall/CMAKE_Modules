# An external project for stlib
set(stlib_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/stlib")
set(stlib_file "https://bitbucket.org/seanmauch/stlib.git")

# If Windows we use CMake, otherwise ./configure
if(WIN32)

else()
  ExternalProject_Add(stlib
    # specify location
    PREFIX ${stlib_prefix}
    # download
    GIT_REPOSITORY ${stlib_file}
    # install location
    INSTALL_DIR ${INSTALL_DIRECTORY}
    BUILD_IN_SOURCE 1
    CONFIGURE_COMMAND ""
    INSTALL_COMMAND ""
    )
endif()

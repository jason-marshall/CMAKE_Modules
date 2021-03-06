# An external project for stlib
set(stlib_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/stlib")
set(stlib_file "https://github.com/jason-marshall/STLIB")

# If Windows we use CMake, otherwise ./configure
if(WIN32)

else()
  ExternalProject_Add(stlib
    DEPENDS ${STLIB_DEPENDENCIES}
    # specify location
    PREFIX ${stlib_prefix}
    # download
    GIT_REPOSITORY ${stlib_file}
    # install location
    INSTALL_DIR ${INSTALL_DIRECTORY}
    BUILD_IN_SOURCE 1
    BUILD_COMMAND ""
    CONFIGURE_COMMAND ""
    INSTALL_COMMAND cp -r ${stlib_prefix}/src/stlib/stlib ${CMAKE_INSTALL_PREFIX}/include/stlib
    )
endif()

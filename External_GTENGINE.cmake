# An external project for gtengine
set(gtengine_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/gtengine")
set(gtengine_git "https://github.com/jason-marshall/GeometricToolsTweak.git")

# If Windows we use CMake, otherwise ./configure
if(WIN32)

else()
  ExternalProject_Add(gtengine
    # specify location
    PREFIX ${gtengine_prefix}
    # download
    GIT_REPOSITORY ${gtengine_git}
    # install location
    INSTALL_DIR ${INSTALL_DIRECTORY}
    BUILD_IN_SOURCE 1
    BUILD_COMMAND cd ${gtengine_prefix}/src/gtengine && make CFG=Release -f makeengine.gte
    CONFIGURE_COMMAND ""
    INSTALL_COMMAND mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/prefix/include/gtengine &&  sh -c "cp -r ${gtengine_prefix}/src/gtengine/Include/* ${CMAKE_CURRENT_BINARY_DIR}/prefix/include/gtengine/." && cp ${gtengine_prefix}/src/gtengine/lib/ReleaseStatic/libgtengine.a ${CMAKE_CURRENT_BINARY_DIR}/prefix/lib/libgtengine.a
    )
endif()


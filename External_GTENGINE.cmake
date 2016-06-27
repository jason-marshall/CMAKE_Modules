# An external project for gtengine
set(gtengine_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/gtengine")
set(gtengine_file "http://www.geometrictools.com/Downloads/GeometricToolsEngine3p0.zip")

# If Windows we use CMake, otherwise ./configure
if(WIN32)

else()
  ExternalProject_Add(gtengine
    # specify location
    PREFIX ${gtengine_prefix}
    # download
    URL ${gtengine_file}
    # install location
    INSTALL_DIR ${INSTALL_DIRECTORY}
    BUILD_IN_SOURCE 1
    BUILD_COMMAND cd ${gtengine_prefix}/src/gtengine/GTEngine && make CFG=Release -f makeengine.gte
    CONFIGURE_COMMAND ""
    INSTALL_COMMAND mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/prefix/include/gtengine &&  sh -c "cp -r ${gtengine_prefix}/src/gtengine/GTEngine/Include/* ${CMAKE_CURRENT_BINARY_DIR}/prefix/include/gtengine/." && ln -sfv ${gtengine_prefix}/src/gtengine/GTEngine/lib/ReleaseStatic/libgtengine.a ${CMAKE_CURRENT_BINARY_DIR}/prefix/lib/libgtengine.so
    )
endif()


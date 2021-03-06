# An external project for gtengine
set(gtengine_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/gtengine")
set(gtengine_url "https://www.geometrictools.com/Downloads/GeometricToolsEngine3p8.zip")
set(GTE_PATH "${gtengine_prefix}/src/gtengine/GTEngine")

# If Windows we use CMake, otherwise ./configure
if(WIN32)

else()
  ExternalProject_Add(gtengine
    # specify location
    PREFIX ${gtengine_prefix}
    # download
    URL ${gtengine_url}
    # install location
    INSTALL_DIR ${INSTALL_DIRECTORY}
    BUILD_IN_SOURCE 1
    BUILD_COMMAND cd ${GTE_PATH}  && make CFG=Release -f makeengine.gte
    CONFIGURE_COMMAND ""
    INSTALL_COMMAND mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/prefix/include/gtengine &&  sh -c "cp -r ${gtengine_prefix}/src/gtengine/GTEngine/Include/* ${CMAKE_CURRENT_BINARY_DIR}/prefix/include/gtengine/." && cp ${gtengine_prefix}/src/gtengine/GTEngine/lib/Release/libgtengine.a ${CMAKE_CURRENT_BINARY_DIR}/prefix/lib/libgtengine.a
    )
endif()


# An external project for example
set(example_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/example")

# switch between operating systems
if(WIN32)

else()
  ExternalProject_Add(example
    DEPENDS openvdb
    # specify location
    PREFIX ${example_prefix}
    # src location
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src
    # install location
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
    )

  ExternalProject_Add_Step(example forcebuild
    COMMAND ${CMAKE_COMMAND} -E echo "Force build of example"
    DEPENDERS configure
    ALWAYS 1
  )
endif()

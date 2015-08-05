# An external project for cdemlab
set(cdemlab_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/cdemlab")

# switch between operating systems
if(WIN32)

else()
  ExternalProject_Add(cdemlab
    DEPENDS ${CDEMLAB_DEPENDENCIES}
    # specify location
    PREFIX ${cdemlab_prefix}
    # src location
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/cdemlab
    # install location
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> 
    )

  #ExternalProject_Add_Step(example forcebuild
  #  COMMAND ${CMAKE_COMMAND} -E echo "Force build of example"
  #  DEPENDERS configure
  #  ALWAYS 1
  #)
endif()

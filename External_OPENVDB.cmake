# An external project for openvdb
set(openvdb_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/openvdb")
set(openvdb_git "https://github.com/jason-marshall/openvdb.git")

# switch between operating systems
if(WIN32)

else()
  ExternalProject_Add(openvdb
    DEPENDS ${OPENVDB_DEPENDENCIES}
    PREFIX ${openvdb_prefix}
    # specify location
    #DOWNLOAD_DIR ${openvdb_download}
    GIT_REPOSITORY ${openvdb_git}
    PATCH_COMMAND ""
    UPDATE_COMMAND ""
    # source directory
    #SOURCE_DIR ${openvdb_prefix}/src
    # install location
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    )

  #ExternalProject_Add_Step(openvdb forcebuild
  #  COMMAND ${CMAKE_COMMAND} -E echo "Force build of openvdb"
  #  DEPENDERS configure
   # ALWAYS 1
  #)
endif()

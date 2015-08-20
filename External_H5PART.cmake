# An external project for h5part
set(h5part_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/h5part")
set(h5part_md5 b540db502c5fa42078249f43d18a4652)
set(h5part_file "http://download.savannah.nongnu.org/releases/openexr/h5part-2.2.0.tar.gz")

# switch between operating systems
if(WIN32)

else()
  ExternalProject_Add(h5part
    # specify build location
    PREFIX ${h5part_prefix}
    # download stuff
    URL ${h5part_file}
    URL_MD5 ${h5part_md5}
    # install directory
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=<INSTALL_DIR> --enable-parallel)
endif()

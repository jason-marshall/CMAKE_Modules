# An external project for h5part
set(h5part_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules")
set(h5part_md5 bd4b558e0ad55624cc1681760ac7d217)
set(h5part_file "https://github.com/jason-marshall/H5PartFix/archive/v1.0.tar.gz")

# switch between operating systems
if(WIN32)

else()
  ExternalProject_Add(h5part
    DEPENDS ${H5PART_DEPENDENCIES}
    # specify build location
    PREFIX ${h5part_prefix}
    # download stuff
    URL ${h5part_file}
    URL_MD5 ${h5part_md5}
    # install directory
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=<INSTALL_DIR> --enable-parallel PHDF5ROOT=${CMAKE_INSTALL_PREFIX}
    )
endif()

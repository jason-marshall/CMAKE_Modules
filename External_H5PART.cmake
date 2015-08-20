# An external project for h5part
set(h5part_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules")
set(h5part_md5 327c63d198e38a12565b74cffdf1f9d7)
set(h5part_file "https://codeforge.lbl.gov/frs/download.php/file/387/H5Part-1.6.6.tar.gz")

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

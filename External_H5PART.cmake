# An external project for h5part
set(h5part_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/h5part")
set(h5part_md5 b540db502c5fa42078249f43d18a4652)
set(h5part_file "https://codeforge.lbl.gov/frs/download.php/latestzip/18/h5part-latest.zip")

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
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=<INSTALL_DIR> --enable-parallel --with-hdf5path=${CMAKE_INSTALL_PREFIX})
endif()

# An external project for hdf5
set(hdf5_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules")

# switch between operating systems
if(WIN32)

else()
  set(hdf5_file "https://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.8.17.tar.gz")
  set(hdf5_md5 7d572f8f3b798a628b8245af0391a0ca)
  ExternalProject_Add(hdf5
    # specify build location
    PREFIX ${hdf5_prefix}
    # download stuff
    URL ${hdf5_file}
    URL_MD5 ${hdf5_md5}
    PATCH_COMMAND ""
    UPDATE_COMMAND ""
    # install directory
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=<INSTALL_DIR> --enable-parallel
    )
endif()

# An external project for boost
set(boost_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/boost")
set(boost_file "http://sourceforge.net/projects/boost/files/boost/1.58.0/boost_1_58_0.zip/download")

if(WIN32)
  message("Need to add boost for windows build.")
else()
  ExternalProject_Add(boost
    # specify build location
    PREFIX ${boost_prefix}
    # download stuff
    URL ${boost_file}
    # patch command fix
    PATCH_COMMAND ""
    # build in source
    BUILD_IN_SOURCE 1
    # configure command
    CONFIGURE_COMMAND ""
    # install directory
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    INSTALL_COMMAND <SOURCE_DIR>/bootstrap.sh --prefix=<INSTALL_DIR> --with-libraries=all
    )
endif()

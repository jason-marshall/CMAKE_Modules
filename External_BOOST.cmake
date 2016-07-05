# An external project for boost
set(boost_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/Boost")
set(boost_file "http://sourceforge.net/projects/boost/files/boost/1.61.0/boost_1_61_0.zip/download")
set(boost_md5 015ae4afa6f3e597232bfe1dab949ace)

if(WIN32)
  message("Need to add boost for windows build.")
else()
  ExternalProject_Add(Boost
    # specify build location
    PREFIX ${boost_prefix}
    # download stuff
    URL ${boost_file}
    URL_MD5 ${boost_md5}
    # patch command fix
    PATCH_COMMAND ""
    # build in source
    BUILD_IN_SOURCE 1
    BUILD_COMMAND ""
    # configure command
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    CONFIGURE_COMMAND <SOURCE_DIR>/bootstrap.sh --prefix=<INSTALL_DIR> --with-libraries=all
    # install command
    INSTALL_COMMAND <SOURCE_DIR>/b2 install
    )
endif()

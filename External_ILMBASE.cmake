# An external project for ilmbase
set(ilmbase_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/ilmbase")
set(ilmbase_md5 b540db502c5fa42078249f43d18a4652)
set(ilmbase_file "http://download.savannah.nongnu.org/releases/openexr/ilmbase-2.2.0.tar.gz")

# switch between operating systems
if(WIN32)

else()
  ExternalProject_Add(ilmbase
    # specify build location
    PREFIX ${ilmbase_prefix}
    # download stuff
    URL ${ilmbase_file}
    URL_MD5 ${ilmbase_md5}
    # install directory
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=<INSTALL_DIR>)
endif()

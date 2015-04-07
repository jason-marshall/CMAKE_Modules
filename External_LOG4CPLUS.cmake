# An external project for log4cplus
set(log4cplus_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/log4cplus")
set(log4cplus_md5 cace04c30fbc94a9f54eb573904e8baf)
set(log4cplus_file "http://sourceforge.net/projects/log4cplus/files/log4cplus-stable/1.2.0/log4cplus-1.2.0-rc3.tar.xz/download")

# switch between operating systems
if(WIN32)

else()
  ExternalProject_Add(log4cplus
    # specify build location
    PREFIX ${log4cplus_prefix}
    # download stuff
    URL ${log4cplus_file}
    URL_MD5 ${log4cplus_md5}
    # install directory
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    )

  ExternalProject_Add_Step(log4cplus forcebuild
    COMMAND ${CMAKE_COMMAND} -E echo "Force build of log4cplus"
    DEPENDERS configure
    ALWAYS 1
  )
endif()

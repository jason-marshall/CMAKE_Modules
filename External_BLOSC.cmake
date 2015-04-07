# An external project for blosc
set(blosc_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/blosc")
set(blosc_md5 487d0cb7635862a8435c67b9fe01abfa)
set(blosc_file "https://github.com/Blosc/c-blosc/archive/v1.5.2.tar.gz")

# switch between operating systems
if(WIN32)

else()
  ExternalProject_Add(blosc
    # specify location
    PREFIX ${blosc_prefix}
    # download
    URL ${blosc_file}
    URL_MD5 ${blosc_md5}
    # install location
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    )

  ExternalProject_Add_Step(blosc forcebuild
    COMMAND ${CMAKE_COMMAND} -E echo "Force build of blosc"
    DEPENDERS configure
    ALWAYS 1
  )
endif()

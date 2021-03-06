# An external project for zlib
set(zlib_download "${CMAKE_CURRENT_BINARY_DIR}/modules/download")
set(zlib_source  "${CMAKE_CURRENT_BINARY_DIR}/modules/src/zlib")
set(zlib_build   "${CMAKE_CURRENT_BINARY_DIR}/modules/build/zlib")
set(zlib_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/zlib")
set(zlib_md5 1c9f62f0778697a09d36121ead88e08e)
set(zlib_file "http://zlib.net/zlib-1.2.11.tar.gz")

# If Windows we use CMake, otherwise ./configure
# seriously doubt that zlib works on windows
if(WIN32)
  ExternalProject_Add(zlib
    DOWNLOAD_DIR ${zlib_download}
    SOURCE_DIR ${zlib_source}
    BINARY_DIR ${zlib_build}
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    URL ${zlib_file}
    URL_MD5 ${zlib_md5}
    PATCH_COMMAND ${CMAKE_COMMAND} -E remove <SOURCE_DIR>/zconf.h
    CMAKE_CACHE_ARGS
    -DCMAKE_CXX_FLAGS:STRING=${pv_tpl_cxx_flags}
    -DCMAKE_C_FLAGS:STRING=${pv_tpl_c_flags}
    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_CFG_INTDIR}
    ${pv_tpl_compiler_args}
    ${zlib_EXTRA_ARGS}
    CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>)

  # the zlib library should be named zlib1.lib not zlib.lib
  ExternalProject_Add_Step(zlib RenameLib
    COMMAND ${CMAKE_COMMAND} -E copy "${zlib_install}/lib/zlib.lib"
    "${zlib_install}/lib/zlib1.lib"
    DEPENDEES install)

  #  set(ZLIB_LIBRARY "${zlib_install}/lib/zlib1.${link_library_suffix}")
else()
  ExternalProject_Add(zlib
    # specify build location
    PREFIX ${zlib_prefix}
    # download stuff
    URL ${zlib_file}
    URL_MD5 ${zlib_md5}
    # patch command fix
    PATCH_COMMAND ${CMAKE_COMMAND} -E remove <SOURCE_DIR>/zconf.h
    PATCH_COMMAND ""
    # build in source
    BUILD_IN_SOURCE 1
    # install director
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=<INSTALL_DIR>)
endif()

# An external project for tbb
set(tbb_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/tbb")
set(tbb_md5 e903dd92d9433701f097fa7ca29a3c1f)
set(tbb_file "https://www.threadingbuildingblocks.org/sites/default/files/software_releases/source/tbb43_20141204oss_src.tgz")

# If Windows we use CMake, otherwise ./configure
if(WIN32)

elseif(APPLE)
  ExternalProject_Add(tbb
    # specify build location
    PREFIX ${tbb_prefix}
    # download stuff
    URL ${tbb_file}
    URL_MD5 ${tbb_md5}
    # configure stuff
    CONFIGURE_COMMAND ""
    # build stuff
    BUILD_IN_SOURCE 1
    BUILD_COMMAND make
    # install stuff
    INSTALL_COMMAND cp -r ${tbb_prefix}/src/tbb/include/tbb ${CMAKE_INSTALL_PREFIX}/include/. && cp -r ${tbb_prefix}/src/tbb/include/serial ${CMAKE_INSTALL_PREFIX}/include/. && sh -c "rm -f ${INSTALL_DIRECTORY}/lib/libtbb* && ln -s ${tbb_prefix}/src/tbb/build/*_release/libtbb.dylib ${INSTALL_DIRECTORY}/lib/libtbb.dylib && ln -s ${tbb_prefix}/src/tbb/build/*_release/libtbbmalloc.dylib ${INSTALL_DIRECTORY}/lib/libtbbmalloc.dylib  && ln -s ${tbb_prefix}/src/tbb/build/*_release/libtbbmalloc_proxy.dylib ${INSTALL_DIRECTORY}/lib/libtbbmalloc_proxy.dylib"
    )
  ExternalProject_Add_Step(tbb forcebuild
    COMMAND ${CMAKE_COMMAND} -E echo "Force build of tbb"
    DEPENDERS configure
    ALWAYS 1
    )

else()
  ExternalProject_Add(tbb
    # specify build location
    PREFIX ${tbb_prefix}
    # download stuff
    URL ${tbb_file}
    URL_MD5 ${tbb_md5}
    # configure stuff
    CONFIGURE_COMMAND ""
    # build stuff
    BUILD_IN_SOURCE 1
    BUILD_COMMAND make
    # install stuff
    INSTALL_COMMAND cp -r ${tbb_prefix}/src/tbb/include/tbb ${CMAKE_INSTALL_PREFIX}/include/. && cp -r ${tbb_prefix}/src/tbb/include/serial ${CMAKE_INSTALL_PREFIX}/include/. && sh -c "rm -f ${INSTALL_DIRECTORY}/lib/libtbb* && ln -s ${tbb_prefix}/src/tbb/build/*_release/libtbb.so.2 ${INSTALL_DIRECTORY}/lib/libtbb.so.2 && ln -s ${INSTALL_DIRECTORY}/lib/libtbb.so.2 ${INSTALL_DIRECTORY}/lib/libtbb.so && ln -s ${tbb_prefix}/src/tbb/build/*_release/libtbbmalloc.so.2 ${INSTALL_DIRECTORY}/lib/libtbbmalloc.so.2 && ln -s ${INSTALL_DIRECTORY}/lib/libtbbmalloc.so.2 ${INSTALL_DIRECTORY}/lib/libtbbmalloc.so && ln -s ${tbb_prefix}/src/tbb/build/*_release/libtbbmalloc_proxy.so.2 ${INSTALL_DIRECTORY}/lib/libtbbmalloc_proxy.so.2 && ln -s ${INSTALL_DIRECTORY}/lib/libtbbmalloc_proxy.so.2 ${INSTALL_DIRECTORY}/lib/libtbbmalloc_proxy.so"
    )
  ExternalProject_Add_Step(tbb forcebuild
    COMMAND ${CMAKE_COMMAND} -E echo "Force build of tbb"
    DEPENDERS configure
    ALWAYS 1
    )

endif()

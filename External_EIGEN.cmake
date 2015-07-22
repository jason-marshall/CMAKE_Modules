# An external project for eigen
set(eigen_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/eigen")
set(eigen_file "http://bitbucket.org/eigen/eigen/get/3.2.5.tar.gz")

# If Windows we use CMake, otherwise ./configure
if(WIN32)

else()
  ExternalProject_Add(eigen
    # specify location
    PREFIX ${eigen_prefix}
    # download
    URL ${eigen_file}
    # install stuff
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
    )
endif()

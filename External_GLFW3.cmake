# An external project for glfw
set(glfw_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/glfw")
set(glfw_md5 b2e23b153fad3034ec48336f81eefd33)
set(glfw_file "https://github.com/glfw/glfw.git")

find_package(OpenGL REQUIRED)
include_directories(${OPENGL_INCLUDE_DIR})

# switch between operating systems
if(WIN32)

else()
  ExternalProject_Add(glfw
    # specify build location
    PREFIX ${glfw_prefix}
    # download stuff
    GIT_REPOSITORY ${glfw_file}
    URL_MD5 ${glfw_md5}
    # install directory and shared library option
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DBUILD_SHARED_LIBS=ON
    )

  ExternalProject_Add_Step(glfw forcebuild
    COMMAND ${CMAKE_COMMAND} -E echo "Force build of glfw"
    DEPENDERS configure
    ALWAYS 1
    )
endif()

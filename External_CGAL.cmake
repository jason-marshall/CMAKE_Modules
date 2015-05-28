# An external project for CGAL
set(CGAL_prefix "${CMAKE_CURRENT_BINARY_DIR}/modules/CGAL")
set(CGAL_git "https://github.com/CGAL/releases.git")

# switch between operating systems
if(WIN32)

else()
  ExternalProject_Add(CGAL
    DEPENDS ${CGAL_DEPENDENCIES}
    PREFIX ${CGAL_prefix}
    # specify location
    #DOWNLOAD_DIR ${CGAL_download}
    GIT_REPOSITORY ${CGAL_git}
    PATCH_COMMAND ""
    UPDATE_COMMAND ""
    # install location
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    )
endif()

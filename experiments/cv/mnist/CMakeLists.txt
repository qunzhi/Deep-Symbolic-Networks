find_package(PythonInterp REQUIRED)
find_package(PythonLibs REQUIRED)
find_package(PythonExtensions REQUIRED)
find_package(Numpy)
find_package(Cython REQUIRED)

file(COPY . DESTINATION ${CMAKE_CURRENT_BINARY_DIR} FILES_MATCHING PATTERN "*.py")
file(COPY . DESTINATION ${CMAKE_CURRENT_BINARY_DIR} FILES_MATCHING PATTERN "*-ubyte")

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

add_cython_target(loader loader.pyx CXX)
add_library(loader MODULE ${loader} utils.cpp)
# target_link_libraries(_mnist)
python_extension_module(loader)


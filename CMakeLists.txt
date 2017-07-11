cmake_minimum_required(VERSION 3.8)
project(DSN)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_LIST_DIR}/cmake)

SET(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# configure a header file to pass some of the CMake settings
# to the source code
configure_file(
  "${PROJECT_SOURCE_DIR}/dsn_config.h.in"
  "${PROJECT_BINARY_DIR}/dsn_config.h"
  )

include_directories("${PROJECT_BINARY_DIR}")

IF( EXISTS "${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json" )
  EXECUTE_PROCESS( COMMAND ${CMAKE_COMMAND} -E copy_if_different
    ${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json
    ${CMAKE_CURRENT_SOURCE_DIR}/compile_commands.json
  )
ENDIF()

add_subdirectory(experiments)


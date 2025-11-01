cmake_minimum_required(VERSION 3.10)

project(alloc C)


set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_C_FLAGS "-g -O0 -Wall -Wextra -Wshadow -Wconversion -Wuninitialized -pedantic \
            -std=c23 -fsanitize=address -fno-omit-frame-pointer -fstack-protector-strong -save-temps")

add_custom_target(clean_temps
    COMMAND ${CMAKE_COMMAND} -E remove -f ${CMAKE_BINARY_DIR}/*.i
    COMMAND ${CMAKE_COMMAND} -E remove -f ${CMAKE_BINARY_DIR}/*.s
    COMMAND ${CMAKE_COMMAND} -E remove -f ${CMAKE_BINARY_DIR}/*.bc
    COMMAND ${CMAKE_COMMAND} -E remove -f ${CMAKE_BINARY_DIR}/*alloc
    COMMENT "Deleting temps .i, .s, and .bc files"
)

add_executable(alloc alloc.c)


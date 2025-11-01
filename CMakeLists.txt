cmake_minimum_required(VERSION 3.10)

project(alloc C)


set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_C_FLAGS "-g3 -fverbose-asm -finstrument-functions -O0 -Wfloat-equal -Wall -Wextra -Wformat=2 -Wshadow -Wcast-align -Wconversion -Wuninitialized -pedantic \
            -std=c23 -fsanitize=address -fsanitize=undefined -fsanitize-trap -Werror-implicit-function-declaration \
            -save-temps -Wno-unused-parameter -Wno-unused-function -Wno-sign-conversion")

add_custom_target(clean_temps
    COMMAND ${CMAKE_COMMAND} -E remove -f ${CMAKE_BINARY_DIR}/*.i
    COMMAND ${CMAKE_COMMAND} -E remove -f ${CMAKE_BINARY_DIR}/*.s
    COMMAND ${CMAKE_COMMAND} -E remove -f ${CMAKE_BINARY_DIR}/*.bc
    COMMAND ${CMAKE_COMMAND} -E remove -f ${CMAKE_BINARY_DIR}/*alloc
    COMMENT "Deleting temps .i, .s, and .bc files"
)

add_executable(alloc alloc.c trace.c)


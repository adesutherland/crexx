cmake_minimum_required(VERSION 3.17)
project(CREXX)

add_subdirectory(re2c)
add_subdirectory(lemon)
add_subdirectory(platform)
add_subdirectory(avl_tree)
add_subdirectory(compiler)
add_subdirectory(machine)
add_subdirectory(assembler)
add_subdirectory(disassembler)
add_subdirectory(interpreter)
add_subdirectory(tests)

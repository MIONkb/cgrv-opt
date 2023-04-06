cmake_minimum_required(VERSION 3.13.4)
project(cgra-opt LANGUAGES CXX C)

set(CMAKE_BUILD_WITH_INSTALL_NAME_DIR ON)

set(CMAKE_CXX_STANDARD 17 CACHE STRING "C++ standard to conform to")

find_package(MLIR REQUIRED CONFIG)

message(STATUS "Using MLIRConfig.cmake in: ${MLIR_DIR}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

set(LLVM_RUNTIME_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/bin)
set(LLVM_LIBRARY_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/lib)
set(MLIR_BINARY_DIR ${CMAKE_BINARY_DIR})
set(RAAA_LIB_DIR ${CMAKE_BINARY_DIR}/lib)

list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(TableGen)
include(AddLLVM)
include(AddMLIR)
include(HandleLLVMOptions)
include(MLIRDetectPythonEnv)

if(MLIR_ENABLE_BINDINGS_PYTHON)
  include(MLIRDetectPythonEnv)
  mlir_configure_python_dev_packages()
endif()

set(LLVM_INCLUDE_DIRS "/home/tianyi/MLIRCGRA/llvm-project/build/include")
set(LLVM_LIBRARY_DIRS "/home/tianyi/MLIRCGRA/llvm-project/build/lib")

link_directories(${LLVM_LIBRARY_DIRS})
include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${MLIR_INCLUDE_DIRS})
include_directories(${PROJECT_SOURCE_DIR}/include)
include_directories(${PROJECT_BINARY_DIR}/include)
link_directories(${LLVM_BUILD_LIBRARY_DIR})
add_definitions(${LLVM_DEFINITIONS})

# if(MLIR_ENABLE_BINDINGS_PYTHON)
#   message(STATUS "Enabling SODA-OPT Python API")
#   add_subdirectory(python)
# else()
#   message(STATUS "SODA-OPT Python bindings are disabled.")
# endif()

message("[test] Before include ")
add_subdirectory(include/RAAA)
message("[test] Before lib ")
add_subdirectory(lib)
# message("[test] Before test ")
# add_subdirectory(test)
message("[test] Before tools ")
add_subdirectory(tools)
# message("[test] Before llvm_plugins/lib ")
# add_subdirectory(llvm_plugins/lib)

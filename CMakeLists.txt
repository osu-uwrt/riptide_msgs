cmake_minimum_required(VERSION 3.8)
project(riptide_msgs2)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(std_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(trajectory_msgs REQUIRED)

# Grab all message files 
file(GLOB msg_sources RELATIVE ${PROJECT_SOURCE_DIR} msg/*.msg)
file(GLOB srv_sources RELATIVE ${PROJECT_SOURCE_DIR} srv/*.srv)
file(GLOB act_sources RELATIVE ${PROJECT_SOURCE_DIR} action/*.action)
#message("Grabbing messages ${msg_sources}")

#generate messages
rosidl_generate_interfaces(${PROJECT_NAME}
  ${msg_sources}
  ${act_sources}
  ${srv_sources}
  DEPENDENCIES geometry_msgs std_msgs sensor_msgs trajectory_msgs
)
ament_export_dependencies(rosidl_default_runtime)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # uncomment the line when a copyright and license is not present in all source files
  #set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # uncomment the line when this package is not in a git repo
  #set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()

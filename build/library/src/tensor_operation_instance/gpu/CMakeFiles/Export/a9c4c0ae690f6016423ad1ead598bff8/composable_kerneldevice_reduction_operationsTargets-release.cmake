#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "composable_kernel::device_reduction_operations" for configuration "Release"
set_property(TARGET composable_kernel::device_reduction_operations APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(composable_kernel::device_reduction_operations PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libdevice_reduction_operations.a"
  )

list(APPEND _cmake_import_check_targets composable_kernel::device_reduction_operations )
list(APPEND _cmake_import_check_files_for_composable_kernel::device_reduction_operations "${_IMPORT_PREFIX}/lib/libdevice_reduction_operations.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)

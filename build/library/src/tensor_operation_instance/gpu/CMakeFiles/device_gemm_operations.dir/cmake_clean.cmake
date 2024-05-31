file(REMOVE_RECURSE
  "../../../../lib/libdevice_gemm_operations.a"
  "../../../../lib/libdevice_gemm_operations.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/device_gemm_operations.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()

file(REMOVE_RECURSE
  "../../bin/test_gemm_add"
  "../../bin/test_gemm_add.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/test_gemm_add.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()

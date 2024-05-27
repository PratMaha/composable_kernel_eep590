
        file(GLOB_RECURSE GSRCS  /work1/sadasivan/student30/composable_kernel/library/src/*.cpp /work1/sadasivan/student30/composable_kernel/library/src/*.hpp /work1/sadasivan/student30/composable_kernel/library/src/*.cxx /work1/sadasivan/student30/composable_kernel/library/src/*.c /work1/sadasivan/student30/composable_kernel/library/src/*.h)
        set(CPPCHECK_COMMAND
            CPPCHECK_EXE-NOTFOUND
            -q
            # -v
            # --report-progress
            --force
            --cppcheck-build-dir=/work1/sadasivan/student30/composable_kernel/build_new/cppcheck-build
            --platform=native
            --template=gcc
            --error-exitcode=1
            -j 128
             -DCPPCHECK=1 -D__linux__=1
            
             -I/work1/sadasivan/student30/composable_kernel/include -I/work1/sadasivan/student30/composable_kernel/build_new/include -I/work1/sadasivan/student30/composable_kernel/library/include
            --enable=warning,style,performance,portability
            --inline-suppr
            --suppressions-list=/work1/sadasivan/student30/composable_kernel/build_new/cppcheck-supressions
             ${GSRCS}
        )
        string(REPLACE ";" " " CPPCHECK_SHOW_COMMAND "${CPPCHECK_COMMAND}")
        message("${CPPCHECK_SHOW_COMMAND}")
        execute_process(
            COMMAND ${CPPCHECK_COMMAND}
            WORKING_DIRECTORY /work1/sadasivan/student30/composable_kernel
            RESULT_VARIABLE RESULT
        )
        if(NOT RESULT EQUAL 0)
            message(FATAL_ERROR "Cppcheck failed")
        endif()

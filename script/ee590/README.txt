This README provides an explanation of the scripts / data submitted in this folder.

NOTE: A lot of the scripts in this file were made / used with specific paths on the system in mind. With more time, we would have modified 
these scripts to be more robust, but we ran out of time towards the end of the project and had to focus on higher priority tasks.

data/ 
    cache_analysis/ [contains the supporting / intermediate data files used to generate the L1 Cache Hit Rate plots]
        omniperf_analysis_out/
            omniperf[0-50].txt [omniperf analysis files for runs with varying k-batch values]
        cache_analysis.txt [summary of omniperf analysis files formatted for plotting]

    perf_analysis/
        untuned_perf_analysis.txt [k-batch, perf, tflops, bandwidth data formatted for plotting for the unchanged kernel]
        b64_perf_output.txt [few k-batch values and perf for optimized block size 64 kernel]
        b256_perf_output.txt [few k-batch values and perf for optimized block size 256 kernel]

    profiling/
        b256_k1_profile.txt [omniperf analysis for optimized kernel, block size 256, k-batch 1]
        b256_k8_profile.txt [omniperf analysis for optimized kernel, block size 256, k-batch 8]
        b64_k4_profile.txt [omniperf analysis for optimized kernel, block size 64, k-batch 4]

scripts/
    omniperf_profile/ [contains python / slurm scripts for automating omniperf analysis across many k-batch values]
    omniperf_profile_batches/ [contains scripts that batch omniperf analysis into batches less than max execution time]
    perf_profile/
        perf_profile.py/.sh [python / slurm scripts for collecting perf information across many k-batch values]
        rocprof_perf_profile.py [for collecting perf info from rocprof across many k-batch values (not used after TA advised not to use rocprof)]
    log_plot.py [script used to visualize the results from the ck_profiler]
    job_template.sh [template for slurm jobs provided by TA team]
    run_kernel.sh [simple script to run the kernel in slurm]
    profile_kernel.sh [simple script to profile the kernel in slurm]


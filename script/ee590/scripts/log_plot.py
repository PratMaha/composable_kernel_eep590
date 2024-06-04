import re
import pandas as pd
import matplotlib.pyplot as plt

file_path = "./ckprofiler_mi100_log"

with open(file_path, 'r') as file:
    file_contents = file.read()


# Define the pattern to extract relevant data
pattern = re.compile(
    r"Perf:\s*(\d+\.\d+)\s*ms, (\d+\.\d+) TFlops, (\d+\.\d+) GB/s, GemmXdlSplitKCShuffle_MNKPadding_RRR_"
    r"(B\d+)_Vec(\d+x\d+x\d+_\d+x\d+x\d+x\d+).*?KBatch (\d+)\n(.*?)\nmax err: (\d+\.\d+), number of errors: (\d+), (\d+\.\d+)% wrong values",
    re.DOTALL
)

# Find all matches
matches = pattern.findall(file_contents)

# Store the extracted data
data = []
for match in matches:
    perf_ms = float(match[0])
    tflops = float(match[1])
    gbps = float(match[2])
    b_param = match[3]
    vec_param = match[4]
    kbatch = int(match[5])
    error_details = match[6]
    max_err = float(match[7])
    num_errors = int(match[8])
    wrong_values_percentage = float(match[9])
    data.append([perf_ms, tflops, gbps, b_param, vec_param, kbatch, error_details, max_err, num_errors, wrong_values_percentage])

# Define column names
columns = ["Perf (ms)", "TFLOPS", "GB/s", "B Parameter", "Vec Parameter", "KBatch", "Error Details", "Max Error", "Number of Errors", "% Wrong Values"]
df = pd.DataFrame(data, columns=columns)

print(df.head())

# Save the DataFrame to a CSV file
df.to_csv('./gemm_splitk_performance_data.csv', index=False)

# Filter the DataFrame for B Parameter = B128 for plot
df = df[df["B Parameter"] == "B128"]

# Group by Vec Parameter and KBatch, then calculate the mean for each group (only numeric columns)
df_avg = df.groupby(['Vec Parameter', 'KBatch']).mean(numeric_only=True).reset_index()
plt.figure(figsize=(10, 6))
for key, grp in df_avg.groupby('Vec Parameter'):
    plt.plot(grp['KBatch'], grp['Perf (ms)'], label=f'{key}')


plt.xlabel("KBatch")
plt.ylabel("Perf (ms)")
plt.ylim(0, 25)
plt.title("(B128) Avg Performance vs KBatch with B and Vector Parameters")
plt.legend(title="B & Vector Parameters", bbox_to_anchor=(1.05, 1), loc='upper left')
plt.grid(True)
plt.tight_layout()


# Save the plot to a file
plot_file_path = "./performance_vs_kbatch.png"
plt.savefig(plot_file_path)

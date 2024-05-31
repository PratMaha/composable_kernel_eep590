# Copy this file in studentXX folder
# Assuming you have done completed building for composable_kernel
import subprocess
import sys
import re
from matplotlib import pyplot as plt

## INPUTS ##
k_list = list(range(1,360))
run_kernel = True

# Change regex here for getting other values
regex = r"(\d+\.\d+)% wrong values"
# regex = r"max err: (\d+\.\d+)"
# regex = r"Perf: (\d+\.\d+) ms"

command_list = [f"/work1/sadasivan/student36/composable_kernel/build/bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 {k}" for k in k_list]

def run_kernel_and_record_logs(command_list):
    # Run commands and write output to file (Since it takes long time to run the command)

    print("INFO: Created new log file")
    with open("output.txt", "w") as file:
        file.write(f"Start Logging:\n")
  
    output = ""
    output2 = ""
    for command in command_list:
        try:
            result = subprocess.run(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
            output = result.stdout
        except Exception as e:
            print(f"ERROR: {e}")
            sys.exit()

        with open("output.txt", "a") as file:
            file.write(f"Command: {command}\n")
            file.write("Output:\n")
            file.write(output)
            file.write("\n")

        try:
            result = subprocess.run(command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
            output2 = result.stdout + result.stderr
        except subprocess.CalledProcessError as e:
            output2 = e.stderr
        except Exception as e:
            print(f"ERROR: {e}")
            sys.exit()

        with open("output.txt", "a") as file:
            file.write(output2)
            file.write("\n")

        print(f"INFO: processing done for command: {command}")

if run_kernel:
    run_kernel_and_record_logs(command_list)

# Open the file and read content
with open("output.txt", "r") as file:
    out_str = file.read()

wrong_values_list = []
pattern = re.compile(regex)
wrong_values_list = pattern.findall(out_str)
wrong_values_list = [float(x) for x in wrong_values_list]
print(wrong_values_list)

# Create a figure and an axes
fig, ax = plt.subplots()
ax.plot(k_list, wrong_values_list)
# Set title and labels
ax.set_title('Plot')
ax.set_xlabel('values of k')
ax.set_ylabel('error %')
fig.tight_layout()
# Save the plot
plt.savefig('test.png')

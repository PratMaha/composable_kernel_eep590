import matplotlib.pyplot as plt

x_time = []
y_time = []

x_tflops = []
y_tflops = []

#Set you trial number
trial = 15

# First plot i over time
with open(f"output_{trial}.txt") as file:
    for line in file:
        tokens = line.split()
        x_time.append(int(tokens[0]))
        y_time.append(float(tokens[1]))

plt.figure()
plt.plot(x_time, y_time)
plt.xlabel("Iteration")
plt.ylabel("Total execution time (ms)")
plt.title("Total time (ms) vs. Iteration")

# Save the plot to a PNG file before showing it
plt.savefig(f"plot_time_{trial}.png")

# Write the best execution time to the file
min_time = min(y_time)
min_time_index = y_time.index(min_time)
with open(f"best_values_{trial}.txt", 'a') as file:
    file.write(f"Best execution time: {min_time} at index {min_time_index}\n")

# Plot k over TFlops
with open(f"output_{trial}.txt") as file:
    for line in file:
        tokens = line.split()
        x_tflops.append(int(tokens[0]))
        y_tflops.append(float(tokens[2]))

plt.figure()
plt.plot(x_tflops, y_tflops)
plt.xlabel("Iteration")
plt.ylabel("TFlops")
plt.title("TFlops vs. Iteration")

# Save the plot to a PNG file before showing it
plt.savefig(f"plot_tflops_{trial}.png")

# Write the best TFlops to the file
max_tflops = max(y_tflops)
max_tflops_index = y_tflops.index(max_tflops)
with open(f"best_values_{trial}.txt", 'a') as file:
    file.write(f"Best TFlops: {max_tflops} at index {max_tflops_index}\n")

# Calculate the average performance after the first 5 iterations
average_time = sum(y_time[5:]) / len(y_time[5:]) if len(y_time) > 5 else 0
average_tflops = sum(y_tflops[5:]) / len(y_tflops[5:]) if len(y_tflops) > 5 else 0

# Save the average performance to a new file
with open(f"average_performance_{trial}.txt", 'w') as file:
    file.write(f"Average execution time after first 5 iterations: {average_time}\n")
    file.write(f"Average TFlops after first 5 iterations: {average_tflops}\n")

# Further potential investigations
# x = []
# y = []
# #Error Plot over k
# with open(f"output2_{trial}.txt") as file:
#     for line in file:
#         tokens = line.split(" ")
#         x.append(int(tokens[0]))
#         y.append(float(tokens[3]))
# plt.figure()
# plt.plot(x,y)
# plt.xlabel(" k value")


# plt.ylabel("Error %")
# plt.title("Error % vs. k")

# # Save the plot to a PNG file before showing it
# plt.savefig(f"plot_error_{trial}.png")

# # Write the best (minimum) error to the file
# min_error = min(y)
# min_error_index = y.index(min_error)
# with open(f"best_values_{trial}.txt", 'a') as file:
#     file.write(f"Best Error: {min_error} at index {min_error_index}\n")

# x = []
# y = []
# #Error L2chace miss over k
# with open(f"output3_{trial}.txt") as file:
#     lines = file.readlines()

# # Select every second line starting from the second line
# selected_lines = lines[1::3]
# it = 1
# for line in selected_lines:
#     tokens = line.split(",")
#     x.append(it)
#     y.append(float(tokens[-1]))
#     it += 1

# plt.figure()
# plt.plot(x,y)
# plt.xlabel("Index")
# plt.ylabel("L2CacheHit")
# plt.title("L2CacheHit vs. Index")


# # Save the plot to a PNG file before showing it
# plt.savefig(f"plot_L2cachemiss_{trial}.png")

# # Write the best L2CacheHit to the file
# max_l2cachehit = max(y)
# max_l2cachehit_index = y.index(max_l2cachehit)
# with open(f"best_values_{trial}.txt", 'a') as file:
#     file.write(f"Best L2CacheHit: {max_l2cachehit} at index {max_l2cachehit_index}\n")



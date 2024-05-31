import json

## INPUTS ##
# Path to analysis.txt
file_path = "/work1/sadasivan/student17/composable_kernel/build/results/"
# Change file name here
file_name = "analysis.txt"
output_json_file = "output.json"

# Open the file and read content
with open(file_path + file_name, "r") as file:
    data = file.read()

# Split the data into lines
lines = data.strip().split('\n')

# Extract rows
rows = []
line_no = 0
result = {}
for line in lines:
    if line.startswith('╒'):
        table_start = line_no
        header_line = lines[table_start+1]
        headers = [h.strip() for h in header_line.split('│')[1:-1]]
    if "╛" in line:
        for line in lines[table_start+2:line_no]:
            if not line.startswith('│'):
                continue
            row = [item.strip() for item in line.split('│')[1:-1]]
            if row[0] == '':
                rows[-1][1] += row[1]
            else:
                rows.append(row)

        row_dict = {}
        for row in rows:
            row_dict[row[0]] = {}
            for row_data, header in zip(row[1:], headers[1:]):
                row_dict[row[0]][header] = row_data
        result[lines[table_start-1]] = row_dict
    line_no += 1

# Open json file and dump the dictionary with indentation
with open(output_json_file, 'w') as file:
    json.dump(result, file, indent=4)
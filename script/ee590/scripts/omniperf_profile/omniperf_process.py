outfile = open('cache_analysis.txt', 'w')

for k in range(50):
    file = open(f'omniperf_analysis_out/omniperf{k}.txt', 'r')
    for line in file.readlines():
        if line[0] == '│':
            tokens = line.split('│')
            if tokens[1].strip() == '16.1.3':
                outfile.write(f'{k} {tokens[3].strip()}\n')

    file.close()

outfile.close()

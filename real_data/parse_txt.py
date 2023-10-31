FILE = "real_data/Test_Balboa_20231031_15h18.txt"
import csv
with open(FILE) as f, open('{}.csv'.format(FILE[:-4]), 'w', newline='') as o:
    writer = csv.writer(o)
    for line in f:
        writer.writerow(line.split())
using DelimitedFiles
FILE = "real_data/Test_Balboa_20231027_13h53.csv"

m = readdlm(FILE, ',', Int, '\n')

freq = 100                          # [Hz]

v_list = m[:, 1] .* (6.0 / 512.0)   # [V]
phi_list = m[:, 3] ./ 1000.0        # [deg] 
phi_dot_list = m[:, 4] ./ 1000.0    # [deg / s]

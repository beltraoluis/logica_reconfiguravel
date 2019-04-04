vcom -reportprogress 300 -work work D:/Documents/a906867/Projeosquartus/dec_2_4_N_v0/dec_2_4_n_v0.vhd
vcom -reportprogress 300 -work work D:/Documents/a906867/Projeosquartus/dec_2_4_N_v0/dec_2_4_n_v0_tb.vhd
vsim work.dec_2_4_n_v0_tb
add wave -r /*
run 250 ns
vcom -reportprogress 300 -work work D:/Documents/a906867/Projeosquartus/controleFluxo/Fifo.vhd
vcom -reportprogress 300 -work work D:/Documents/a906867/Projeosquartus/controleFluxo/fifo_tb.vhd
vsim rtl_work.fifo_tb
add wave -r /*
run 1600ns
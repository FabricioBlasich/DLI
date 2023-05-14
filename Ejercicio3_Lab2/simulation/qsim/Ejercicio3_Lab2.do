onerror {quit -f}
vlib work
vlog -work work Ejercicio3_Lab2.vo
vlog -work work Ejercicio3_Lab2.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Ejercicio3_Lab2_vlg_vec_tst
vcd file -direction Ejercicio3_Lab2.msim.vcd
vcd add -internal Ejercicio3_Lab2_vlg_vec_tst/*
vcd add -internal Ejercicio3_Lab2_vlg_vec_tst/i1/*
add wave /*
run -all

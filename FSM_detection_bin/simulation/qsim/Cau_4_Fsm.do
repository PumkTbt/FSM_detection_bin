onerror {quit -f}
vlib work
vlog -work work Cau_4_Fsm.vo
vlog -work work Cau_4_Fsm.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Cau_4_Fsm_vlg_vec_tst
vcd file -direction Cau_4_Fsm.msim.vcd
vcd add -internal Cau_4_Fsm_vlg_vec_tst/*
vcd add -internal Cau_4_Fsm_vlg_vec_tst/i1/*
add wave /*
run -all

vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../projectvfikvyhbi.srcs/sources_1/ip/rojobot31_0/src/bot31_if.v" \
"../../../../projectvfikvyhbi.srcs/sources_1/ip/rojobot31_0/src/bot31_pgm.v" \
"../../../../projectvfikvyhbi.srcs/sources_1/ip/rojobot31_0/src/kcpsm6.v" \
"../../../../projectvfikvyhbi.srcs/sources_1/ip/rojobot31_0/src/bot31_top.v" \
"../../../../projectvfikvyhbi.srcs/sources_1/ip/rojobot31_0/sim/rojobot31_0.v" \


vlog -work xil_defaultlib \
"glbl.v"


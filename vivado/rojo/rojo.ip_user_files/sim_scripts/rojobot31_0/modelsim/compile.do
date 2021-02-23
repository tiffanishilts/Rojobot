vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../rojo.srcs/sources_1/ip/rojobot31_0/src/bot31_if.v" \
"../../../../rojo.srcs/sources_1/ip/rojobot31_0/src/bot31_pgm.v" \
"../../../../rojo.srcs/sources_1/ip/rojobot31_0/src/kcpsm6.v" \
"../../../../rojo.srcs/sources_1/ip/rojobot31_0/src/bot31_top.v" \
"../../../../rojo.srcs/sources_1/ip/rojobot31_0/sim/rojobot31_0.v" \


vlog -work xil_defaultlib \
"glbl.v"


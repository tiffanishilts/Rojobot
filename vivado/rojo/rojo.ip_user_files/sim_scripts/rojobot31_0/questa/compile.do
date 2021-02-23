vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../rojo.srcs/sources_1/ip/rojobot31_0/src/bot31_if.v" \
"../../../../rojo.srcs/sources_1/ip/rojobot31_0/src/bot31_pgm.v" \
"../../../../rojo.srcs/sources_1/ip/rojobot31_0/src/kcpsm6.v" \
"../../../../rojo.srcs/sources_1/ip/rojobot31_0/src/bot31_top.v" \
"../../../../rojo.srcs/sources_1/ip/rojobot31_0/sim/rojobot31_0.v" \


vlog -work xil_defaultlib \
"glbl.v"


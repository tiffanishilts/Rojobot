vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../projectvfikvyhbi.srcs/sources_1/ip/rojobot31_0/src/bot31_if.v" \
"../../../../projectvfikvyhbi.srcs/sources_1/ip/rojobot31_0/src/bot31_pgm.v" \
"../../../../projectvfikvyhbi.srcs/sources_1/ip/rojobot31_0/src/kcpsm6.v" \
"../../../../projectvfikvyhbi.srcs/sources_1/ip/rojobot31_0/src/bot31_top.v" \
"../../../../projectvfikvyhbi.srcs/sources_1/ip/rojobot31_0/sim/rojobot31_0.v" \


vlog -work xil_defaultlib \
"glbl.v"


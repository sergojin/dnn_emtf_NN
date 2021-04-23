onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib eleven2two_lut_opt

do {wave.do}

view wave
view structure
view signals

do {eleven2two_lut.udo}

run -all

quit -force

onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+eleven2two_lut -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.eleven2two_lut xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {eleven2two_lut.udo}

run -all

endsim

quit -force

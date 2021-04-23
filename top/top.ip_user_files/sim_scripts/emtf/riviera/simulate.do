onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+inject_mem_64 -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.inject_mem_64 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {inject_mem_64.udo}

run -all

endsim

quit -force

onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib inject_mem_64_opt

do {wave.do}

view wave
view structure
view signals

do {inject_mem_64.udo}

run -all

quit -force

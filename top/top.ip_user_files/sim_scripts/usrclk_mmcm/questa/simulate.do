onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib usrclk_mmcm_opt

do {wave.do}

view wave
view structure
view signals

do {usrclk_mmcm.udo}

run -all

quit -force

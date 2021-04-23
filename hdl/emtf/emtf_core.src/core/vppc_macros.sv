`timescale 1ns / 1ps
`define int integer
`define param parameter
`define genv genvar
`define localpar localparam
`define clk_drive(c, v) c = v; #10
`define __top_module__ 
`define static
`define endstatic

`define inc(a) a = a+1
`define dec(a) a = a-1
// macros for merging one-dim array into single register
// r - output register, m - array to merge, d - bit dimension of array elements, nx - array sizes 
`define merge_mem_1(r,m,d,n) reg [n*d-1:0] r; always @(*) for (i=0; i<n; i=i+1) r[i*d+: d] = m[i]
`define merge_mem_1_n(r,m,d,n) always @(*) for (i=0; i<n; i=i+1) r[i*d+: d] = m[i]
`define merge_memr_1(r,m,d,n) wire [d-1:0] m [n-1:0]; always @(*) for (i=0; i<n; i=i+1) r[i*d+: d] = m[i]

`define merge_mem_2(r,m,d,n1,n2) reg [n1*n2*d-1:0] r; always @(*) for (i=0; i<n1; i=i+1) for (j=0; j<n2; j=j+1) r[i*d*n2+j*d +: d] = m[i][j]
`define merge_memr_2(r,m,d,n1,n2) wire [d-1:0] m [n1-1:0][n2-1:0]; always @(*) for (i=0; i<n1; i=i+1) for (j=0; j<n2; j=j+1) r[i*d*n2+j*d +: d] = m[i][j]

`define merge_mem_3(r,m,d,n1,n2,n3) reg [n1*n2*n3*d-1:0] r; always @(*) for (i=0; i<n1; i=i+1) for (j=0; j<n2; j=j+1) for (k=0; k<n3; k=k+1) r[i*d*n2*n3+j*d*n3+k*d +: d] = m[i][j][k]

// macros for splitting wire into array
// m - memory, r - input wire, d - bit width, nx - dimensions
`define split_mem_1(m,r,d,n) wire [n*d-1:0] r; always @(*) for (i=0; i<n; i=i+1) m[i] = r[i*d+: d]
`define split_memr_1(m,r,d,n) reg [d-1:0] m [n-1:0]; always @(*) for (i=0; i<n; i=i+1) m[i] = r[i*d+: d]

`define split_mem_2(m,r,d,n1,n2) wire [n1*n2*d-1:0] r; always @(*) for (i=0; i<n1; i=i+1) for (j=0; j<n2; j=j+1) m[i][j] = r[i*d*n2+j*d +: d]

`define split_mem_3(m,r,d,n1,n2,n3) wire [n1*n2*n3*d-1:0] r; always @(*) for (i=0; i<n1; i=i+1) for (j=0; j<n2; j=j+1) for (k=0; k<n3; k=k+1) m[i][j][k] = r[i*d*n2*n3+j*d*n3+k*d +: d]

// memory assignment 
`define assign_mem_1(r,m,n) for (gi=0; gi<n; gi=gi+1) assign r[gi] = m[gi]
`define assign_mem_2(r,m,n1,n2) for (gi=0; gi<n1; gi=gi+1) for (gj=0; gj<n2; gj=gj+1) assign r[gi][gj] = m[gi][gj]


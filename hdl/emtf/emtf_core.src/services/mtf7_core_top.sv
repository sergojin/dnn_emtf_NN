`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2014 05:47:51 PM
// Design Name: 
// Module Name: mtf7_core_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "../core/vppc_macros.sv"

module mtf7_core_top
(
    input m_aresetn,
    input pcie_clk,
	input core_phase_inc,

	// core link
	input ext_clk_in,
	input [13:0] ext_data_in,
	output ext_clk_out,
	output [13:0] ext_data_out,

    // LHC clock
	input clk40_in_p,
	input clk40_in_n
	
);

`include "../core/spbits.sv"

    wire pcie_clk_buf, pcie_clk_ibuf;
    IBUFG pcie_clk_buff (.I(pcie_clk), .O(pcie_clk_ibuf));
    BUFG pcie_clk_bufg (.I(pcie_clk_ibuf), .O(pcie_clk_buf));
    
    wire clk40, clk40_inb, clk40_in_w;
    // clock input from PLL
    IBUFDS_GTE2 clk40_buf (.I(clk40_in_p), .IB(clk40_in_n), .CEB(1'b0), .O(clk40_in_w), .ODIV2());
    
    BUFG clk40_bufg (.I(clk40_in_w), .O(clk40_inb));

	wire clk_160, clk266;

    // AXI interfaces
    axi_in  m_axi (pcie_clk_buf, m_aresetn); // master outputs
    axi_out s_axi [1:0] (); // slave outputs
    axi_out s_axi_or (); // master inputs
    
    // OR multiplexor for AXI modules' outputs
    axi_or_mux axior 
    (
        .inp  (s_axi),
        .outp (s_axi_or)
    );
    
    wire [8:0] 	   cs [6:0];
    wire [1:0] 		  sel;
    wire [bw_addr-1:0] addr;

    wire [63:0] 	  r_in; // reg data for memory or register
    wire [63:0] 	  r_out_or; // output data from memory or register
    wire 			  we; // write enable for memory or register
	
	wire [63:0] r_out;
	assign r_out_or = r_out; // read data mux for registers
	
	wire [63:0] control_reg; // control register
	// only one bit of control register is in use (see below)
	// feel free to use other bits as needed
	wire local_inject = control_reg[1]; // inject test data
    
    wire [2047:0] inject_data; // data to be injected into user's logic
    wire [2047:0] spy_data; // data to spy on (usually outputs of user's logic)

	//assign spy_data = ~inject_data; // just loopback with inversion for testing

    // control FPGA communication module
    control_to_core_slave_axi ctoc 
    (
        .m_axi (m_axi),
        .m_axo (s_axi_or),
		
		.ext_clk_in   (ext_clk_in  ),
		.ext_data_in  (ext_data_in ),
		.ext_clk_out  (ext_clk_out ),
		.ext_data_out (ext_data_out),
		
		.core_phase_inc (core_phase_inc)
    );

	localparam CORE_LINK_MEM_OFF = 32'h80000; // must match core link memory offset in control FPGA
	localparam AP_BEG = (CORE_LINK_MEM_OFF >> 3); // memory offset in 64-bit words

	// axi to parallel bus decoder
    core_params_axi #(.BA(AP_BEG + 32'h0)) cp
    (
        .s_axi (m_axi),
        .s_axo (s_axi[0]),
        
        .cs (cs),
        .sel (sel),
        .addr (addr),
        .r_in (r_in), // input data for memory or register
        .r_out (r_out_or), // output data from memory or register
        .we (we) // write enable for memory or register
    );


	// injection and spy memory
    inject_mem_axi_64 #(.BA(AP_BEG + 32'h8000)) imem
    (
        .s_axi (m_axi),
        .s_axo (s_axi[1]),

        .clk40 (clk200), //clk40 RAR
        .inject (local_inject),
        .dout (inject_data),
        .din  (spy_data)
    );


	
    reg psen, psen_r, psen_rr;
    wire psdone;
    
    usrclk_mmcm usrclk_mmcm_
	(
		.CLK_IN1(clk40_inb), 
		.CLK_OUT1(clk_160),  
		.CLK_OUT2(clk40),
		.CLK_OUT3(clk100),
        .CLK_OUT4(clk200),
        .CLK_OUT5(clk400),
        .CLK_OUT6(clk266),   

        .PSCLK(clk40_inb),
        .PSEN(1'b0), 
        .PSINCDEC(1'b0),     
        .PSDONE(),       
        .RESET(!m_aresetn),
		.LOCKED()
	);     

	// register bank
	// this module is expandable
	// feel free to add as many r/w registers as needed
	// instructions inside
	register_bank crb
	(
		.cs (cs[6]),
		.sel (sel),
		.addr (addr),

		.r_in (r_in), 
		.r_out (r_out), 
		.we (we), 
		.control_clk (pcie_clk_buf),
		
		.control_reg (control_reg)
	);

    
    test_algo my_test_algo
    (
        .clk1 (clk200), //clk40 RAR
        .data_sel(control_reg[4]), //0 := from PCIe, 1:= from internal BlkRAM
        .data_in_strobe(local_inject),
        .data_in(inject_data[1439:0]),
        .data_out (spy_data[12+12+8+3:0])
    );        
        
          
   
endmodule

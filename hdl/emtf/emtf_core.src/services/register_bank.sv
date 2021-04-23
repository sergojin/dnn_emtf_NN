`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:50:22 08/20/2014 
// Design Name: 
// Module Name:    register_bank 
// Project Name: 
// Target Devices: 
// Tool versions: 
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

module register_bank
(
    input [8:0] cs,
    input [1:0] sel,
    input [6:0] addr,

    input [63:0] r_in, // input data for register
    output reg [63:0] r_out, // output data from register
    input we, // write enable for register
	input control_clk,
	
	output reg [63:0] control_reg
	
);

	wire [8:0] reg_addr = {sel, addr}; // combined address
	wire [31:0] fw_date;

	initial
	begin
		// set defaults for output registers here
	end
    
		
	// write logic
	always @(posedge control_clk)
	begin
		if (cs[0] && we)
		begin
			case (reg_addr)
				9'h000: begin control_reg = r_in; end
				// add more writable registers here as needed
			endcase
		end
		
	end


	// OR mux for output data
	always @(posedge control_clk)
	begin
		r_out = 64'h0;
		if (cs[0])
		begin
			case (reg_addr)
				9'h000: begin r_out = r_out | control_reg; end
				9'h018: begin r_out = r_out | fw_date; end
				// add more readable registers here as needed
				// all writable registers should also be readable
				
			endcase
		end
	end

	// firmware timestamp 
	// need to set -g USR_ACCESS option to TIMESTAMP in BitGen settings
	USR_ACCESSE2 usr_access
	(
		.DATA ( fw_date ),
		.CFGCLK (),
		.DATAVALID ()
	);

endmodule

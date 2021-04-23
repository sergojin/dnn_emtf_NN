`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:47 05/09/2014 
// Design Name: 
// Module Name:    control_to_core_axi 
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
module control_to_core_slave_axi # 
(
	parameter SB = 5, // how many bits to serialize
	parameter AW = 32, // address width
	parameter DW = 64  // data width
)
(

    axi_in.master m_axi,
    axi_out.master m_axo,
  
    input ext_clk_in,
    input [13:0] ext_data_in,
    output ext_clk_out,
    output [13:0] ext_data_out,
    
    input core_phase_inc

);

	assign m_axi.bready = 1'b1;
	assign m_axi.rready = 1'b1;

	wire [69:0] data_in;
	reg [69:0] data_out = 70'h1; 
	reg [69:0] data_out_r;
	wire [69:0] data_out_w = data_out_r;
	
	wire clk_div;
	wire clk_625M_in, clk_125M_in, clk_625M_out, clk_125M_out;
	 wire data_in_valid;
	wire [68:0] data_in_cd;
	reg  [68:0] data_in_cd_r;
	wire [68:0] data_in_cd_w = data_in_cd_r;
	
	assign ext_clk_out = clk_125M_out; // output data clock
	
/*	// oddr for clock forwarding and obufds for data clock
	ODDR cl_clk_oddr
	(
		.Q(ext_data), // 1-bit DDR output
		.C(clk_4x), // 1-bit clock input
		.CE(1'b1), // 1-bit clock enable input
		.D1(1'b1), // 1-bit data input (positive edge)
		.D2(1'b0), // 1-bit data input (negative edge)
		.R(1'b0), // 1-bit reset
		.S(1'b0) // 1-bit set
	);
	OBUF #(.IOSTANDARD("LVCMOS12"), .DRIVE(8)) cl_clk_buf (.O(core_clk), .I(cl_clk_fw));
*/	
	
//	IBUFG clk_buf (.I(m_aclk1), .O(m_aclk));
	wire ext_clk_in_b;
	IBUFG ext_clk_buf (.I(ext_clk_in), .O(ext_clk_in_b));
	
	wire locked_in;
	reg [4:0] b_cnt;
	reg [15:0] trn_pat_cnt;

	
	always @(posedge m_axi.s_aclk)
	begin
		
		data_out_r = data_out;
		data_in_cd_r = data_in_cd;
		
		// combine all output bits into data_out bus
		// assign dedicated bits first
	
//		data_out = {data_out[68:0], data_out[69]};
	
		// bit 69 shows that there is any valid data
		if (locked_in && locked_out)
		begin
			data_out[69] = m_axo.bvalid || m_axo.rvalid;
			data_out[68] = m_axo.bvalid;
			data_out[67] = m_axo.rlast ;
			data_out[66] = m_axo.rvalid;
			data_out[65:64] = 2'b0;

			if (m_axo.bvalid)
			begin
				data_out[7:0] = {m_axo.bid, m_axo.bresp};
			end
			if (m_axo.rvalid)
			begin
				data_out[63:0] = m_axo.rdata;
			end

			// send training pattern after reset 
			if (trn_pat_cnt != 16'hffff)
			begin
				data_out = {14{5'h1}};
				trn_pat_cnt =  trn_pat_cnt + 16'h1;
			end		
		
		
			// split input bits into AXI signals
			// dedicated bits first
			
			m_axi.awvalid = data_in_cd[68];
			m_axi.wlast   = data_in_cd[67];
			m_axi.wvalid  = data_in_cd[66];
			m_axi.arvalid = data_in_cd[65];		
			
			if (m_axi.awvalid)
			begin
				// send write address and other information
				{
					m_axi.awid,
					m_axi.awaddr,
					m_axi.awlen,
					m_axi.awsize,
					m_axi.awburst
				} = data_in_cd[50:0];
			end
			
			if (m_axi.arvalid)
			begin
				// send read address and other information
				{
					m_axi.arid,
					m_axi.araddr,
					m_axi.arlen,
					m_axi.arsize,
					m_axi.arburst
				} = data_in_cd[50:0];
			end
			
			if (m_axi.wvalid)
			begin	
				// send data
				m_axi.wdata = data_in_cd[63:0];
			end
		end
		else
		begin
			data_out = 70'h0;
			m_axi.awvalid = 1'b0;
			m_axi.wlast   = 1'b0;
			m_axi.wvalid  = 1'b0;
			m_axi.arvalid = 1'b0;		
			{
				m_axi.awid,
				m_axi.awaddr,
				m_axi.awlen,
				m_axi.awsize,
				m_axi.awburst
			} = 51'h0;
			{
				m_axi.arid,
				m_axi.araddr,
				m_axi.arlen,
				m_axi.arsize,
				m_axi.arburst
			} = 51'h0;
			m_axi.wdata = 64'h0;
			trn_pat_cnt = 16'h0;
		end
			
	end

	 reg psen;
	 wire psen_w = psen;
	 wire psdone;
	// mmcm for rx clock
	ctoc_mmcm_in ctoc_mmcm_in_
	(
		.clk_125M_in(ext_clk_in_b), 
		.clk_625M(clk_625M_in),  
		.clk_125M(clk_125M_in),  
		.psclk(clk_125M_in),// IN
		.psen(psen), // IN
		.psincdec(1'b1),     // IN
		.psdone(psdone),       // OUT
		.reset(~m_axi.s_aresetn),
		.input_clk_stopped(),
		.locked(locked_in)
	);      

	localparam RX_PHASE = 57; // fine phase for RX MMCM
	localparam RX_PH_CLK = RX_PHASE * 16;
	reg [9:0] rx_ph_cnt;
	reg phase_done; 
	(* KEEP = "true" *) reg [14:0] phase_done_r; 
	(* KEEP = "true" *) reg [14:0] phase_done_rr;
	wire [14:0] phase_done_rr_w = phase_done_rr;
	wire phase_done_n = ~phase_done;

	reg core_phase_inc_r, core_phase_inc_rr;
	// MMCM phase adjustment logic
	always @(posedge clk_125M_in)
	begin
		psen = 1'b0;
		
        phase_done_rr = phase_done_r;
		phase_done_r = {15{phase_done_n}};
	
		if (!locked_in)
		begin
			// mmcm is still locking
			rx_ph_cnt = 10'h0; // reset counter
			phase_done = 1'b0;
		end
		else
		begin

			if (rx_ph_cnt < RX_PH_CLK)
			begin
				if (rx_ph_cnt[3:0] == 4'h0) // every 16-th clock
					psen = 1'b1; // increase MMCM phase
					
				rx_ph_cnt = rx_ph_cnt + 10'h1; // increase counter
			end
			else
			     phase_done = 1'b1; // done adjusting clock phase

			if (!core_phase_inc_rr && core_phase_inc_r)
			begin
				psen = 1'b1;
//				phase_done = 1'b0;
			end
//			if (psdone)
//				phase_done = 1'b1;
		end
		
		core_phase_inc_rr = core_phase_inc_r;
		core_phase_inc_r = core_phase_inc;
	end

	// mmcm for tx clock
	ctoc_mmcm ctoc_mmcm_out
	(
		.clk_125M_in(m_axi.s_aclk), 
		.clk_625M(clk_625M_out),
		.clk_125M(clk_125M_out), 
		.reset(~m_axi.s_aresetn),
		.input_clk_stopped(), 
		.locked(locked_out)
	);      

	reg rst_isd, rst_osd, rst_isd_r, rst_isd_t;
	reg locked_in_r, locked_in_rr;
	reg locked_out_r, locked_out_rr;
	reg [13:0] bitslip;
	
	localparam BS_IDLE = 2'h0;
	localparam BS_CHECK = 2'h1;
	localparam BS_PAUSE = 2'h2;
	localparam BS_TO = 2'h3;
	
	reg [1:0] bs_st = BS_IDLE;
	reg [2:0] bs_cnt, bs_bits;
	
	wire rst_isd_w = rst_isd;
	wire rst_isd_t_w = rst_isd_t;
	wire [1:0] bs_st_w = bs_st;
	wire [13:0] bitslip_w = bitslip;	
	integer i;
	reg phase_done_t;
	reg [9:0] phdone_to;
	reg bitslip_start;
	wire bitslip_start_w = bitslip_start;
	
	always @(posedge clk_125M_in)
	begin
		rst_isd_t = rst_isd;
		rst_isd = ~(locked_in_rr & locked_out_rr);
		locked_in_rr = locked_in_r;
		locked_in_r = locked_in;
		locked_out_rr = locked_out_r;
		locked_out_r = locked_out;

		bitslip = 14'h0;
		bitslip_start = 1'b0;
		// bit slip state machine, aligns all ISERDESs using training pattern
		case (bs_st)
			BS_IDLE:
			begin
			
				bs_cnt = 3'h0;
				bs_bits = 3'h0;
				phdone_to = 10'h0;
//				if (!rst_isd && rst_isd_t) bs_st = BS_PAUSE;
				// start training after clock phase is done
				if (phase_done && !phase_done_t) bs_st = BS_TO;
			end
			
			BS_CHECK:
			begin
				// check if iserdes output matches training pattern
				for (i = 0; i < 14; i = i+1)
				begin
					if (data_in[i*SB +: 5] != 5'h1)
					begin
						bitslip[i] = 1'b1; // if does not match, set bitslip bit
					end
				end
				bitslip_start = 1'b1;
				bs_cnt = 3'h0;
				bs_st = BS_PAUSE;
				// finish at maximum count of bit slips
				if (bs_bits == 3'h4) bs_st = BS_IDLE;
				bs_bits = bs_bits + 3'h1;
			end
			
			BS_PAUSE:
			begin
				// wait some time to let bitslip operation take effect
				if (bs_cnt == 3'h7) bs_st = BS_CHECK;
				bs_cnt = bs_cnt + 3'h1;
			end

			BS_TO:
			begin
				// wait extra time because MMCM in Kintex takes longer to lock
				if (phdone_to == 10'h3ff) bs_st = BS_CHECK;
				phdone_to = phdone_to + 10'h1;
			end
		endcase
		phase_done_t = phase_done;
	end

	always @(posedge clk_125M_out)
	begin
		rst_osd = rst_isd_r;
		rst_isd_r = rst_isd;
	end

	genvar gi;
	generate
		for (gi = 0; gi < 14; gi = gi+1)
		begin: serdes_loop
			ISERDESE2 #
			(
				.DATA_RATE ("SDR"),
				.DATA_WIDTH (5),
				.INTERFACE_TYPE ("NETWORKING")
			)
			isd
			(
				.Q1 (data_in[gi*SB + 4]),
				.Q2 (data_in[gi*SB + 3]),
				.Q3 (data_in[gi*SB + 2]),
				.Q4 (data_in[gi*SB + 1]),
				.Q5 (data_in[gi*SB + 0]),
				.Q6 (),
				.Q7 (),
				.Q8 (),
				.O  (),
				.SHIFTOUT1 (),
				.SHIFTOUT2 (),
				.D  (ext_data_in[gi]),
				.DDLY (1'b0),
				.CLK (clk_625M_in),
				.CLKB (~clk_625M_in),
				.CE1 (1'b1),
				.CE2 (1'b1),
//				.RST (rst_isd),
//				.RST (~(locked_in & locked_out)), // debug
				.RST (phase_done_rr[gi]),
				.CLKDIV (clk_125M_in),
				.CLKDIVP (1'b0),
				.OCLK (1'b0),
				.OCLKB (1'b0),
				.BITSLIP (bitslip[gi]),
				.SHIFTIN1 (1'b0),
				.SHIFTIN2 (1'b0),
				.OFB (1'b0),
				.DYNCLKDIVSEL (1'b0),
				.DYNCLKSEL (1'b0)
				
			);
			
			OSERDESE2
			# (
				 .DATA_RATE_OQ   ("SDR"),
				 .DATA_RATE_TQ   ("SDR"),
				 .DATA_WIDTH     (5),
				 .TRISTATE_WIDTH (1),
				 .SERDES_MODE    ("MASTER")
			)
			osd 
			(
				.D1             (data_out_r[gi*SB + 0]),
				.D2             (data_out_r[gi*SB + 1]),
				.D3             (data_out_r[gi*SB + 2]),
				.D4             (data_out_r[gi*SB + 3]),
				.D5             (data_out_r[gi*SB + 4]),
				.D6             (1'b0),
				.D7             (1'b0),
				.D8             (1'b0),
				.T1             (1'b0),
				.T2             (1'b0),
				.T3             (1'b0),
				.T4             (1'b0),
				.SHIFTIN1       (1'b0),
				.SHIFTIN2       (1'b0),
				.SHIFTOUT1      (),
				.SHIFTOUT2      (),
//				.OCE            (locked_in & locked_out),
				.OCE            (1'b1),
				.CLK            (clk_625M_out),
				.CLKDIV         (clk_125M_out),
				.OQ             (ext_data_out[gi]),
				.TQ             (),
				.OFB            (),
				.TFB            (),
				.TBYTEIN        (1'b0),
				.TBYTEOUT       (),
				.TCE            (1'b0),
//				.RST            (~(locked_in & locked_out))
				.RST            (rst_osd)
			);
			
			
		end
	endgenerate

	// logic below fills two cells in RX fifo to prevent that fifo from going empty because of close clock edges
	reg empty_r, empty_rr;
	wire empty_rr_w = empty_rr;
	wire empty;
	always @(posedge m_axi.s_aclk)
	begin
		empty_rr = empty_r;
		empty_r = empty;
	end


	// clock domain crossing fifo for rx data
	ctoc_ififo ctoc_ififo_
	(
//		.rst    (phase_done_rr[14]), // input rst
		.rst    (phase_done_n), // debug
		.wr_clk (clk_125M_in), // input wr_clk
		.din    (data_in[68:0]), // input [68 : 0] din
		.wr_en  (1'b1),
		
		.rd_clk (m_axi.s_aclk), // input rd_clk
		.rd_en  (!empty_rr), // input rd_en
		.dout   (data_in_cd), // output [68 : 0] dout
		.full   (), // output full
		.empty  (empty), // output empty
		.valid  (data_in_valid) // output valid
	);


endmodule

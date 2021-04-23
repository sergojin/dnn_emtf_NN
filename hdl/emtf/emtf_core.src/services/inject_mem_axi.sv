module inject_mem_axi_64 #
(
    parameter AW = 15, // address width
    parameter DW = 64, // data width
	parameter BA = 32'h0 // base address
)
(
    axi_in.slave  s_axi,
    axi_out.slave s_axo,
    
    input clk40,
    input inject,
    output [2047:0] dout,
    input [2047:0] din

);

    assign s_axo.bid = 6'h0;
    assign s_axo.rid = 6'h0;
    


     reg [AW-1:0] addr_cnt; 
     reg [7:0] xfer_cnt;
    
    localparam IDLE = 2'h0;
    localparam WRITE = 2'h1;
    localparam READ = 2'h2;
    reg [1:0] state = IDLE;
    
    reg wlast_r;
	
	reg rvalid_e, rlast_e;
	wire [31:0] base_addr = BA;
	 reg ba_we, ba_re, ba_re_e;
	 wire [DW-1:0] rdata;
	reg ra_msb;

    always @(posedge s_axi.s_aclk)
    begin
        if (!s_axi.s_aresetn)
        begin
            state = IDLE;
        end
        else
        begin
    
			// need to delay rvalid and rlast to compensate for BRAM latency
			s_axo.rvalid = rvalid_e;
			s_axo.rlast = rlast_e;
			ba_re = ba_re_e;
	
            case (state)
                IDLE:
                begin
                    s_axo.awready = 1'b1; // ready for write address
                    s_axo.arready = 1'b1; // ready for read address
                    s_axo.wready = 1'b0; // not ready for data
                    rvalid_e = 1'b0; // no read data
                    s_axo.bvalid = 1'b0; // confirmation
                    rlast_e = 1'b0;
					ba_we = 1'b0;
					ba_re_e = 1'b0;
					s_axo.bresp = 2'h0;
					s_axo.rresp = 2'h0;

                    if (s_axi.awvalid)
                    begin
                        // valid write address arrived
						
						// check for base address match
						if (s_axi.awaddr[31:AW] == base_addr[31:AW])
							ba_we = 1'b1;
						else
							s_axo.bresp = 2'b10; // slave error
							
						addr_cnt = s_axi.awaddr[AW-1:0]; // put address into counter
						s_axo.awready = 1'b0; // not ready for write address
						s_axo.arready = 1'b0; // not ready for read address
						s_axo.wready = 1'b1; // ready for data
						state = WRITE;
                    end
                    if (s_axi.arvalid)
                    begin
                        // valid read address
						if (s_axi.araddr[31:AW] == base_addr[31:AW]) // base address match
							ba_re_e = 1'b1;
						else
							s_axo.rresp = 2'b10; // slave error

						addr_cnt = s_axi.araddr[AW-1:0] - 1; // put address into counter
						xfer_cnt = s_axi.arlen; // transfer length into counter
						state = READ;
                    end
                end
                
                WRITE:
                begin
                    s_axo.awready = 1'b0; // not ready for write address
                    s_axo.arready = 1'b0; // not ready for read address
                    s_axo.wready = 1'b1; // ready for data
                    if (s_axi.wvalid)
                    begin 
                        addr_cnt = addr_cnt + 1; // increment address on each valid flag
                    end
                    if (s_axi.wlast && !wlast_r)
                    begin 
                        state = IDLE; // last word, get out
                        s_axo.bvalid = 1'b1; // confirmation
                    end       
                end
                
                READ:
                begin
                    s_axo.awready = 1'b0; // not ready for write address
                    s_axo.arready = 1'b0; // not ready for read address
                    rvalid_e = 1'b1; // data valid
                    if (xfer_cnt == 8'h0) // last transfer
                        rlast_e = 1'b1;
                    else 
                        rlast_e = 1'b0;
                    if (s_axi.rready) // master accepted data beat
                    begin
                        addr_cnt = addr_cnt + 1; // increment address
                        if (rlast_e) state = IDLE; // return to idle when last beat and it's accepted
                        xfer_cnt = xfer_cnt - 8'h1; // decrement transfer counter
                    end            
                end
            endcase
    
            wlast_r = s_axi.wlast;
        end
    end

    // injection control logic
    reg inject_r, inject_rr, ien = 1'b0;
    reg [9:0] inj_addr;
	(* mark_debug = "TRUE" *) wire ien_w = ien;
	(* mark_debug = "TRUE" *) wire [9:0] inj_addr_w = inj_addr;
	(* mark_debug = "TRUE" *) wire [63:0] din_w = din[63:0];
	(* mark_debug = "TRUE" *) wire [63:0] dout_w = dout[63:0];
	(* mark_debug = "TRUE" *) wire inject_w = inject_rr;
    
    always @(posedge clk40)
    begin
    
        if (ien)
        begin
            if (inj_addr == 10'h3ff)
                ien = 1'b0; // last address reached, done injecting

            inj_addr = inj_addr + 10'h1; // increase address
        end
        else
        begin
            inj_addr = 10'h0; // reset injection memory address
        end
    
        if (inject_r && !inject_rr) // inject just rose
        begin
            ien = 1'b1; // set inject enable flag
        end
        
        inject_rr = inject_r;
        inject_r = inject;
    end

    wire [2047:0] doutm;
    assign dout = ien ? doutm : 2048'h0;

     wire we = (s_axo.wready && s_axi.wvalid && ba_we); // write only if base address matches

    inject_mem_64 im64_0 
    (
        .clka(s_axi.s_aclk),    
        .wea(we),      
        .addra(addr_cnt),  
        .dina(s_axi.wdata), 
        .douta(rdata), 
        
        .clkb(clk40),
	    .enb (1'b1),
        .web(ien),    
        .addrb(inj_addr), 
        .dinb(din),   
        .doutb(doutm) 
    );
    
	assign s_axo.rdata = (ba_re) ? rdata : 64'h0; // output data only if base address matches

endmodule

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
    output [3071:0] dout,
    input [3071:0] din

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
	 wire [DW-1:0] rdata [1:0];
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
			ra_msb = addr_cnt[14];
	
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
    reg inject_r, ien = 1'b0;
    reg [8:0] inj_addr;
	wire ien_w = ien;
	wire [8:0] inj_addr_w = inj_addr;
    
    always @(posedge clk40)
    begin
    
        if (ien)
        begin
            inj_addr = inj_addr + 9'h1; // increase address
            if (inj_addr == 9'h1ff)
                ien = 1'b0; // last address reached, done injecting
        end
        else
        begin
            inj_addr = 9'h0; // reset injection memory address
        end
    
        if (inject && !inject_r) // inject just rose
        begin
            ien = 1'b1; // set inject enable flag
        end
        
        inject_r = inject;
    end

    wire [3071:0] doutm;
    assign dout = ien ? doutm : 3072'h0;

     wire we = (s_axo.wready && s_axi.wvalid && ba_we); // write only if base address matches

    inject_mem_64 im64_0 
    (
        .clka(s_axi.s_aclk),    // input wire clka
        .wea(we & (!addr_cnt[14])),      // input wire [0 : 0] wea
        .addra(addr_cnt[13:0]),  // input wire [13 : 0] addra
        .dina({s_axi.wdata[55:32], s_axi.wdata[23:0]}),    // input wire [47 : 0] dina
        .douta({rdata[0][55:32], rdata[0][23:0]}),  // output wire [47 : 0] douta
        
        .clkb(clk40),    // input wire clkb
        .web(ien),      // input wire [0 : 0] web
        .addrb(inj_addr),  // input wire [8 : 0] addrb
        .dinb(din[1535:0]),    // input wire [1535 : 0] dinb
        .doutb(doutm[1535:0])  // output wire [1535 : 0] doutb
    );
    
    inject_mem_64 im64_1 
    (
        .clka(s_axi.s_aclk),    // input wire clka
        .wea(we & addr_cnt[14]),      // input wire [0 : 0] wea
        .addra(addr_cnt[13:0]),  // input wire [13 : 0] addra
        .dina({s_axi.wdata[55:32], s_axi.wdata[23:0]}),    // input wire [47 : 0] dina
        .douta({rdata[1][55:32], rdata[1][23:0]}),  // output wire [47 : 0] douta
        
        .clkb(clk40),    // input wire clkb
        .web(ien),      // input wire [0 : 0] web
        .addrb(inj_addr),  // input wire [8 : 0] addrb
        .dinb(din[3071:1536]),    // input wire [1535 : 0] dinb
        .doutb(doutm[3071:1536])  // output wire [1535 : 0] doutb
    );


    assign rdata[0][31:24] = 8'h0;
    assign rdata[0][63:56] = 8'h0;
    assign rdata[1][31:24] = 8'h0;
    assign rdata[1][63:56] = 8'h0;
	assign s_axo.rdata = (ba_re) ? rdata[ra_msb] : 64'h0; // output data only if base address matches

endmodule

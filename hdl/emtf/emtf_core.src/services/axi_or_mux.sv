// OR multiplexor for AXI modules' outputs
module axi_or_mux 
(
    axi_out.master inp [1:0],
    axi_out.slave outp
);


	assign outp.awready = inp[0].awready | inp[1].awready;
	assign outp.wready  = inp[0].wready  | inp[1].wready ;
	assign outp.bid     = inp[0].bid     | inp[1].bid    ;
	assign outp.bresp   = inp[0].bresp   | inp[1].bresp  ;
	assign outp.bvalid  = inp[0].bvalid  | inp[1].bvalid ;
	assign outp.arready = inp[0].arready | inp[1].arready;
	assign outp.rid     = inp[0].rid     | inp[1].rid    ;
	assign outp.rdata   = inp[0].rdata   | inp[1].rdata  ;
	assign outp.rresp   = inp[0].rresp   | inp[1].rresp  ;
	assign outp.rlast   = inp[0].rlast   | inp[1].rlast  ;
	assign outp.rvalid  = inp[0].rvalid  | inp[1].rvalid ;
        
endmodule

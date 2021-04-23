// OR multiplexor for AXI modules' outputs
module axi_or_mux 
(
    axi_out.master inp [3:0],
    axi_out.slave outp
);


   assign outp.awready = inp[0].awready | inp[1].awready | inp[2].awready | inp[3].awready;
   assign outp.wready  = inp[0].wready  | inp[1].wready  | inp[2].wready  | inp[3].wready;
   assign outp.bid     = inp[0].bid     | inp[1].bid     | inp[2].bid     | inp[3].bid;
   assign outp.bresp   = inp[0].bresp   | inp[1].bresp   | inp[2].bresp   | inp[3].bresp;
   assign outp.bvalid  = inp[0].bvalid  | inp[1].bvalid  | inp[2].bvalid  | inp[3].bvalid;
   assign outp.arready = inp[0].arready | inp[1].arready | inp[2].arready | inp[3].arready;
   assign outp.rid     = inp[0].rid     | inp[1].rid     | inp[2].rid     | inp[3].rid;
   assign outp.rdata   = inp[0].rdata   | inp[1].rdata   | inp[2].rdata   | inp[3].rdata;
   assign outp.rresp   = inp[0].rresp   | inp[1].rresp   | inp[2].rresp   | inp[3].rresp;
   assign outp.rlast   = inp[0].rlast   | inp[1].rlast   | inp[2].rlast   | inp[3].rlast;
   assign outp.rvalid  = inp[0].rvalid  | inp[1].rvalid  | inp[2].rvalid  | inp[3].rvalid;
        
endmodule
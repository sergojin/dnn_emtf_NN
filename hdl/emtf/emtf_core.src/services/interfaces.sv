// AXI master outputs and slave inputs
interface axi_in #(DW = 64) (input s_aclk, input s_aresetn);
    reg [5:0]awid;
    reg [31:0]awaddr;
    reg [7:0]awlen;
    reg [2:0]awsize;
    reg [1:0]awburst;
    reg  awvalid;
    reg [DW-1:0]wdata;
    wire [7:0]wstrb;
    reg  wlast;
    reg  wvalid;
    wire bready;
    reg [5:0]arid;
    reg [31:0]araddr;
    reg [7:0]arlen;
    reg [2:0]arsize;
    reg [1:0]arburst;
    reg  arvalid;
    wire rready;

    modport master
    (
        input s_aclk,
        input s_aresetn,
        output awid,
        output awaddr,
        output awlen,
        output awsize,
        output awburst,
        output awvalid,
        output wdata,
        output wstrb,
        output wlast,
        output wvalid,
        output bready,
        output arid,
        output araddr,
        output arlen,
        output arsize,
        output arburst,
        output arvalid,
        output rready
    );

    modport slave
    (
        input s_aclk,
        input s_aresetn,
        input awid,
        input awaddr,
        input awlen,
        input awsize,
        input awburst,
        input awvalid,
        input wdata,
        input wstrb,
        input wlast,
        input wvalid,
        input bready,
        input arid,
        input araddr,
        input arlen,
        input arsize,
        input arburst,
        input arvalid,
        input rready
    );
endinterface

// AXI master inputs and slave outputs
interface axi_out #(DW = 64);
    reg awready;
    reg wready;
    wire [5:0]bid;
    reg [1:0]bresp;
    reg bvalid;
    reg arready;
    wire [5:0]rid;
    reg [DW-1:0]rdata;
    reg [1:0]rresp;
    reg rlast;
    reg rvalid;
    
    modport master
    (
        input awready,
        input wready,
        input bid,
        input bresp,
        input bvalid,
        input arready,
        input rid,
        input rdata,
        input rresp,
        input rlast,
        input rvalid
    );

    modport slave
    (
        output awready,
        output wready,
        output bid,
        output bresp,
        output bvalid,
        output arready,
        output rid,
        output rdata,
        output rresp,
        output rlast,
        output rvalid
    );
endinterface

// CSC trigger primitive (LCT, stub)
typedef struct packed
{
    logic vf;         // valid flag
    logic [7:0] hs;   // halfstrip
    logic [6:0] wg;   // wiregroup
    logic [3:0] ql;   // quality
    logic [3:0] cp;   // CLCT pattern
    logic lr;         // left-right flag
} csc_lct;
    
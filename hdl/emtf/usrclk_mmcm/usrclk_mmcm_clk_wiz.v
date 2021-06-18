
// file: usrclk_mmcm.v
// 
// (c) Copyright 2008 - 2013 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//
//----------------------------------------------------------------------------
//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// CLK_OUT1__160.00000______0.000______50.0______190.317____208.802
// CLK_OUT2__40.00000______0.000______50.0______273.894____208.802
// CLK_OUT3__100.00000______0.000______50.0______212.630____208.802
// CLK_OUT4__114.28571______0.000______50.0______205.787____208.802
// CLK_OUT5__400.00000______0.000______50.0______163.050____208.802
// CLK_OUT6__266.66667______0.000______50.0______174.089____208.802
//
//----------------------------------------------------------------------------
// Input Clock   Freq (MHz)    Input Jitter (UI)
//----------------------------------------------------------------------------
// __primary______________40____________0.010

`timescale 1ps/1ps

module usrclk_mmcm_clk_wiz 

 (// Clock in ports
  // Clock out ports
  output        CLK_OUT1,
  output        CLK_OUT2,
  output        CLK_OUT3,
  output        CLK_OUT4,
  output        CLK_OUT5,
  output        CLK_OUT6,
  // Dynamic phase shift ports
  input         PSCLK,
  input         PSEN,
  input         PSINCDEC,
  output        PSDONE,
  // Status and control signals
  input         RESET,
  output        LOCKED,
  input         CLK_IN1
 );
  // Input buffering
  //------------------------------------
wire CLK_IN1_usrclk_mmcm;
wire clk_in2_usrclk_mmcm;
  assign CLK_IN1_usrclk_mmcm = CLK_IN1;




  // Clocking PRIMITIVE
  //------------------------------------

  // Instantiation of the MMCM PRIMITIVE
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused

  wire        CLK_OUT1_usrclk_mmcm;
  wire        CLK_OUT2_usrclk_mmcm;
  wire        CLK_OUT3_usrclk_mmcm;
  wire        CLK_OUT4_usrclk_mmcm;
  wire        CLK_OUT5_usrclk_mmcm;
  wire        CLK_OUT6_usrclk_mmcm;
  wire        clk_out7_usrclk_mmcm;

  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        LOCKED_int;
  wire        clkfbout_usrclk_mmcm;
  wire        clkfbout_buf_usrclk_mmcm;
  wire        clkfboutb_unused;
    wire clkout0b_unused;
   wire clkout1b_unused;
   wire clkout2b_unused;
   wire clkout3b_unused;
  wire        clkout6_unused;
  wire        clkfbstopped_unused;
  wire        clkinstopped_unused;
  wire        reset_high;

  MMCME2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .CLKOUT4_CASCADE      ("FALSE"),
    .COMPENSATION         ("ZHOLD"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT_F      (20.000),
    .CLKFBOUT_PHASE       (0.000),
    .CLKFBOUT_USE_FINE_PS ("FALSE"),
    .CLKOUT0_DIVIDE_F     (5.000),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT0_USE_FINE_PS  ("FALSE"),
    .CLKOUT1_DIVIDE       (20),
    .CLKOUT1_PHASE        (0.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT1_USE_FINE_PS  ("FALSE"),
    .CLKOUT2_DIVIDE       (8),
    .CLKOUT2_PHASE        (0.000),
    .CLKOUT2_DUTY_CYCLE   (0.500),
    .CLKOUT2_USE_FINE_PS  ("FALSE"),
    .CLKOUT3_DIVIDE       (7),
    .CLKOUT3_PHASE        (0.000),
    .CLKOUT3_DUTY_CYCLE   (0.500),
    .CLKOUT3_USE_FINE_PS  ("FALSE"),
    .CLKOUT4_DIVIDE       (2),
    .CLKOUT4_PHASE        (0.000),
    .CLKOUT4_DUTY_CYCLE   (0.500),
    .CLKOUT4_USE_FINE_PS  ("FALSE"),
    .CLKOUT5_DIVIDE       (3),
    .CLKOUT5_PHASE        (0.000),
    .CLKOUT5_DUTY_CYCLE   (0.500),
    .CLKOUT5_USE_FINE_PS  ("FALSE"),
    .CLKIN1_PERIOD        (25.000))
  mmcm_adv_inst
    // Output clocks
   (
    .CLKFBOUT            (clkfbout_usrclk_mmcm),
    .CLKFBOUTB           (clkfboutb_unused),
    .CLKOUT0             (CLK_OUT1_usrclk_mmcm),
    .CLKOUT0B            (clkout0b_unused),
    .CLKOUT1             (CLK_OUT2_usrclk_mmcm),
    .CLKOUT1B            (clkout1b_unused),
    .CLKOUT2             (CLK_OUT3_usrclk_mmcm),
    .CLKOUT2B            (clkout2b_unused),
    .CLKOUT3             (CLK_OUT4_usrclk_mmcm),
    .CLKOUT3B            (clkout3b_unused),
    .CLKOUT4             (CLK_OUT5_usrclk_mmcm),
    .CLKOUT5             (CLK_OUT6_usrclk_mmcm),
    .CLKOUT6             (clkout6_unused),
     // Input clock control
    .CLKFBIN             (clkfbout_buf_usrclk_mmcm),
    .CLKIN1              (CLK_IN1_usrclk_mmcm),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (do_unused),
    .DRDY                (drdy_unused),
    .DWE                 (1'b0),
    // Ports for dynamic phase shift
    .PSCLK               (PSCLK),
    .PSEN                (PSEN),
    .PSINCDEC            (PSINCDEC),
    .PSDONE              (PSDONE),
    // Other control and status signals
    .LOCKED              (LOCKED_int),
    .CLKINSTOPPED        (clkinstopped_unused),
    .CLKFBSTOPPED        (clkfbstopped_unused),
    .PWRDWN              (1'b0),
    .RST                 (reset_high));
  assign reset_high = RESET; 

  assign LOCKED = LOCKED_int;
// Clock Monitor clock assigning
//--------------------------------------
 // Output buffering
  //-----------------------------------

  BUFG clkf_buf
   (.O (clkfbout_buf_usrclk_mmcm),
    .I (clkfbout_usrclk_mmcm));






  BUFG clkout1_buf
   (.O   (CLK_OUT1),
    .I   (CLK_OUT1_usrclk_mmcm));


  BUFG clkout2_buf
   (.O   (CLK_OUT2),
    .I   (CLK_OUT2_usrclk_mmcm));

  BUFG clkout3_buf
   (.O   (CLK_OUT3),
    .I   (CLK_OUT3_usrclk_mmcm));

  BUFG clkout4_buf
   (.O   (CLK_OUT4),
    .I   (CLK_OUT4_usrclk_mmcm));

  BUFG clkout5_buf
   (.O   (CLK_OUT5),
    .I   (CLK_OUT5_usrclk_mmcm));

  BUFG clkout6_buf
   (.O   (CLK_OUT6),
    .I   (CLK_OUT6_usrclk_mmcm));



endmodule

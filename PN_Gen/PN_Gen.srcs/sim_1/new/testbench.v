`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2020 18:54:44
// Design Name: 
// Module Name: testbench
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


module testbench;

reg [0:63] load_t;
reg clk_t, init_t;
wire op_t;
wire [0:63] FFout, FFin;
wire add_out_t;
    
 PN_GenParameterised uut(
    .clk(clk_t),
    .load(load_t),
    .init(init_t),
    .out(op_t),
    .FFout(FFout),
    .FFin(FFin),
    .add_out(add_out_t)
    );
    
 initial begin
    clk_t = 1'b0;
    load_t = 64'h6a9e_d25c_6a8e_d45c;
    init_t = 1;
    #6
    init_t = 0;
 end
       
 always@(clk_t)             // the clock!
    clk_t <= #5 !clk_t;     // <--------
 
    
endmodule

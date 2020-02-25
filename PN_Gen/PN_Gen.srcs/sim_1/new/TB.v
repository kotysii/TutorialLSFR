`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2020 13:08:16
// Design Name: 
// Module Name: TB
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


module TB(
    );
    wire [0:7] a_t;
    reg clk_t;
    
    
    play uut(
    .clk(clk_t),
    .a(a_t)
    );
    
   always@(clk_t)             // the clock!
    clk_t <= #5 !clk_t;     // <--------
    
    initial clk_t=0;
    
endmodule

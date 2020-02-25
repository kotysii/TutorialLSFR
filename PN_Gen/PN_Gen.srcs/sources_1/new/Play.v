`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2020 18:33:06
// Design Name: 
// Module Name: PN_GenParameterised
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


module play(
    output reg [0:7] a,
    input wire clk
    );
    integer i;
    
    always@(posedge clk) // the FFs
    begin
       for(i=0;i<7;i=i+1)
       begin
           a[i+1] <= a[i];
       end
    end
    
    initial
        a <= 8'b1000_1000;
    
endmodule
  
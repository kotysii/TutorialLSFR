`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2020 15:32:38
// Design Name: 
// Module Name: PN_Gen
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


module PN_Gen(
    input wire load1, load2, load3, init, clk,
    output reg op,
    output wire mux_out1, mux_out2, mux_out3
    );
    
    reg mux_out1, mux_out2, mux_out3;
    reg add_out, ff1, ff2, ff3;
    wire in;
    
    always@(posedge clk) // the FFs
    begin
       ff1 <= in;
       ff2 <= mux_out1; 
       ff3 <= mux_out2;
       op <= mux_out3; 
    end
    
    always@(*)          // the muxi
    begin
        if(init) begin  // if init HIGH then mux_outs are equal to loads
            mux_out1 <= load1;
            mux_out2 <= load2;
            mux_out3 <= load3;
        end
        else begin      // else (if init LOW) mux_outs are equal to ff outputs
            mux_out1 <= ff1;
            mux_out2 <= ff2;
            mux_out3 <= ff3;
        end
    end
    
    assign in = mux_out1^mux_out3;
    
endmodule
            

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


module PN_GenParameterised#(parameter FFs = 64)(
    input wire [0:FFs-1] load,
    input wire init, clk,
    output wire out, add_out,
    output reg [0:FFs-1] FFout, FFin
    );
    
    //wire add_out;
    integer i;
    
    
    always@(posedge clk) // the FFs
    begin
       for(i=0;i<FFs;i=i+1)
       begin
            FFout[i]<=FFin[i];
       end
    end
    
    
    always@(*)          // the muxi
    begin
       
       if(init)         // the 0th mux
       begin 
            FFin[0] <= load[0];
       end
       else
       begin
            FFin[0] <= add_out; 
       end              // the end of the 0th mux
       
        
       for(i=1;i<FFs;i=i+1)
       begin
            if(init)
            begin
                FFin[i] <= load[i];
            end
            else begin
                FFin[i] <= FFout[i-1];
            end
       end
    end // mux end
    
    assign add_out = FFin[1]^FFin[3]^FFin[6]^FFin[60]^FFin[49];
    assign out = FFout[FFs-1];
    
endmodule
  
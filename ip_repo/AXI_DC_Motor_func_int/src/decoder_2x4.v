`timescale 1ns / 1ps


module decoder_2x4(
    input [1:0] i_sel,
    output [3:0] o_sel
);
   reg [3:0] o_sel;

   always @(i_sel) begin
       o_sel = 4'bxxxx;
       case (i_sel)
        0 : o_sel = 4'b1110;
        1 : o_sel = 4'b1101;
        2 : o_sel = 4'b1011;
        3 : o_sel = 4'b0111;
       endcase
   end
endmodule

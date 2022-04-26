`timescale 1ns / 1ps


module fnd_decoder(
    input [3:0] i_data,
    output [7:0] o_fndFont
);
    reg [7:0] o_fndFont;

    always @(i_data) begin
        o_fndFont = 8'hff;
        case (i_data)
            0 : o_fndFont = 8'hc0;
            1 : o_fndFont = 8'hf9;
            2 : o_fndFont = 8'ha4;
            3 : o_fndFont = 8'hb0;
            4 : o_fndFont = 8'h99;
            5 : o_fndFont = 8'h92;
            6 : o_fndFont = 8'h82;
            7 : o_fndFont = 8'hf8;
            8 : o_fndFont = 8'h80;
            9 : o_fndFont = 8'h90;
            10 : o_fndFont = 8'h88;
            11 : o_fndFont = 8'h83;
            12 : o_fndFont = 8'hc6;
            13 : o_fndFont = 8'ha1;
            14 : o_fndFont = 8'h86;
            15 : o_fndFont = 8'h8e;
        endcase
    end
endmodule

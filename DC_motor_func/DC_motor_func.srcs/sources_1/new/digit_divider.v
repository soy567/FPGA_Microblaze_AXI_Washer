`timescale 1ns / 1ps


module digit_divider(
    input [7:0] i_data,
    output [3:0] o_digit_0, o_digit_1, o_digit_2, o_digit_3
    );
    
    assign o_digit_3 = (i_data / 1000);
    assign o_digit_2 = (i_data / 100) % 10;
    assign o_digit_1 = (i_data / 10) % 10;
    assign o_digit_0 = i_data % 10;
    
endmodule

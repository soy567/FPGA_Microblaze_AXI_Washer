`timescale 1ns / 1ps

module top_fnd_display(
    input i_clk, i_reset,
    input [7:0] i_data,
    output [7:0] o_fndData,
    output [3:0] o_fndSelect
    );

    wire [1:0] w_cnt_2bit;
    wire w_1khz;
    wire [3:0] w_digit_0,w_digit_1, w_digit_2, w_digit_3, w_data;

    clockDivider #(.MAX_COUNT(50_000)) clkDiv_1khz(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_1khz)
    );

    counter_2bit (
        .i_clk(w_1khz),
        .i_reset(i_reset),
        .o_cnt(w_cnt_2bit)
    );

    decoder_2x4 (
        .i_sel(w_cnt_2bit),
        .o_sel(o_fndSelect)
    );
    
    digit_divider (
        .i_data(i_data),
        .o_digit_0(w_digit_0), .o_digit_1(w_digit_1),
        .o_digit_2(w_digit_2), .o_digit_3(w_digit_3)
    );
    
    mux_4x1 (
        .i_sel(w_cnt_2bit),
        .i_a(w_digit_0), .i_b(w_digit_1), .i_c(w_digit_2), .i_d(w_digit_3),
        .o_y(w_data)
    );
    
    fnd_decoder (
    .i_data(w_data),
    .o_fndFont(o_fndData)
    );

endmodule

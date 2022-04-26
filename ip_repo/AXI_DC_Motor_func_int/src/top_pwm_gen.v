`timescale 1ns / 1ps


module top_pwm_gen(
    input i_clk, i_reset,
    input [7:0] i_ocr,
    output o_pwm
    );
    
    wire w_clk_1M;
    wire [7:0] w_cnt;
    
    clockDivider #(.MAX_COUNT(50)) D0 (
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clk_1M)
    );
    
    counter D1 (
        .i_clk(w_clk_1M),
        .i_reset(i_reset),
        .o_cnt(w_cnt)
    );
    
    comparator D3 (
        .i_a(w_cnt), .i_b(i_ocr),
        .o_lt(o_pwm)
    );
endmodule

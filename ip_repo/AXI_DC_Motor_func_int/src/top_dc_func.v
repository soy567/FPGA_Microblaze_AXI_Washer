`timescale 1ns / 1ps


module top_dc_func(
    input i_clk, i_reset,
    input [2:0] i_mode,
    output o_ma, o_mb, o_fin, o_pwm,
    output [3:0] o_fndSel,
    output [7:0] o_fndData
    );
    
    wire w_clk_1hz;
    wire [7:0] w_rtime, w_ocr;
    
    clock_divider D1 (
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clk_1hz)
    );
    
    dc_function D2 (
        .i_clk(w_clk_1hz),
        .i_reset(i_reset),
        .i_mode(i_mode),
        .o_ma(o_ma), .o_mb(o_mb), .o_fin(o_fin),
        .o_ocr(w_ocr), .o_rtime(w_rtime)
    );
    
    top_pwm_gen D3 (
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_ocr(w_ocr),
        .o_pwm(o_pwm)
    );
    
    top_fnd_display D4 (
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_data(w_rtime),
        .o_fndSelect(o_fndSel),
        .o_fndData(o_fndData)
    );
endmodule

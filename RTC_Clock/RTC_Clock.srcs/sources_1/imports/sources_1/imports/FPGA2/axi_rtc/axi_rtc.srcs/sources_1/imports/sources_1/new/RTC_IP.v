`timescale 1ns / 1ps

module RTC_IP(
    input i_clk,
    input i_modify,
    input [7:0] im_min, im_hour,
    output [7:0] o_msec,
    output [7:0] o_sec,
    output [7:0] o_min,
    output [7:0] o_hour
    );

    wire w_clk_10hz;

    clock_divider clock_inst(
        .i_clk(i_clk),
        .o_clk(w_clk_10hz)
    );

    wire [7:0] w_msec, w_sec, w_min, w_hour;

    time_counter2 tcnt_inst(
        .i_clk(w_clk_10hz),
        .i_modify(i_modify),
        .i_msec(o_msec),
        .i_sec(o_sec),
        .i_min(o_min),
        .i_hour(o_hour),
        .o_msec(w_msec),
        .o_sec(w_sec),
        .o_min(w_min),
        .o_hour(w_hour)
    );

    rtc_memory rtc_mem_inst(
        .i_modify(i_modify),
        .i_msec(w_msec),
        .i_sec(w_sec),
        .i_min(w_min),
        .i_hour(w_hour),
        .ie_msec(0),
        .ie_sec(0),
        .ie_min(im_min),
        .ie_hour(im_hour),
        .o_msec(o_msec),
        .o_sec(o_sec),
        .o_min(o_min),
        .o_hour(o_hour)
    );

endmodule

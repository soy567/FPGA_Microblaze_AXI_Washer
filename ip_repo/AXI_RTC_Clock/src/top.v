`timescale 1ns / 1ps


module top_RTC (
    input sys_clock,
    input i_modify,
    input [7:0] i_im_min,
    input [7:0] i_im_hour,
    output [7:0] o_msec, o_sec, o_min, o_hour
    );
    
     RTC_IP RTC (
        .i_clk(sys_clock),    
        .i_modify(i_modify),
        .im_min(i_im_min),
        .im_hour(i_im_hour),
        .o_msec(o_msec),
        .o_sec(o_sec),
        .o_min(o_min),
        .o_hour(o_hour)
    );

endmodule

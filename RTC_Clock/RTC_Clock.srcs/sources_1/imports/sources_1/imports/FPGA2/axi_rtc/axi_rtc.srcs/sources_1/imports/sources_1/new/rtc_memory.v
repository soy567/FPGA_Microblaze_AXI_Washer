`timescale 1ns / 1ps

module rtc_memory(
    input i_modify,
    input [7:0] i_msec,
    input [7:0] i_sec,
    input [7:0] i_min,
    input [7:0] i_hour,
    input [7:0] ie_msec,
    input [7:0] ie_sec,
    input [7:0] ie_min,
    input [7:0] ie_hour,
    output [7:0] o_msec,
    output [7:0] o_sec,
    output [7:0] o_min,
    output [7:0] o_hour
    );

    parameter MSEC = 0;
    parameter SEC  = 1;
    parameter MIN  = 2;
    parameter HOUR = 3;

    reg [7:0] r_rtc_mem[0:3];

    assign o_msec = r_rtc_mem[MSEC];
    assign o_sec  = r_rtc_mem[SEC] ;
    assign o_min  = r_rtc_mem[MIN] ;
    assign o_hour = r_rtc_mem[HOUR];

    always @(*) begin
        if (i_modify) begin
            r_rtc_mem[MSEC] = ie_msec;
            r_rtc_mem[SEC]  = ie_sec;
            r_rtc_mem[MIN]  = ie_min;
            r_rtc_mem[HOUR] = ie_hour;
        end
        else begin
            r_rtc_mem[MSEC] = i_msec;
            r_rtc_mem[SEC]   = i_sec;
            r_rtc_mem[MIN]   = i_min;
            r_rtc_mem[HOUR] = i_hour;
        end
    end

endmodule

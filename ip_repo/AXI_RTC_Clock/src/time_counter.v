`timescale 1ns / 1ps
/*
module time_counter(
    input i_clk,
    input [7:0] i_msec,
    input [7:0] i_sec,
    input [7:0] i_min,
    input [7:0] i_hour,
    output [7:0] o_msec,
    output [7:0] o_sec,
    output [7:0] o_min,
    output [7:0] o_hour
    );

    reg [7:0] r_msec=0, r_sec=0, r_min=0, r_hour=0;
    assign o_msec = r_msec;
    assign o_sec = r_sec;
    assign o_min = r_min;
    assign o_hour = r_hour;

    always @(posedge i_clk) begin
        if (r_msec == 9) begin
            r_msec <= 0;
            if (r_sec == 59) begin
                r_sec <= 0;
                if (r_min == 59) begin
                    r_min <= 0;
                    if (r_hour == 23) begin
                        r_hour <= 0;
                    end
                    else begin
                        r_hour <= i_hour + 1;
                    end
                end
                else begin
                    r_min <= i_min + 1;
                end
            end
            else begin
                r_sec <= i_sec + 1;
            end
        end
        else begin
           r_msec <= i_msec + 1; 
        end
    end
endmodule
*/


module time_counter2(
    input i_clk,
    input i_modify,
    input [7:0] i_msec,
    input [7:0] i_sec,
    input [7:0] i_min,
    input [7:0] i_hour,
    output [7:0] o_msec,
    output [7:0] o_sec,
    output [7:0] o_min,
    output [7:0] o_hour
    );

    reg r_sec_clk=0, r_min_clk=0, r_hour_clk=0;
    reg [7:0] r_msec=0, r_sec=0, r_min=0, r_hour=0;

    assign o_msec = r_msec;
    assign o_sec = r_sec;
    assign o_min = r_min;
    assign o_hour = r_hour;

    always @(posedge i_clk, posedge i_modify) begin
        if (i_modify) begin
            r_msec <= i_msec;
        end
        else begin
            if (r_msec == 9) begin
                r_msec <= 0;
                r_sec_clk <= 1;
            end
            else begin
                r_msec <= i_msec + 1;
                r_sec_clk <= 0;
            end
        end
    end

    always @(posedge r_sec_clk, posedge i_modify) begin
        if (i_modify) begin
            r_sec <= i_sec;
        end
        else begin
            if (r_sec == 59) begin
                r_sec <= 0;
                r_min_clk <= 1;
            end
            else begin
                r_sec <= i_sec + 1;
                r_min_clk <= 0;
            end
        end
    end

    always @(posedge r_min_clk, posedge i_modify) begin
        if (i_modify) begin
            r_min <= i_min;
        end
        else begin
            if (r_min == 59) begin
                r_min <= 0;
                r_hour_clk <= 1;
            end
            else begin
                r_min <= i_min + 1;
                r_hour_clk <= 0;
            end
        end
    end

    always @(posedge r_hour_clk, posedge i_modify) begin
        if (i_modify) begin
            r_hour <= i_hour;
        end
        else begin
            if (r_hour == 23) begin
                r_hour <= 0;
            end
            else begin
                r_hour <= i_hour + 1;
            end
        end
    end

endmodule

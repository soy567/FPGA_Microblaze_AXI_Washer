`timescale 1ns / 1ps


module tb_top_RTC (
    );
    
    reg r_clk, r_modify;
    reg [7:0] r_min = 0, r_hour = 0;
    wire [7:0] w_msec, w_sec, w_min, w_hour;
    
    top_RTC DUT (
        .i_clk(r_clk), .i_modify(r_modify),
        .i_im_min(r_min), .i_im_hour(r_hour),
        .o_msec(w_msec), .o_sec(w_sec),
        .o_min(w_min), .o_hour(w_hour)
    );
    
    always #5 r_clk = ~r_clk;
    
    initial begin
        #00 r_clk = 0; r_modify = 0;
        #500 r_min = 30; r_hour = 2;
        #10 r_modify = 1;
        #10 r_modify = 0;
    end
    
endmodule

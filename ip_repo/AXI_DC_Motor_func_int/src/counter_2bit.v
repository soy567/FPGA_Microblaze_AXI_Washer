`timescale 1ns / 1ps


module counter_2bit(
    input i_clk, i_reset,
    output [1:0] o_cnt
    );
    
    reg [1:0] r_cnt = 0;
    assign o_cnt = r_cnt;
    
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) r_cnt <= 0;
        else r_cnt <= r_cnt + 1;
    end
endmodule

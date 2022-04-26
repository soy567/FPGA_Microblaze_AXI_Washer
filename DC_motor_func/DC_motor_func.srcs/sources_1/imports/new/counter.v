`timescale 1ns / 1ps


module counter(
    input i_clk, i_reset,
    output [31:0] o_cnt
    );
    
    parameter TOP_COUNT = 100;
    
    reg [31:0] r_cnt = 0;
    assign o_cnt = r_cnt;
    
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) r_cnt <= 0;
        else begin
            if (r_cnt == TOP_COUNT - 1) r_cnt <= 0;
            else r_cnt <= r_cnt + 1;
        end
    end
endmodule

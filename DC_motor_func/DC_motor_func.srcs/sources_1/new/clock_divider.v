`timescale 1ns / 1ps


module clock_divider(
    input i_clk, i_reset,
    output o_clk
    );
    
    parameter MAX_COUNT = 50_000_000;
    
    reg [31:0] clk_cnt = 0;
    reg r_clk = 0;
    assign o_clk = r_clk;
    
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) clk_cnt <= 0;
        else begin
            if (clk_cnt == MAX_COUNT) begin
                clk_cnt <= 0;
                r_clk <= ~r_clk;
            end
            else clk_cnt <= clk_cnt + 1;
        end
    end
endmodule

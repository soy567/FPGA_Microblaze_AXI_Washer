`timescale 1ns / 1ps

module clockDivider(
    input i_clk, i_reset,
    output o_clk
    );
    parameter MAX_COUNT = 50_000_000;

    reg [31:0] count = 0;
    reg r_clk = 0;
    assign o_clk = r_clk;
    
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            count <= 0;
        end
        else begin
            if(count == MAX_COUNT - 1) begin
                r_clk <= ~r_clk;
                count <= 0;
            end
            else begin
                count <= count + 1;
            end
        end
    end
endmodule

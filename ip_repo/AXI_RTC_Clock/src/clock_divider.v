`timescale 1ns / 1ps

module clock_divider(
    input i_clk,
    output o_clk
    );

    reg [31:0] r_counter = 0;
    reg r_clk = 0;

    assign o_clk = r_clk;

    always @(posedge i_clk) begin
        if (r_counter == 5_000_000 - 1) begin
//        if (r_counter == 50 - 1) begin
            r_counter <= 0;
            r_clk <= ~r_clk;
        end
        else begin
            r_counter <= r_counter + 1;
        end
    end
endmodule

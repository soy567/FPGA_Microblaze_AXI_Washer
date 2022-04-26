`timescale 1ns / 1ps


module mux_4x1(
    input [3:0] i_a, i_b, i_c, i_d,
    input [1:0] i_sel,
    output [3:0] o_y
    );
    
    reg [3:0] r_y = 0;
    assign o_y = r_y;
    
    always @(i_sel) begin
        case(i_sel)
            0: r_y = i_a;
            1: r_y = i_b;
            2: r_y = i_c;
            3: r_y = i_d;
        endcase
    end
endmodule

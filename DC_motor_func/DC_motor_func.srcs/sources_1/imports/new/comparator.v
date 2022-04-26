`timescale 1ns / 1ps


module comparator(
    input [7:0] i_a, i_b,
    // input i_en,
    // output o_gt, o_eq    
    output o_lt
    );
    
     // assign o_gt = (i_a > i_b);
    assign o_lt = (i_a < i_b);
    // assign o_eq = (i_a == i_b);
endmodule

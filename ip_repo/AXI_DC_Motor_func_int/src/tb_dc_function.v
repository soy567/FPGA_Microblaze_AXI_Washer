`timescale 1ns / 1ps


module tb_dc_function(
    );
    reg r_clk = 0, r_reset = 0;
    reg [2:0] r_mode;
    
    wire w_ma, w_mb, w_fin;
    wire [7:0] w_ocr, w_rtime;
    
    dc_function DUT (
        .i_clk(r_clk), .i_reset(r_reset),
        .i_mode(r_mode),
        .o_ma(w_ma), .o_mb(w_mb), .o_fin(w_fin),
        .o_ocr(w_ocr), .o_rtime(w_rtime)
    );
    
    always #10 r_clk = ~r_clk;
    
    initial begin
        #00 r_clk = 0; r_reset = 0; r_mode = 0;
        #50 r_mode = 3'b001; 
        // #150 r_mode = 3'b010; 
        #250 r_mode = 0;
        #50 r_mode = 3'b010;
        #100 r_mode = 0;
        #50 r_mode = 3'b100;
        #30 r_reset = 1;
        #20 r_reset = 0;
        #200 r_mode = 0;     
    end
       
endmodule

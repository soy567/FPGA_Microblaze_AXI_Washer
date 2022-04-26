`timescale 1ns / 1ps


module dc_function(
    input i_clk, i_reset,
    input [2:0] i_mode,
    output o_ma, o_mb, o_fin,
    output [7:0] o_ocr, o_rtime
    );
    
    reg [2:0] prev_mode = 0;
    reg [31:0] clk_cnt = 0;
    reg r_ma, r_mb, r_fin = 1;
    reg [7:0] r_ocr, r_rtime;
    
    assign o_ma = r_ma;
    assign o_mb = r_mb;
    assign o_ocr = r_ocr;
    assign o_rtime = r_rtime;
    assign o_fin = r_fin;
    
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            clk_cnt <= 0;
            task_stop(r_rtime, r_ma, r_mb, r_fin, r_ocr);
        end
        else begin
            if (i_clk && i_mode != 0) begin
                clk_cnt <= clk_cnt + 1;
            end
            else clk_cnt <= 0;
            dc_task(i_mode, r_ocr);
        end
    end 
    
    task dc_task;
        input [2:0] i_mode;
        output [7:0] r_ocr;
        begin
            if (i_mode != 0 && prev_mode != i_mode) r_fin = 0;
            case(i_mode)
                3'b001: begin
                    if (r_fin == 0) r_rtime = 10 - clk_cnt;
                    task_wash(r_rtime, r_ma, r_mb, r_fin, r_ocr);
                end
                3'b010: begin
                    if (r_fin == 0) r_rtime = 5 - clk_cnt;
                    task_rins(r_rtime, r_ma, r_mb, r_fin, r_ocr);
                end
                3'b100: begin
                    if (r_fin == 0) r_rtime = 10 - clk_cnt;
                    task_dry(r_rtime, r_ma, r_mb, r_fin, r_ocr);
                end
                default: begin
                    r_ma = 0; r_mb = 0; r_ocr = 0; r_rtime = 0; r_fin = 1;
                    prev_mode = i_mode;
                end
            endcase
        end    
    endtask
    
    task task_stop;
        input [7:0] r_rtime;
        output r_ma, r_mb, r_fin;
        output [7:0] r_ocr;
        begin
            r_rtime = 0; r_ma = 0; r_mb = 0; r_ocr = 0; r_fin = 1;
        end
    endtask
    
    task task_wash;
        input [7:0] r_rtime;
        output r_ma, r_mb, r_fin;
        output [7:0] r_ocr;
        
        if (r_rtime == 0) begin
            r_ma = 0; r_mb = 0; r_ocr = 0; r_fin = 1;
            prev_mode = i_mode;
        end
        else begin
            r_fin = 0;
            if (r_rtime > 4) begin
                r_ma = 1; r_mb = 0; r_ocr = 60;
            end
            else r_ocr = 40;
        end
    endtask
    
    task task_rins;
        input [7:0] r_rtime;
        output r_ma, r_mb, r_fin;
        output [7:0] r_ocr;
        
        if (r_rtime == 0) begin
            r_ma = 0; r_mb = 0; r_ocr = 0; r_fin = 1;
            prev_mode = i_mode;
        end
        else begin
            r_ma = 0; r_mb = 1; r_ocr = 70; r_fin = 0;
        end
    endtask
    
    task task_dry;
        input [7:0] r_rtime;
        output r_ma, r_mb, r_fin;
        output [7:0] r_ocr;
        
        if (r_rtime == 0) begin
            r_ma = 0; r_mb = 0; r_ocr = 0; r_fin = 1;
            prev_mode = i_mode;
        end
        else begin
            r_fin = 0;
            if (r_rtime > 5) begin
                r_ma = 1; r_mb = 0; r_ocr = 80;
            end
            else begin
                r_ma = 0; r_mb = 1; // r_ocr = 40;
            end
        end
    endtask
    
endmodule

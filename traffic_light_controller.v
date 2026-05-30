`timescale 1ns / 1ps

module Traffic_Light_Controller(
    input clk,
    input rst,
    output reg [2:0] light_M1,
    output reg [2:0] light_M2,
    output reg [2:0] light_MT,
    output reg [2:0] light_S
);

parameter S1=0, S2=1, S3=2, S4=3, S5=4, S6=5;
parameter sec7=7, sec5=5, sec3=3, sec2=2;

reg [3:0] count;
reg [2:0] ps;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        ps <= S1;
        count <= 0;
    end else begin
        case (ps)
            S1: if (count < sec7-1) begin count <= count+1; end
                else begin ps <= S2; count <= 0; end
            S2: if (count < sec2-1) begin count <= count+1; end
                else begin ps <= S3; count <= 0; end
            S3: if (count < sec5-1) begin count <= count+1; end
                else begin ps <= S4; count <= 0; end
            S4: if (count < sec2-1) begin count <= count+1; end
                else begin ps <= S5; count <= 0; end
            S5: if (count < sec3-1) begin count <= count+1; end
                else begin ps <= S6; count <= 0; end
            S6: if (count < sec2-1) begin count <= count+1; end
                else begin ps <= S1; count <= 0; end
            default: ps <= S1;
        endcase
    end
end

always @(*) begin
    case (ps)
        S1: begin light_M1=3'b001; light_M2=3'b001; light_MT=3'b100; light_S=3'b100; end
        S2: begin light_M1=3'b001; light_M2=3'b010; light_MT=3'b100; light_S=3'b100; end
        S3: begin light_M1=3'b001; light_M2=3'b100; light_MT=3'b001; light_S=3'b100; end
        S4: begin light_M1=3'b010; light_M2=3'b100; light_MT=3'b010; light_S=3'b100; end
        S5: begin light_M1=3'b100; light_M2=3'b100; light_MT=3'b100; light_S=3'b001; end
        S6: begin light_M1=3'b100; light_M2=3'b100; light_MT=3'b100; light_S=3'b010; end
        default: begin light_M1=0; light_M2=0; light_MT=0; light_S=0; end
    endcase
end

endmodule

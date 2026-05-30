`timescale 1ns / 1ps

module Traffic_Light_Controller_TB();

reg clk, rst;
wire [2:0] light_M1, light_M2, light_MT, light_S;

Traffic_Light_Controller uut(
    .clk(clk), .rst(rst),
    .light_M1(light_M1), .light_M2(light_M2),
    .light_MT(light_MT), .light_S(light_S)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    #20 rst = 0;
    #500 $finish;
end

initial begin
    $monitor("Time=%0t: M1=%b, M2=%b, MT=%b, S=%b", 
             $time, light_M1, light_M2, light_MT, light_S);
    $dumpfile("wave.vcd");
    $dumpvars;
end

endmodule

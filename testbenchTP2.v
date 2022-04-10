`include "TP02.v"

module testbenchTP2();

    reg clk, in1, in2, controle, start;
    wire out1, out2;

    TP02 teste(clk,in1,in2,controle,start,out1,out2);

    initial begin
        $dumpfile("testbenchTP2.vcd");
        $dumpvars;
        $monitor($time,"in1=%b | in2=%b | out1=%b | out2=%b | controle=%b", in1, in2, out1, out2,controle);
        clk = 1'b1;

        controle = 1'b0;
        start = 1'b1;
        /*#2 in1=1'b0; in2=1'b1; controle=1'b1; start = 1'b0;
        #2 controle = 1'b0; in1=1'b0; in2=1'b1;
        #2 controle=1'b1;
        #2 controle = 1'b0; in1=1'b1; in2=1'b0;
        #2 controle=1'b1;
        #2 controle = 1'b0; in1=1'b1; in2=1'b0;
        #2 controle=1'b1;

        #2 in1=1'b1; in2=1'b0; controle=1'b1; start = 1'b0;
        #2 in1=1'b1; in2=1'b1; controle=1'b0;
        #2 controle=1'b1;
        #2

        #2 in1=1'b0; in2=1'b1; controle=1'b1; start = 1'b0;
        #2 in1=1'b0; in2=1'b1; controle=1'b0;
        #2 controle=1'b1;
        #2 in1=1'b0; in2=1'b1; controle=1'b0;
        #2 controle=1'b1;

        #2 in1=1'b0; in2=1'b1; controle=1'b1; start = 1'b0;
        #2 in1=1'b1; in2=1'b0; controle=1'b0;
        #2 controle=1'b1;
        #2 in1=1'b0; in2=1'b0; controle=1'b0;
        #2 controle=1'b1;*/
        
        $finish;
    end

    always #1 clk = ~clk;

endmodule
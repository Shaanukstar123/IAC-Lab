// This test bench will figure out the error in the first code

module regression_1_tb();
    logic clk;
    logic [1:0] op;
    logic [31:0] input1;
    logic [31:0] input2;
    logic [31:0] outputr;


    initial begin
        $dumpfile("reg_1.vcd");
        $dumpvars(0, regression_1_tb);

        op = 3;
        input1 = 12;
        input2 = 12;
        #1
        clk = 0;
        #1
        clk=1;
        #1

        assert(input1&input2 == outputr) else begin
            $fatal(1, "Mistake in opcdoe: op=%d, expected=%d, calculated=%d", op, input1&input2, outputr);
        end
    
    end

    alu r1(.clk(clk), .op(op), .a(input1), .b(input2), .r(outputr));

endmodule
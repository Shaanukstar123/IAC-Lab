module e8_waveforms_tb(
);  
    logic clk;
    logic[4:0] a, b;
    logic[2:0] y;
    logic[2:0] xe; 
    initial begin
        $dumpfile("e8_waveforms.vcd");
        $dumpvars(0,e8_waveforms_tb);

        clk = 0;
        repeat(2050) begin
            #1 clk = !clk;
        end
    end 
    logic[9:0] a_and_b;
    assign a = a_and_b[4:0];
    assign b = a_and_b[9:5];
    initial begin
            a_and_b = 0;
            repeat (1024) begin
                @(posedge clk)
                a_and_b = a_and_b + 1; 
                    $display("a=%d, b=%d", y, xe,);  
            end
    end 

    f dut(.a(a), .b(b), .y(y), .xe(xe));
endmodule

module e8_waveforms_tb(
);  
    logic clk;
    logic[4:0] i, j;
    logic[2:0] y;
    logic[2:0] xe; 
    initial begin
        $dumpfile("e8_waveforms.vcd");
        $dumpvars(0,e8_waveforms_tb);

        clk = 0;
        repeat(100000) begin
            #1 clk = !clk;
        end
    end    
    initial begin
            @(posedge clk)
            for (i=0;i<8;i++) begin
                @(posedge clk)
                for (j=0;j<8;j++) begin
                    @(posedge clk)
                    $display("a=%d, b=%d", i, j,);  
                end
            end 
    end

    f dut(.a(i), .b(j), .y(y), .xe(xe));
endmodule
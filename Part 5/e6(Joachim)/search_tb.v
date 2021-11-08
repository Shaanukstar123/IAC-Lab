
module search_tb(    
);
    logic reset, clock;
    logic[31:0] i;
    initial begin
        $dumpfile("search.vcd");
        $dumpvars(0, search_tb);
        clock = 0;

        #5;

        repeat (100000) begin
            #1 clock = !clock;
        end

       
    end

    initial begin
       
        @(posedge clock);
        reset = 1;
        #1;

        @(posedge clock);
        #1;
        reset = 0;

        repeat (100) begin
            @(posedge clock);
            
        end
        $display("i=%d,  time=%t", i, $time);
        
    end
    search se(
        .reset(reset),
        .clock(clock),
        .i(i)
    );
endmodule
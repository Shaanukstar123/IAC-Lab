module search(
    input logic reset,
    input logic clock,
    output logic[31:0] i
);

    logic[31:0] mid;
    logic test;
    logic[31:0] lo, lo_next;
    logic[31:0] hi, hi_next;

    f s(mid, test);
    
    always @(*) begin
     if (lo < hi) begin
        
        
        mid = (lo + hi)/2;
        

        if (test == 1) begin
            hi_next = mid;
            lo_next = lo;
        end
        else begin
            lo_next = mid;
            hi_next = hi;
        end
        i = lo;
     end

    end

    always @(posedge clock) begin 
        if (reset==1) begin
            lo <= 0;
            hi <= 31'h7FFFFFFF; 
        end
        else begin
             lo <= lo_next;
             hi <= hi_next;
        end
    end
    endmodule
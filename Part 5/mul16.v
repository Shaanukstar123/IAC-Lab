
module mul16(
    input clk,
    input logic[15:0] a,
    input logic[15:0] b,
    output logic[31:0] r
);

// note there is not valid in nor valid out (check testbench, maybe it's related to that, and also to the fact that it does everythin in one cycle so there is not risk of loosing data by uploading the next ones)
    logic [15:0] a_reg, b_reg;

    always_ff @(posedge clk) begin
        a_reg <= a; // why does it use temporary registers? ANS because in other modules you need temporary registers to make it in parallel so the output will be delayed by one (the output is that of reg_a, not of a)
        b_reg <= b;
        r <= a_reg * b_reg; 
    end

endmodule


// how is this pipelined? 
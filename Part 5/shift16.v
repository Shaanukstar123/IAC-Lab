module shift16(
    input clk,
    input logic[15:0] a,
    input logic[3:0] distance,
    output logic[31:0] r
);

// note there is not valid in nor valid out (check testbench, maybe it's related to that, and also to the fact that it does everythin in one cycle so there is not risk of loosing data by uploading the next ones) 
   // parameter zero_up = 15-distance;
  //  parameter zero_down = distance -1;
// can you create parameters from wires????????
    logic [15:0]  mp, b;

  //   logic mc = {zero_up'b0, 1,zero_down'b0}
// I don't this would work as it would mean using compile time variables that don't have a synthetised counterpart 
// try this instead, it's longer but more likely to work
    always_comb begin 
        case(distance)
        0: mp = {15'b0, 1'b1};
        1: mp = {14'b0, 1'b1, 1'b0};
        2: mp = {{13'b0,1'b1},2'b0};
        3: mp = {12'b0,1,3'b0};
        4: mp = {11'b0,1,4'b0};
        5: mp = {10'b0,1,5'b0};
        6: mp = {9'b0,1,6'b0};
        7: mp = {8'b0,1,7'b0};
        8: mp = {7'b0,1,8'b0};
        9: mp = {6'b0,1,9'b0};
        10: mp = {5'b0,1,10'b0};
        11: mp = {4'b0,1,11'b0};
        12: mp = {3'b0,1,12'b0};
        13: mp = {2'b0,1,13'b0};
        14: mp = {1'b0,1,2'b0};
        15: mp = {1,15'b0};
        endcase 
    end

    always_ff @(posedge clk) begin 
        b <= mp;
    end 

    // I think this block has to be combinatorial, not sequential (but then it would take only one cycle)
    // I can't do it with a for loop in which 2 multiplies itself by itself distance number of times becuase each multiplication takes one cycle 
    mul16 multiplier(
        .clk(clk),
        .a(a),
        .b(b),
        .r(r)
    );

endmodule


// how is this pipelined? 
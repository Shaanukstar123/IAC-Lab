module f(
    input logic[4:0] a,
    input logic[4:0] b,
    output [2:0] xe,
    output [2:0] y
);  

    logic[2:0] a_3, b_3;

    assign a_3 = a[2:0];
    assign b_3 = b[2:0];
    assign xe = (a_3 & b_3);
    assign y = (a_3|b_3);

    
endmodule
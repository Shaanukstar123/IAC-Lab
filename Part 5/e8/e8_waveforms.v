module f(
    input logic[4:0] a,
    input logic[4:0] b,
    output [2:0] xe,
    output [2:0] y
);  

       
    assign xe= ((a[2:0])&b[2:0]);
    assign y = ((a[2:0])|b[2:0]);

        
endmodule

module f(
    input logic[31:0] a,
    output logic r
);

    logic[31:0] i;
    always_comb begin
        i = 12; // Set the I value here
        if (a>i) begin
            r = 1;
        end

        else begin
            r = 0;
        end

    end
endmodule
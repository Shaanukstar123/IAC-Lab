module e1_truth(
    input logic[2:0] a,
    input logic[3:0] b, 
    output logic[2:0] y,
    output logic ex
);
        always_comb begin
        if (a == 3'b001) begin
            if (b == 1) begin
            ex = 0;
            y = 3;
            end
            else if (b == 3) begin
                ex = 0;
                y = 0;
            end
        end
        else if (a == 3'b100 || a == 3'b110) begin
            
            if (b == 1) begin
                ex = 0;
                y = 2;
            end
            else if (b == 4) begin
                ex = 1;
                y = 0;
            end 
        end 
        else if (a == 3'b111 && b == 2) begin
            ex = 1;
            y = 2;
        end 
        else begin
            ex = 0;
            y =0;
        end
    end

endmodule
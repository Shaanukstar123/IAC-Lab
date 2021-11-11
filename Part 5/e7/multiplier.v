module multiplier(
    input clk,
    input logic valid_in,
    input logic[31:0] a,
    input logic[31:0] b,
    output logic valid_out,
    output logic[63:0] r
);
    logic[31:0] mp, mp_next;
    logic[63:0] mc, mc_next;
    logic[63:0] acc, acc_next;
    logic[5:0] i, i_next;

    logic[3:0] mp_nibble;

    assign mp_nibble = mp[3:0];

    always_comb begin
        case (valid_in)
            1 : begin mp_next = a;  mc_next = b; acc_next = 0; i_next = 0; end
            0 : begin case (i)
                8: begin ; end
                default: begin mp_next = mp>>4; mc_next = mc<<4; acc_next = acc+ mp_nibble*mc; 
                i_next = (mp) ? i+1: 8;  end
            endcase
            end

        endcase
    end


    always_ff  @(posedge clk) begin
        mp <= mp_next;
        mc <= mc_next;
        acc <= acc_next;
        i <= i_next;
        case(i_next)
            8: begin r<= acc_next; valid_out <=1;end
            default: begin r<= r; valid_out <=0; end
        endcase
    end
endmodule

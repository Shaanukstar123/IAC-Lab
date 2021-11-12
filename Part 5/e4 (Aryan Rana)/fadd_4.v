module fadd_1bit(

 input logic a,
 input logic b,
 input logic cin,
 output logic cout,
 output logic sum

);

    //Cout = (A ⋅ B) + (Cin ⋅ (A ⊕ B)).
    //S = A ⊕ B ⊕ Cin
    
    logic a_xor_b;
    bxor_gate sum_1(.a(a) , .b(b), .r(a_xor_b));
    bxor_gate sum_2(.a(a_xor_b), .b(cin), .r(sum));

    logic cin_and_a_xor_b;
    logic a_and_b;
    band_gate cin_1(.a(a_xor_b), .b(cin), .r(cin_and_a_xor_b));
    band_gate cin_2(.a(a), .b(b), .r(a_and_b));
    bor_gate cin_3(.a(a_and_b), .b(cin_and_a_xor_b), .r(cout));;

endmodule 

module fadd_4(

    input logic[3:0] a,
    input logic[3:0] b,
    output logic[3:0] r

);
     
     logic [3:0] cout;

     fadd_1bit bit_1(.a(a[0]), .b(b[0]), .cin(1'b0),    .cout(cout[0]), .sum(r[0]));
     fadd_1bit bit_2(.a(a[1]), .b(b[1]), .cin(cout[0]), .cout(cout[1]), .sum(r[1]));
     fadd_1bit bit_3(.a(a[2]), .b(b[2]), .cin(cout[1]), .cout(cout[2]), .sum(r[2]));
     fadd_1bit bit_4(.a(a[3]), .b(b[3]), .cin(cout[2]), .cout(cout[3]), .sum(r[3]));

    
    

endmodule
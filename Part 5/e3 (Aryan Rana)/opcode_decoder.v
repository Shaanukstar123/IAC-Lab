module opcode_decoder(
  input logic [5:0] opcode,
  output logic itype, rtype, jtype
  );

 always @(*) begin
   case(opcode[0])

   0:  begin rtype = 1; jtype = 0; itype = 1; end
   1:  begin jtype = 1; itype = 1; rtype = 0; end

   endcase
  end

endmodule
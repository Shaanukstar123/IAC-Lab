module fadd4_tb();

   logic[7:0] ab;
   logic[3:0] r;

  fadd_4 dut(

    .a(ab[7:4]),
    .b(ab[3:0]),
    .r(r)

  );

initial begin 

    ab=0;
    repeat(512) begin //abis 4 bit but we loop 512 for edg condition which we check 255 and 0.
         
         #1; //to give time to the fadd dut module to work out what r is.

        assert( r == (ab[3:0] + ab[7:4]) );
        $display("i=%d, a=%d, b=%d, r=%d",ab ,ab[7:4] ,ab[3:0] ,r);


        ab= ab+1;
    end

end

endmodule
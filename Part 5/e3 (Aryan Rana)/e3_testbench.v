module e3_testbench();
    logic[5:0] opcode;
    logic jtype;
    logic itype;
    logic rtype;

    initial begin
        $dumpfile("e3_testbench.vcd");
        $dumpvars(0, e3_testbench);

        opcode=6'b100100;
        #1;
        assert(jtype == 0);
        assert(rtype == 1);
        assert(itype == 1);

        opcode=6'b001001;
        #1;
        assert(jtype == 1);
        assert(rtype == 0);
        assert(itype == 1);

        opcode=6'b110111;
        #1;
        assert(jtype == 1);
        assert(rtype == 0);
        assert(itype == 1);
        
        opcode=6'b000000;
        #1;
        assert(jtype == 0);
        assert(rtype == 1); 
        assert(itype == 1);

    end

    opcode_decoder dd(
        .opcode(opcode),
        .itype(itype),  
        .rtype(rtype),
        .jtype(jtype)
    );
endmodule
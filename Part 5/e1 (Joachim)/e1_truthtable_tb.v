module e1_truth_tb();

    logic[3:0] b;
    logic[2:0] y, a;
    logic ex;

    initial begin
        $dumpfile("e1_truth.vcd");
        $dumpvars(0, e1_truth_tb);

        a[0] = 1;
        a[1] = 0;
        a[2] = 0;
        b[3:0] = 1;
        #1;
        assert(ex==0);
        assert(y[2:0]==3);
        $display("ex=%d, y=%d, expected ex = 0 and y = 3, a = %d , b = %d", ex, y, a, b);
        a[0] = 0;
        //a[1] = 0;
        a[2] = 1;
        b[3:0] = 1;
        #1;
        assert(ex==0);
        assert(y[2:0]==2);
        $display("ex=%d, y=%d, expected ex = 0 and y = 2, a = %d , b = %d", ex, y, a, b);

        a[0] = 0;
        //a[1] = x;
        a[2] = 1;
        b[3:0] = 4;
        #1;
        assert(ex==1);
        assert(y[2:0]==0);
        $display("ex=%d, y=%d, expected ex = 1 and y = 0, a = %d , b = %d", ex, y, a, b);

        a[0] = 1;
        a[1] = 1;
        a[2] = 1;
        b[3:0] = 2;
        #1;
        assert(ex==1);
        assert(y[2:0]==2);

        a[0] = 1;
        a[1] = 0;
        a[2] = 0;
        b[3:0] = 3;
        #1;
        assert(ex==0);
        //assert(y[2:0]==x);

    end

    e1_truth dut(a,b,y,ex);

endmodule
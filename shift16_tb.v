
module shift16_tb(
);
    input clk;
    input logic[15:0] a;
    input logic[3:0] distance;
    output logic[31:0] r;

    initial begin 
        $dumpfile("shift16_tb.vcd");
        $dumpvars (0, multiplier_pipelined_tb); 

        clk = 0; 

        #10

        repeat (1000) begin 

            #10 clk = !clk;
        end 

        $fatal(1, "Testbench timed out");
    end 
        
        

    initial begin 
        a = 0;
             

        repeat (10) begin
            distance = 0;
                
            @(posedge clk);    
            
            repeat (15) begin
                #19;
                distance = distance + 1;    
            end 
              
            #19; // inject stimulus 1 ns before the next clock edge 
            a = a+1;
        end 
    end 

    logic [15:0] a_d1, a_d2;
    logic [3:0] r_d1, r_d2; 

    always_ff @(posedge clk ) begin 
        #1; 
        a_d1 <= a; 
        r_d1 <= r; 
        a_d2 <= a_d1;
        r_d2 <= r_d1; 
    end


    initial begin 

        repeat (150) begin 
            @(posedge clk)

            #4; 

            $display ("a=%d, distance=%d, r=%d", a, distance, r); 
            assert (r==a_d2*(2^distance)) else $fatal(2, "Wrong output"); 
        end

        $finish; 
    end 
        
    shift16 m(
        .clk(clk),
        .a(a), 
        .distance(distance),
        .r(r)

    );

 
endmodule


// how is this pipelined? 
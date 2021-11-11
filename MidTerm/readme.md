## Repository for MidTerm assesment  -  ToC

### Errors  
*v1*

Module: 1 bit **adder**.<br>
TB: initialise input and expected output, increment by 27 x and assert expected result.<br>
Error: wrong width.<br>
***
*v2*

Module: **Flip-Flop** (1 bit).<br>
TB: hardcoding a changing clock and manually changing input.<br>
Error: need to use always_ff and specify the clock edge in the module .<br>
***
*v3*

Module: **Flip-Flop** (1 bit) with clock enable (always_ff + asserted enable).<br>
TB: Manually change d and assert q at different prints in the clock cycle .<br>
Error: wrong assertion
***
*v4*

Module: **OR-gate** (1 bit), sequential.<br>
TB: manually set inputs and assert the right answer.<br>
Error: wrong conditions in module
***
*v5*

Module: **full adder** (1 and 4 bits).<br>
TB: loop, inputs are the loop counter, divided by $2^5$ and bitwise ANDed with FFFF (I think it needs to limit the number when it gets too big as the adder can take it only 4 bits.<br>
Error: 4 bit addition started from the MSB
Tags: **adder**
***
*v6*

Module: **hamming weight counter**, recursive composition (from very small modules, cfr divide and conquer) .<br>
TB: tests all possible cases and check that the hamming count is always rigth
Error: width didn't take into account overflow when all bits were 1.<br>
Tags: **zero-extending**, **fatal message** for failed assertion, **non synthetsisable counter**.<br>
***
*v7*

Module: **add-sub** (16 bits).<br>
TB: performs some testing operations for each opcode.<br>
Error: wrong assertions.<br>
Tags: **case** (interesting use with multiple action associated with one condition)

### Functional Units
*Multiplier - Iterative* <br>
TB: **global clock** with **timeout**, interesting timing for sequential logic TBs.<br>
v0: binary multiplication (shift mp and mc),loads value when it's in ready state, signals when output is ready, uses **always(*)*** and **always_ff** as it takes more than 1 cycle.<br>
v1: same as v0, but switches the use of the comb and sequential blocks.<br>
v2: uses **nibble**, performs hexadecimal multiplication, requires more hardware (a multiplier) but it's faster.<br>
v3: simply multiplies the two numbers.<br>

*Multiplier - Pipelined/ Parallel* <br>
TB: **timing**, have to wait two cycles before asserting as the output comes out later, asserts and the generation of inputs is in two separate blocks .<br>
v0: store in a register and multiply (2 cycles).<br>
v1: split number in four sections, multiply all of them by the mp and append them together with the right zero extension.<br>
v2: separate in two parts both the mc and mp, take the four multiplications and append them with the right zero extension.<br>
v3: same as v2 but the combinatorial part is the appending.<br> 
v4: divide in three parts, instead of zero extending shift before appending.<br>
v5: create 33 signals so you can do it sequentially but in one cycle (if passing from one logic to the other you don't need to wait for clock cycles), **nested arrays**.<br> 

*Register File* <br>
TB: **local parameters**, **time format** declaration, **shadow** to predict results, **random** generation with choice of probability of one value to be extracted, timing control: wait #1 at posedge after inputs are set to allow for outputs to comeout and then assert.<br>
v0: elif statements.<br>
v1: case statements.<br>
v2: **mux** for assign.<br>
v3: **nested muxes**.<br>

### Exercises
*e1*
Module: **truthtable**, **don't care**

### General Comments 
- **^** is bitwise **XOR**
- **~** is bitwise **NOT**
- **?** is a mux **MUX**. For example "result <= select ? a : b". This means: result = a if select == 1 and result = b if select = 0

### Common Errors 
- not instantiating the module in the testbench
- syntax (ie commas, semicolons, @(posedge clk), endcase ecc) 
- wrong file name (because of cut and paste)
- wrong width input/output
- giving a value to a wire without using assign/ logic block (ie logic [1:0] rel = input; WRONG   logic[1:0] rel;  assign rel = input; RIGHT) 
- 

### Resources 
http://web.engr.oregonstate.edu/~traylor/ece474/beamer_lectures/verilog_operators.pdf    **Verilog Operators**
https://class.ece.uw.edu/cadta/verilog/operators.html **Summary of operators (shorter version for a quick look)**







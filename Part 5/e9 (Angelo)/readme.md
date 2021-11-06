e9 is a Finite State Machine. 

The FSM implements the following function:

After being initialised by setting the running sum and count to 0, after passing a value
into the FSM, it will be added to the running sum, and the count variable will update by
adding 1 to it. This in effect creates a running total with the amount of added values being
tracked.

It is also clocked, so it only works when the clock goes high. 

If nothing is done, no reset or value passed, the present value is maintained.

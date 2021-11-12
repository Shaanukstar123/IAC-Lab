e12 - Regression
----------------

The module `accumulator` is intended to track the running sum of two
inputs "up" and "down". The output should be:
```
sum_{i+1} = ( ( clear_i ? 0 : sum_i ) + up_i + down_i ) mod 2^32
```
where values with the subscript i are values before the
clock edge i, and sum_{i+1} is the value after clock edge i.
The value of sum_0 is undefined.

There are at least two distinct faults in the implementation of `accumulator`, arising
from two different mistakes in the module.

Create test-bench modules `accumulator_tb_1` and `accumulator_tb_2` which test
for the two different faults. Each test-bench should test for
just one fault, and should produce a failure code if the fault
exists, or a success code if that specific fault has been removed.

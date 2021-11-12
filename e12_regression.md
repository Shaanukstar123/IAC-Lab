e1 - Raster
-----------

Create a module called `raster` that generates a stream of (x,y) raster co-ordinates
for a 12 (width) x 8 (height) pixel display. In each cycle the module generates
one (x,y) co-ordinate, proceeding through each pixel in the row y=0 from x=0 to x=11, then
row y=1 from x=0 to x=11, and so on:
```
(0,0),(1,0),(2,0),...,(10,0),(11,0),(0,1),(1,1),(2,1),...,(10,1),(11,1),(0,2),...
```

The module has the following ports:

- A clock input called `clk`
- A 1-bit input called `reset` (active high)
- A 4-bit output called `x`
- A 4-bit output called `y`

The sequence should start at (0,0) in the cycle following a reset, and then repeatedly
cycle through the 96 (12x8) co-ordinates.

Until `reset` has been driven high and fallen, the outputs of the module are undefined (i.e. they can take any value).

The outputs are also undefined in cycles where reset was high in the previous cycle.

The sequence of signal values at the rising clock edge could be:

- reset=0, x=?, y=?
- reset=1, x=?, y=?
- reset=0, x=?, y=?
- reset=0, x=0, y=0
- reset=0, x=1, y=0
- reset=0, x=2, y=0
- ...

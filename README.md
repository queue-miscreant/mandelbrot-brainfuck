The Mandelbrot set in brainfuck.

To run, use `./bfint.py mandelbrot`

Tests points in increments of 1/16 from -1.9375+1.9375i to 1.9375-1.9375i.
Never uses undefined behaviors of '-' instruction on cells containing 0.
Implemented on 1 byte-sized cells.

Number of Iterations
--------------------
To get a sharper image of the set (well, as sharp as you can when you're using 
test points every 1/16th), try adding more '+' commands in the 'mandelbrot'
file where it says "number of iterations" next to 3 +s

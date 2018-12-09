placetest: try calculating z^2

Starting off simple; let's put some numbers in.

	negative
+>
	one
+>
	point 5
++++++++>
	plus i times
>
>
	point 5
++++++++
	ir
<<<<
	and ii so
	we move fr and fi into the im accumulator
	2fr into the plus re accumulator and
	2fi into the minus re accumulator
[>>>[-<<<->[->>>>+>>>>+>++>>>+>+<<<<<<<<<<<<<]>>>[->>+>>>+>>>++>+>>>+<<<<<<<<<<<<]<]
	else double check the ir is still 1 (and ii is 0)
	so we move fi into the im accumulator
	and 16 plus 2fr into the plus re accumulator
<<<[->[->>>>+>>>>>++>>>+>+<<<<<<<<<<<<<]>>>[->>+>>>+>>>>+>>>+<<<<<<<<<<<<]>>>>>>++++++++++++++++<<<<<<<<<<]
	else if ii is 1 and ir was 0
	move fr into the im accumulator
	and 16 plus 2fi into the minus re accumulator
]>>>[-<<[->>>>+>>>>+>>>>+>+<<<<<<<<<<<<<]>>>[->>+>>>>>>++>+>>>+<<<<<<<<<<<<]>>>>>>>>++++++++++++++++<<<<<<<<<]
	if there's any data left in fr and fi cells
	move them to their 'registers'
<<[->>>>+>>>>>>>>+>+<<<<<<<<<<<<<]>>>[->>+>>>>>>>+>>>+<<<<<<<<<<<<]



multiply fr and fi
>>[-<[->>+>+<<<]>>[-<<+>>]<]
>>
shift down four bytes
[-[-[-[-
[-[-[-[-
[-[-[-[-
[-[-[-[->+>>]]]]]]]]]]]]]]]
<<[<<<]>>]
>>>>>>>>>+<<<

[[->]>[-<]<]+>>>[>]<-<<
	check if positive
[-<+[-<[->>+>+<<<]>>[-<<+>>]<]
>>
[-[-[-[-
[-[-[-[-
[-[-[-[-
[-[-[-[-<<<<<<+>]]]]]]]]]]]]]]]
<[>>>>>]>]
<]< 
	check if we were negative instead
[->>[-<<<[->+>+<<]>[-<+>]>>]<
[-[-[-[-
[-[-[-[-
[-[-[-[-
[-[-[-[-<<<+<]]]]]]]]]]]]]]]
>[>>>>]<]<]
	remove the sum of fr and fi and replace with a balance
<[-]<<

to be continued

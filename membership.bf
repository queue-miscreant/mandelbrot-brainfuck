membership: test membership of a point in the set after three iterations

	negative
+>
	one
>
	point 5
++++++++>
	plus i times
>
>
	point 5
++++++++> 
>>>
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
<<<<<<<<

48 for outputting a 0 or other numbers
++++++++++++++++
++++++++++++++++
++++++++++++++++
>>
three iterations left
+++[>>
		ir and ii so
		we move fr plus fi plus 16 into the im accumulator
		2fr into the plus re accumulator and
		2fi into the minus re accumulator
	[>>>[-<<<->[->>>>+>>>>+>++>>>+>+<<<<<<<<<<<<<]>>>[->>+>>>+>>>++>+>>>+<<<<<<<<<<<<]>>>>>++++++++++++++++<<<<<<]
		else double check the ir is still 1 (and ii is 0)
		so we move fi into the im accumulator
		and 16 plus 2fr into the plus re accumulator
	<<<[->[->>>>+>>>>>++>>>+>+<<<<<<<<<<<<<]>>>[->>+>>>+>>>>+>>>+<<<<<<<<<<<<]>>>>>>++++++++++++++++<<<<<<<<<<<]
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
	<[-]

there's still some fi here from earlier
<<<<[-<++>]<<<<[-]
at si
<<<[<<<[->>>-<<<]>>>[->>>>>+<<<<<]]
if sr is 1 and si is 0
<<<[->>>>>>>>+<<<<<<<<]

<<<<
nondestructively copy fi
[->>>>+>>>>>>>+<<<<<<<<<<<]>>>>[-<<<<+>>>>]<<<<<
nondestructively copy ii
[->>>>>+>>>>>>>++++++++++++++++<<<<<<<<<<<<]>>>>>[-<<<<<+>>>>>]<<<<<<
nondestructively copy si
[->>>>>>+>>>>>>+<<<<<<<<<<<<]>>>>>>[-<<<<<<+>>>>>>]
go to the sign we just calculated
>>>>>>
	both negative
[>>[->[-<<+>>]<<<-<+>>>]<<
	if only sign from c is negative
[>[[->]>[-<]<]+<<[<]>>>[-<+<-<+>>>]<<[->->>[-<<+>>]<<<]]
]
	if only calculated sign is negative
>>[-<<+>>>[[-<]<[->]>]<<<[-<]>[-<+>>+>>[-<<+>>]<<<]>>]
	both positive
>[-<<+>>]
<<
	move sign over
<<[-<<+>>]>>
	move fpart over
[-<<+>>>+<]
>
[-[-[-[-
[-[-[-[-
[-[-[-[-
[-[-[-[->+>]]]]]]]]]]]]]]]
<[<<]>]
>[->+<<<<<----------------<+>>>>>]

<++<<+>>
[[->]>[-<]<]+<<[<<<<<<<[-<+<+>>]>>>>>>>>]
	IMPORTANT IF WE EXCEED 2i or minus 2i
>[-]>[-]>[-]
<<<<-

	ended in the cell immediately past storage registers
<<<<<<<<<<<<<

Real part
	move fraction
[->>>>>>>+>+<<<<<<<<]>>>>>>>[-<<<<<<<+>>>>>>>]<<<<<<<<
	move integer
[->>>>>>>>+>++++++++++++++++<<<<<<<<<]>>>>>>>>[-<<<<<<<<+>>>>>>>>]<<<<<<<<<
	move sign
[->>>>>>>>>+<<<<<<<<<]>>>>>>>>>
	if the sign is 1; move the number into the minus register and duplicate it back
[-<<<<<<<<<+>>>>>>>>>>[->>>>>>>>>>>>+<<<<<<<<<<<<]<]>
	otherwise, move into the plus register
[->>>>>>>>>>+<<<<<<<<<<]

>>>>>>>>>+>>>
	FINALLY subtract the registers
[[-<]<[->]>]<<<[-<]>[-<+>>+>>[-<<+>>]<<<]
	move sign
<[-<<<<<<<<<+>>>>>>>>>]> 
	move the rest
>[-<+<<<<<<<<+>>>>>>>>>]

<
[-[-[-[-
[-[-[-[-
[-[-[-[-
[-[-[-[->+>]]]]]]]]]]]]]]]
<[<<]>]

>[-<+<<<<<<<<----------------<+>>>>>>>>>>]

<<<++<<+>>
[[->]>[-<]<]+<<[<<<<<<<[-<+<+>>]>>>>>>>>]>[-]>[-]
<<<-<<<<<<<

Circle test

!
	if we haven't already discluded this result
[>>

[->>>>>+>>>>>++++++++++++++++<<<<<<<<<[->>>>>+>+>>>++<<<<<<<<<]<]
>[->>>>>+>+<<<<<<]>>>>[-<<<<<+>>>>>]
	real ipart is nonzero
	add 2fr and 16 into accumulator
<<[->>+>>>>>++++++++++++++++<<<<<<[->>>>>>++>>>+>+<<<<<<<<<<]<]
>[->>>>>>>>>+>+<<<<<<<<<<]>[-<<+>>]>

	square fr
[->[->+>+<<]>[-<+>]<<]
>>>
[-[-[-[-
[-[-[-[-
[-[-[-[-
[-[-[-[->+>]]]]]]]]]]]]]]]
<[<<]>]

>>>>>
	square fi
[-<[-<+<+>>]<[->+<]>>]
<<<
[-[-[-[-
[-[-[-[-
[-[-[-[-
[-[-[-[-<+<]]]]]]]]]]]]]]]
>[>>]<]
>>
	move fi back
[-<<<<<<<<<+>>>>>>>>>]<<<
	check upper bits of result only
[-[-[-[-
[-[-[-[-
[-[-[-[-
[-[-[-[->+>]]]]]]]]]]]]]]]
<[<<]>]
	compare to 2 squared
>>+<<<++++
	move the counter if exceeded circle bounds
[[->]>[-<]<]+>>>[<<<<<<<<<<<<<<[-<+<+>>]>>>>>>>>>>>>>>>]
<-<[-]<[-]<[-]
	move fr back
<<[-<<<<<<+>>>>>>]<<<<<<<<<
[->>>>>>>+<<<<<<<]

]

	move iteration tester back less than one
>>>>>>>[-[-<<<<<<<+>>>>>>>]]<<<<<<<]

<<.>[-<->>+<]
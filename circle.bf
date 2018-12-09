circle: test if the point is in a circle of radius 2


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
++++++++>
48 for outputting a 0 or other numbers
++++++++++++++++
++++++++++++++++
++++++++++++++++
>>
three iterations left
+++>

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

<<<<
	real ipart is nonzero
	add 2fr and 16 into accumulator
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

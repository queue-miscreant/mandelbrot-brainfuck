#!/usr/bin/env python3
import sys
import os

class interpreter:
	strip = [0 for i in range(300)] #data stored here
	pointer = 0 #where in the data

	program = ""	#program stored here
	instruction = 0 #where in the program

	bracketPositions = []
	breakpoint = False
	breakpoint2 = False

	def __init__(self,program,debug,always):
		self.program = program
		self.debug = debug
		self.always = always

	#if ouput is going to be 8 cells in either direction = (8*2)+1 numbers * 3 spaces = 51 columns
	#the cell with focus needs to be centered
	#if pointer - 8 is negative, then we need to pad spaces for numbers that don't exist (or just use the other end of the strip?)
	#do that, so we don't pad spaces, we just need to check for negatives
	def showStrip(self):
		if self.always or self.breakpoint:
			output = []
			celnos = []
			ran = 16
			if self.pointer < 7:
				ran -= 8-self.pointer
				output = self.strip[self.pointer-7:]
	#			celnos = [len(self.strip)-i for i in reversed(range(7-self.pointer))]
	#			celnos.extend(range(0,self.pointer))
			print(('   '*9) + '  v')
			start = max(self.pointer-7,0)
			output.extend(self.strip[start:start+ran])
	#		celnos.extend([i for i in range(self.pointer+1,self.pointer+8)])
	#		print('│'.join(['%3.f' % i for i in celnos]))
			print('│'.join(['%3.f' % i for i in output]))
			output = ''
			print('    '*(max(0,7-self.instruction)) + '│'.join([' %s ' % self.program[i]
				for i in range(max(0,self.instruction-8),min(len(self.program),self.instruction+8))]),end="\x1b[K\n")
		if self.breakpoint:
			print(self.instruction,self.pointer)
			a = input()
			if a:
				if 'step'.find(a) == 0:
					pass
				elif 'next'.find(a) == 0:
					self.pointer += 1
					self.showStrip()
				elif 'previous'.find(a) == 0:
					self.pointer -= 1
					self.showStrip()
				else:
					self.breakpoint = False
			else:
				self.breakpoint = False
					
			print(end="\x1b[2F")
				
		print(end="\x1b[3F")

	def interpret(self,ins):
		if ins == '+':
			self.strip[self.pointer] = (self.strip[self.pointer] + 1) % 256
		if ins == '-':
			self.strip[self.pointer] = (self.strip[self.pointer] - 1) % 256
		if ins == '>':
			self.pointer = (self.pointer + 1) % len(self.strip)
		if ins == '<':
			self.pointer = (self.pointer - 1) % len(self.strip)
		if ins == '[':
			#if i cared, i'd compute matching brackets
			if not self.strip[self.pointer]:
				counter = 1
				for i in range(self.instruction,len(self.program)):
					if self.program[i] == '[':
						counter += 1
					elif self.program[i] == ']':
						counter -= 1
						if not counter:
							self.instruction = i+1
							break
			else:
				self.bracketPositions.append(self.instruction-1)
		if ins == ']':
			self.instruction = self.bracketPositions.pop()
		if ins == '!': #BREAK
			self.breakpoint = True
			self.breakpoint2 = True
		if ins == '?': #BREAK
			self.breakpoint = self.breakpoint2
		if ins == '.':
			if self.debug:
				with open("debug",'a') as a:
					a.write(chr(self.strip[self.pointer]))
				return
			print(end=chr(self.strip[self.pointer]))

	def start(self):
		try :
			while self.instruction < len(self.program):
				if self.debug:
					self.showStrip()
				self.instruction += 1
				self.interpret(self.program[self.instruction-1])
			if isdebug:
				self.showStrip()
				print("\n\n")
		except KeyboardInterrupt: pass

if len(sys.argv) > 1 and os.path.isfile(sys.argv[1]):
	program = ""
	with open(sys.argv[1]) as a:
		program = a.read()
	isdebug = "-d" in sys.argv
	always = "-s" in sys.argv
	progmin = [i for i in program if i in '+-<>[]!?.']
	if "-min" in sys.argv:
		with open(sys.argv[1]+"min",'w') as a:
			a.write(''.join(progmin))
	else:
		interpreter(progmin,isdebug,always).start()
				
else:
	exit()

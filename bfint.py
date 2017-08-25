#!/usr/bin/env python3
import sys
import os

class interpreter:
	def __init__(self,program,debug,always):
		self.debug = debug		#debugger active
		self.always = always	#always show the strips

		self.strip = [0 for i in range(300)] #data stored here
		self.pointer = 0 #where in the data
		self.program = program
		self.instruction = 0 #where in the program

		self.breakpoint = False		#breakpoints. ! sets breakpoints and turns on breakpointing for ?
		self.breakpoint2 = False

		self.lastCommand = "continue"
		#line buffered, not system default
		self.outfile = os.fdopen(sys.stdout.fileno(),'w',1)

		self.bracketPositions = []

	def computeJumps(self):
		self.jumps = {}
		jumpstack = []
		for i,j in enumerate(self.program):
			if j == '[':
				jumpstack.append(i)
			elif j == ']':
				jump = jumpstack.pop()
				self.jumps[i] = jump
				self.jumps[jump] = i

	#if ouput is going to be 8 cells in either direction = (8*2)+1 numbers * 3 spaces = 51 columns
	#the cell with focus needs to be centered
	#if pointer - 8 is negative, then we need to pad spaces for numbers that don't exist (or just use the other end of the strip?)
	#do that, so we don't pad spaces, we just need to check for negatives
	def showStrip(self):
		if self.always or self.breakpoint:
			print(end="\x1b[3A")
			start = max(self.pointer-7,0)
			ran = max(7-self.pointer,0)
			print(('   '*9) + '  v')
			print('    '*(ran) + '│'.join(['%3.f' % i for i in self.strip[start:start+16-ran]]),end="\x1b[K\n")
			start = max(self.instruction-7,0)
			ran = max(7-self.instruction,0)
			print('    '*(ran) + '│'.join([' %s ' % i for i in self.program[start:start+16-ran]]),end="\x1b[K\n")
		if self.breakpoint:
			print(self.instruction,self.pointer)
			a = input()
			print(end="\x1b[2F")
			if not a: a = self.lastCommand
			if 'step'.find(a) == 0:
				self.lastCommand = "step"
				pass
			elif 'next'.find(a) == 0:
				self.lastCommand = "next"
				self.pointer += 1
				self.showStrip()
			elif 'previous'.find(a) == 0:
				self.lastCommand = "previous"
				self.pointer -= 1
				self.showStrip()
			elif 'continue'.find(a) == 0:
				self.lastCommand = "continue"
				self.breakpoint = False
			else:
				self.lastCommand = "continue"

	def interpret(self):
		ins = self.program[self.instruction]
		if ins == '+':
			self.strip[self.pointer] = (self.strip[self.pointer] + 1) % 256
		elif ins == '-':
			self.strip[self.pointer] = (self.strip[self.pointer] - 1) % 256
		elif ins == '>':
			self.pointer = (self.pointer + 1) % len(self.strip)
		elif ins == '<':
			self.pointer = (self.pointer - 1) % len(self.strip)
		elif ins == '[':
			#if i cared, i'd compute matching brackets
			if not self.strip[self.pointer]:
				counter = 0
				for i in range(self.instruction,len(self.program)):
					if self.program[i] == '[':
						counter += 1
					elif self.program[i] == ']':
						counter -= 1
						if not counter:
							self.instruction = i
							break
			else:
				self.bracketPositions.append(self.instruction-1)
		elif ins == ']':
			self.instruction = self.bracketPositions.pop()
		elif ins == '!': #BREAK
			self.breakpoint = True
			self.breakpoint2 = True
		elif ins == '?': #BREAK
			self.breakpoint = self.breakpoint2
		elif ins == '.':
			print(end=chr(self.strip[self.pointer]),file=self.outfile)

	def opt_interpret(self):
		ins = self.program[self.instruction]
		if ins == '+':
			self.strip[self.pointer] += 1
		elif ins == '-':
			self.strip[self.pointer] -= 1
		elif ins == '>':
			self.pointer = (self.pointer + 1) % len(self.strip)
		elif ins == '<':
			self.pointer = (self.pointer - 1) % len(self.strip)
		elif ins == '[':
			if not self.strip[self.pointer]:
				self.instruction = self.jumps[self.instruction]
		elif ins == ']':
			if self.strip[self.pointer]:
				self.instruction = self.jumps[self.instruction]-1
			#skip consecutive ]s
			else:
				for i in range(self.instruction+1,len(self.program)):
					if self.program[i] != ']':
						self.instruction = i-1
						break
		elif ins == '.':
			print(end=chr(self.strip[self.pointer]),file=self.outfile,flush=True)

	def start(self,optimize):
		if self.debug:
			print("\n\n")
			self.outfile = open("debug",'a')
		try :
			if optimize:
				self.computeJumps()
				while self.instruction < len(self.program):
					if self.debug:
						self.showStrip()
					self.opt_interpret()
					self.instruction += 1
				if self.debug:
					self.showStrip()
			else:
				while self.instruction < len(self.program):
					if self.debug:
						self.showStrip()
					self.interpret()
					self.instruction += 1
				if self.debug:
					self.showStrip()
		except KeyboardInterrupt: pass
		if self.debug:
			self.outfile.close()

if len(sys.argv) > 1 and os.path.isfile(sys.argv[1]):
	program = ""
	with open(sys.argv[1]) as a:
		program = a.read()
	isdebug = "-d" in sys.argv
	always = "-s" in sys.argv
	optimize = "-o" in sys.argv
	progmin = [i for i in program if i in '+-<>[]!?.']
	if "-min" in sys.argv:
		with open(sys.argv[1]+"min",'w') as a:
			a.write(''.join(progmin))
	else:
		interpreter(progmin,isdebug,always).start(optimize)

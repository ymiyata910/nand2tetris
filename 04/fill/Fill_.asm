// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(Check)
	@KBD
	D=M
	@Black
	D;JNE
	@White
	0;JMP

(Black)
	@i
	M=1
	@j
	M=1
	@SCREEN
	D=A
	@addr
	A=D

	(Line)
		@i
		D=M
		@32
		D=D-A
		@Lineend
		D;JGT

		(Column)
			@j
			D=M
			@16
			D=D-A
			@Columnend
			D;JGT
			@addr
			M=1
			A=A+1
		(Columnend)

	(Lineend)
	
	@Check
	0;JMP
	
(White)
	@i
	M=1
	@j
	M=1
	@SCREEN
	D=A
	@addr
	A=D
	
	(Line)
		@i
		D=M
		@32
		D=D-A
		@Lineend
		D;JGT

		(Column)
			@j
			D=M
			@16
			D=D-A
			@Columnend
			D;JGT
			@addr
			M=0
			A=A+1
		(Columnend)

	(Lineend)

	@Check
	0;JMP
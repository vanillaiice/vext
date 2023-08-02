all: linux win
linux:
	v -cg -keepc . -o bin/ext
win:
	v -cg -keepc . -os windows -o bin/ext.exe

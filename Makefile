calc: calc.tab.c lex.yy.c
	gcc -o calc calc.tab.c lex.yy.c -lfl
lex.yy.c: calc.l
	flex -l calc.l
calc.tab.c: calc.y
	bison -dv calc.y
clean:
	rm -f calc calc.output calc.tab.c calc.tab.h lex.yy.c

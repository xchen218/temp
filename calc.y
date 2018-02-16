%{
#include <stdio.h>
#include <string.h>
extern int yylineno;
%}

%token TOK_MAIN TOK_LB TOK_RB TOK_LP TOK_RP TOK_SEMICOLON TOK_SUB TOK_MUL TOK_PRINT TOK_NUM TOK_ID TOK_EQUAL TOK_KW TOK_ENTER

%union{
		float float_val;
    		struct identifier{
			char id_name[255];
			float id_val;
		}id_var;
}

%{
	struct identifier id_list[255];
	int global = 0;
	struct identifier* init(struct identifier id_var)
	{
		int n;
             	for(n = global; n>=0; n--){
			if(strcmp(id_var.id_name, id_list[n].id_name) == 0){
				return &id_list[n];break;
			}
		}
		return NULL;
        }
%}

%type <float_val> TOK_NUM 
%type <id_var> TOK_ID expr

%left TOK_SUB
%left TOK_DIV

%%

prog : TOK_MAIN TOK_LP TOK_RP TOK_LB stmts TOK_RB
;

stmts:
	|
	stmt TOK_SEMICOLON stmts 
;

stmt:
	TOK_KW TOK_ID
   	{
		global++;
		strcpy(id_list[global].id_name, $2.id_name);
      	}
	| TOK_ID TOK_EQUAL expr
	{
      		struct identifier *id_ptr = init($1);
		id_ptr->id_val = $3.id_val;
      	}
      	| TOK_PRINT TOK_ID
     	{
		struct identifier *id_ptr = init($2);
            	printf("%.1f\n", id_ptr->id_val);
      	}   
     	| TOK_LB stmts TOK_RB
     	{
		id_list[global].id_name[0]=0;
 		printf("%s\n",id_list[global].id_name);
		global--;
	}
;

expr:
    	TOK_NUM
     	{
     		$$.id_val = $1;
      	}
	| TOK_ID
     	{
		struct identifier *id_ptr=init($1);
		$$ = *id_ptr;
     	}
	| expr TOK_SUB expr
     	{
   		$$.id_val = $1.id_val - $3.id_val;
      	}
     	| expr TOK_MUL expr
     	{
      		$$.id_val = $1.id_val * $3.id_val;
      	}
	| TOK_LP TOK_SUB TOK_NUM TOK_RP
	{
		$$.id_val = -$3;
	}

;

%%


int yyerror(char *s) {
	fprintf(stderr,"Parsing error: line %d\n", yylineno);
        return 0;
}


int main() {
	struct identifier id_list[255];
	int line = 0;
	yyparse();
	return 0;
}

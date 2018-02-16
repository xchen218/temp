%{
#include<stdio.h>
#include<string.h>
#include"calc.tab.h"
int line=0;
%}

%option yylineno

digit [0-9]
id [a-z]([a-z]*[A-Z]*[0-9]*)*
%%
"main" 		{return(TOK_MAIN);}
"("     	{return(TOK_LP);}
")"     	{return(TOK_RP);}
"{"     	{return(TOK_LB);}
"}"     	{return(TOK_RB);}
"="     	{return(TOK_EQUAL);}
";"		{return(TOK_SEMICOLON);}
"-" 		{return(TOK_SUB);}
"*" 		{return(TOK_MUL);}

"float"	{return(TOK_KW);}
"print"	{return(TOK_PRINT);}
{digit}+"."{digit}+	{
				sscanf(yytext, "%f", &(yylval.float_val));
                        	return TOK_NUM;
			}
{id}+	{
		strcpy(yylval.id_var.id_name,yytext);
             	return TOK_ID;
	}
[\n]   	{}
[ \t]
.       {printf("Lexical analysis error:%c\n",yytext[0]);}
%%

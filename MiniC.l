%{
#include <stdio.h>
#include <stdlib.h>

enum tsymbol {	teof, tnot, tnotequ, tmod, tmodAssign, tand, tlparen, trparen, tmul, tmulAssign, tplus,tinc, taddAssign, tcomma, tminus, tdec, tsubAssign,tdiv, tdivAssign, tsemicolon, tless, tlesse, tassign,tequal, tgreat, tgreate, tlbracket, trbracket,tconst, telse, tif, tint, treturn, tvoid,twhile, tlbrace, tor, trbrace, tident,	tnumber, 
};
%}
%%
"const"		return(tconst);
"else"		return(telse);
"if"		return(tif);
"int"		return(tint);
"return"	return(treturn);
"void"		return(tvoid);
"while"		return(twhile);
"+"		return(tplus);
"-"		return(tminus);
"*"		return(tmul);
"/"		return(tdiv);
"="		return(tassign);
"%"		return(tmod);
"=="		return(tequal);
"!="		return(tnotequ);
"<="		return(tlesse);
">="		return(tgreate);
"&&"		return(tand);
"||"		return(tor);
"++"		return(tinc);
"--"		return(tdec);
"+="		return(taddAssign);
"-="		return(tsubAssign);
"*="		return(tmulAssign);
"/="		return(tdivAssign);
"%="		return(tmodAssign);
"("		return(tlparen);
")"		return(trparen);
","		return(tcomma);
";"		return(tsemicolon);
"["		return(tlbracket);
"]"		return(trbracket);
"{"		return(tlbrace);
"}"		return(trbrace);
[A-Za-z_][A-Za-z0-9_]*	return(tident);
[1-9][0-9]*|0([0-7]+|(x|X)[0-9A-Fa-f]*)?	return(tnumber);
"/*"([^*]|\*+[^*/])*\**"*/"	;
"//".*	;
[ \t\n]	;
.	return(yytext[0]);
%%
int yywrap() {
	return 1;
}
void main()
{	
	enum tsymbol tn; 
	printf("Start of Lex\n");
	while((tn=yylex())!=teof) {
		if(tn<=trbrace && tn>=tnot) // keyword, operator 출력
			printf("Token %-12s : (%2d, %7d)\n", yytext, tn, 0); 
		else if(tn==tident) // identifier 출력
			printf("Token %-12s : (%2d, %7s)\n", yytext, tn, yytext);
		else if(tn==tnumber) // constant 출력
			printf("Token %-12s : (%2d, %7s)\n", yytext, tn, yytext);
		else
			printf("error"); 
	}
}
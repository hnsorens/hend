%{
#include "parser.tab.h" // Include the Bison-generated header file
%}

%%
"'[^']'"    { yylval.string_val = strdup(yytext); return STRING_VALUE; }
"string"    { return STRING; } 
"struct"    { return STRUCT; }
"mod"       { return MODULE; }
"pub"       { return PUBLIC; }
"prv"       { return PRIVATE; }
"fn"        { return FUNCTION; }
"ret"       { return RETURN; }
"ex"        { return EXTEND; }
"req"       { return REQUIREMENT; }
"con"       { return CONSTRUCTOR; }
"void"      { return VOID; }
"obj"       { return OBJECT; }
"include"   { return INCLUDE; }
"int1"        { return I1; }        
"int2"        { return I2; }
"int4"        { return I4; }
"int8"        { return I8; }
"uint1"        { return UI1; }        
"uint2"        { return UI2; }
"uint4"        { return UI4; }
"uint8"        { return UI8; }
"float4"        { return F4; }
"float8"        { return F8; }
"bool"      { return BOOLEAN; }
"char"      { return CHARACTER; }
"for"       { return FOR; }
"if"        { return IF; }
"while"     { return WHILE; }
"!"         { return ERROR; }
"false"     { return FALSE_; }
"true"      { return TRUE_; }
[0-9]+      { yylval.int_val = atoi(yytext); return NUM; }
[a-zA-Z]+[0-9a-zA-Z]*   { yylval.string_val = strdup(yytext); return IDENTIFIER; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIVIDE; }
";"         { return SEMICOLON; }
":"         { return ASSIGN; }
"("         { return LPAREN; }
")"         { return RPAREN; }
"{"         { return LCBRACKET; }
"}"         { return RCBRACKET; }
"["         { return RBRACKET; }
"]"         { return LBRACKET; }
"\""        { return QUOTE; }
","         { return COMMA; }
" "         ; // Ignore whitespace
.           { yyerror("Invalid character"); }
%%

int yywrap() {
    return 1;
}
/*   example.l
 
	Example of a lex specification file.
     
	To create the lexical analyzer:

	flex example.l
	g++ lex.yy.c -o lexer
	lexer < inputFileName
*/

%{
/* 
Definitions of constants, variables, & function prototypes go here 
*/

// These need to be NON-ZERO!
#define T_IDENT     	1
#define T_INTCONST  	2
#define T_ADD	  	3
#define T_SUB	  	4
#define T_MULT	  	5
#define T_DIV	  	6
#define T_QUIT       	7
#define T_UNKNOWN   	99

int numLines = 0;

void printTokenInfo(const char* tokenType, 
                    const char* lexeme);

%}

/* Named defintions of regular expressions go here */

WSPACE		[ \t\v\r]+
NEWLINE		\n

DIGIT			[0-9]
LETTER		[a-zA-Z]

IDENT			{LETTER}({LETTER}|{DIGIT})* 
INTCONST		{DIGIT}+

%%

"quit"	{
		printTokenInfo("QUIT", yytext);
		return T_QUIT;
		}
"+"		{
		printTokenInfo("ADD", yytext);
		return T_ADD;
		}
"-"		{
		printTokenInfo("SUB", yytext);
		return T_SUB;
		}
"*"		{
		printTokenInfo("MULT", yytext);
		return T_MULT;
		}
"\\"		{
		printTokenInfo("DIV", yytext);
		return T_DIV;
		}
{INTCONST}	{
		printTokenInfo("INTCONST", yytext);
		return T_INTCONST;
		}
{IDENT}	{
		printTokenInfo("IDENT", yytext);
		return T_IDENT;
		}
{NEWLINE}	{
		numLines++;
		}
{WSPACE}	{ }
.		{
		printTokenInfo("UNKNOWN", yytext);
		return T_UNKNOWN;
		}

%%

// User-written code goes here

void printTokenInfo(const char* tokenType, const char* lexeme) 
{
  printf("TOKEN: %-20s LEXEME: %s\n", tokenType, lexeme);
}

// You should supply a yywrap function.
// Having it return 1 means only 1 input file will be scanned.
int yywrap(void) { return 1; }

int main(void) 
{
  while ( yylex() ) ;  // Process tokens until 0 returned

  printf("Processed %d lines\n", numLines);
  return 0;
}



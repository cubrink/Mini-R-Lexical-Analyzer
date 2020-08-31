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

// Identifier
#define T_IDENT     	1

// Keywords
#define T_INTCONST  	2
#define T_FLOATCONST	3
#define T_STRCONST		4
#define T_IF			5
#define T_ELSE			6
#define T_WHILE			7
#define T_FUNCTION		8
#define T_FOR			9
#define T_IN			10
#define T_TRUE			11
#define T_FALSE			12
#define T_PRINT			13
#define T_CAT			14
#define T_READ			15
#define T_LIST			16

// Operators
#define T_ADD	  		17
#define T_SUB	  		18
#define T_MULT	  		19
#define T_DIV	  		20
#define T_MOD			21
#define T_LT			22
#define T_GT			23
#define T_LE			24
#define T_GE			25
#define T_NE			26
#define T_NOT			27
#define T_AND			28
#define T_OR			29
#define T_ASSIGN		30

// Other symbols
#define T_SEMICOLON		31
#define T_COMMA			32
#define T_LPAREN		33
#define T_RPAREN		34
#define T_LBRACKET		35
#define T_RBRACKET		36
#define T_LBRACE		37
#define T_RBRACE		38
#define T_COMMENT		39
#define T_QUIT      	40


// Unknown
#define T_UNKNOWN   	99




int numLines = 0;

void printTokenInfo(const char* tokenType, 
                    const char* lexeme);

%}

/* Named defintions of regular expressions go here */

WSPACE					[ \t\v\r]+
NEWLINE					\n

DIGIT					[0-9]
LETTER					[a-zA-Z]

IDENT					{LETTER}({LETTER}|{DIGIT})* 
INTCONST  				[+-]?{DIGIT}+
FLOATCONST				[+-]?{DIGIT}*\.{DIGIT}+




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
{FLOATCONST} {
		printTokenInfo("FLOATCONST", yytext);
		return T_FLOATCONST;
		}
{IDENT}	{
		printTokenInfo("IDENT", yytext);
		return T_IDENT;
		}
{NEWLINE}	{
		numLines++;
		}
{WSPACE}	{ 
		}
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


// Keywords
// FLOATCONST
// STRCONST	
// IF		
// ELSE		
// WHILE		
// FUNCTION	
// FOR		
// IN		
// TRUE		
// FALSE		
// PRINT		
// CAT		
// READ		
// LIST		

// // Operators
// ADD	  	
// SUB	  	
// MULT	  	
// DIV	  	
// MOD		
// LT		
// GT		
// LE		
// GE		
// NE		
// NOT		
// AND		
// OR		
// ASSIGN	

// // Other symbols
// SEMICOLON	
// COMMA		
// LPAREN	
// RPAREN	
// LBRACKET	
// RBRACKET	
// LBRACE	
// RBRACE	
// COMMENT	
// QUIT      

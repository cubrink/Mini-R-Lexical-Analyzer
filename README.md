# Mini-R-Lexical-Analyzer


##### HW1 for CS3500 - Programming Languages and Translators

This lexical analyzer works for a specified subset of the `R` languages, hence `Mini-R`.

The following tokens are recognized:

| Token         | Description       |
|---------------|-------------------|
| `IDENT`	    | Identifier        |
| `INTCONST`	| Int constant      |
| `FLOATCONST`	| Float constant    |
| `STRCONST`	| String constant   |
| `IF`	        | `if` keyword      |
| `ELSE`	    |`else` keyword     |
| `WHILE`	    |`while` keyword    |
| `FUNCTION`	|`function` keyword |
| `FOR`	        |`for` keyword      |
| `IN`	        |`in` keyword       |
| `TRUE`	    |`TRUE` keyword     |
| `FALSE`	    |`FALSE` keyword    |
| `PRINT`	    |`print` keyword    |
| `CAT`	        |`cat` keyword      |
| `READ`	    |`read` keyword     |
| `LIST`	    |`list` keyword     |
| `ADD`	        |`+` operator       |
| `SUB`	        |`-` operator       |
| `MULT`	    |`*` operator       |
| `DIV`	        | `/` operator      |
| `MOD`	        | `%%` operator     |
| `POWER`	    |`^` operator       |
| `LT`	        |`<` operator       |
| `GT`	        |`>` operator       |
| `LE`	        |`<=` operator      |
| `GE`	        |`>=` operator      |
| `NE`	        |`!=` operator      |
| `NOT`	        |`!` operator       |
| `AND`	        |`&` operator       |
| `OR`	        |`|` operator       |
| `EQ`	        |`==` operator      |
| `ASSIGN`	    |`=` operator       |
| `SEMICOLON`	|`;` symbol         |
| `COMMA`	    |`,` symbol         |
| `LPAREN`	    |`(` symbol         |
| `RPAREN`	    |`)` symbol         |
| `LBRACKET`	|`[` symbol         |
| `RBRACKET`	|`]` symbol         |
| `LBRACE`	    |`{` symbol         |
| `RBRACE`	    |`}` symbol         |
| `COMMENT`	    | Commented line (not shown in output of lexical analyzer)|
| `QUIT`	    |`quit` keyword     |
| `UNKNOWN`	    | Unknown token     |

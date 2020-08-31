#!/bin/bash

flex minir.l
g++ lex.yy.c -o lexer

echo "Done."
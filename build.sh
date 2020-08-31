#!/bin/bash

flex minir.l
g++ lex.yy.c -o lexer

./lexer < hw1_input.txt > out.txt

md5sum hw1_input.txt.out out.txt > md5.txt

echo "Done."
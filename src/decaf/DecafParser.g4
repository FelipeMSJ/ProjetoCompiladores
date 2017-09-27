parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASSE Program LCURLY field_decl* method_decl* RCURLY;

field_decl: {type id | type id '|' decimal_literal '|'}+,';';

method_decl: {type | LIMBO} id LPAREN [{type id}+,] RPAREN block;

block:

var_decl:

type: INTEIRO | BOOL;

statement:

assing_op:

method_call:

method_name:

location:

expr:

callout_arg:

bin_op:

arith_op:

rel_op:

eq_op:

cond_op:

literal:

id: ID;

digit: 0|1|2|3|4|5|6|7|8|9;

decimal_literal: DECIMAL;

int_literal: decimal_literal | hex_digit;

hex_literal: HEX;

bool_literal: FALSO|VERIDICO;

char_literal: CHAR;

string_literal: STRING;

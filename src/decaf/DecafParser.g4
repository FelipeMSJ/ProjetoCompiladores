parser grammar DecafParser;

@header {
package decaf;

}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASSE PROGRAMA LCURLY field_decl* method_decl* RCURLY;

field_decl: type ID (VIRGULA param)* PVIRGULA
	| type ID LCOLCH int_literal RCOLCH (VIRGULA param LCOLCH int_literal RCOLCH)* PVIRGULA;

method_decl: (type | LIMBO) ID LPAREN (param (VIRGULA param)*)? RPAREN block;

param: type ID;

block: LCURLY var_decl* statement* RCURLY;

var_decl: param (VIRGULA ID)* PVIRGULA;

type: INTEIRO | BOOL;

statement: location assing_op expr PVIRGULA 
	| method_call PVIRGULA 
	| SE (expr) block (SENAO block)?
	| PARA ( ID IGUAL expr (VIRGULA expr)? (PVIRGULA expr PVIRGULA)? block)
	| RETORNE (expr)? PVIRGULA
	| QUEBRAR PVIRGULA
	| CONT PVIRGULA
	| QUEBRAR;

assing_op: (ASSING_OP|IGUAL);

method_call: method_name LPAREN (expr (VIRGULA expr)*)? RPAREN
	| CHAMARFORA LPAREN (string_literal (VIRGULA callout_arg (VIRGULA callout_arg)*)?) RPAREN;

method_name: ID;

location: ID 
	| ID LCOLCH expr RCOLCH;

expr: location
	|method_call
	|literal
	|expr (bin_op|MENOS) expr
	|MENOS expr
	|EXCLA expr
	|LPAREN expr RPAREN;

callout_arg: expr
	|string_literal;

bin_op: OP;

arith_op: AR_OP;

rel_op: REL_OP;

eq_op: EQ_OP;

cond_op: COND_OP;

literal: int_literal | char_literal | bool_literal;

decimal_literal: DECIMAL;

hex_digit: HEXD;

int_literal: INT_LITERAL;

hex_literal: HEX;

bool_literal: FALSO|VERIDICO;

char_literal: CHARLITERAL;

string_literal: STRING;

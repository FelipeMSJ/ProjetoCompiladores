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

field_decl: {type id(VIRGULA type id)* 
	| type id LCOLCH int_literal RCOLCH (VIRGULA type id LCOLCH int_literal RCOLCH)* }PVIRGULA;

method_decl: {type | LIMBO} id LPAREN RPAREN block;

block: LCURLY var_decl* statement* RCURLY;

var_decl: type id(VIRGULA id)* PVIRGULA;

type: INTEIRO | BOOL;

statement: location assing_op expr PVIRGULA 
	| method_call PVIRGULA 
	| SE (expr) block [SENAO block]
	//| PARA ( id = expr PVIRGULA expr PVIRGULA block)
	| RETORNE expr PVIRGULA
	| QUEBRAR PVIRGULA
	| CONT PVIRGULA
	| block;

assing_op: ASSING_OP;

method_call: method_name (expr (VIRGULA expr)*)
	| CHAMARFORA (string_literal [, callout_arg (VIRGULA callout_arg)*]);

method_name: id;

location: id 
	| id LCOLCH expr RCOLCH;

expr: location
	|method_call
	|literal
	|expr bin_op expr
	|MENOS expr
	|EXCLA expr
	|(expr);

callout_arg: expr
	|string_literal;

bin_op: OP;

arith_op: AR_OP;

rel_op: REL_OP;

eq_op: EQ_OP;

cond_op: COND_OP;

literal: int_literal | char_literal | bool_literal;

id: ID;

decimal_literal: DECIMAL;

hex_digit: HEXD;

int_literal: decimal_literal | hex_digit;

hex_literal: HEX;

bool_literal: FALSO|VERIDICO;

char_literal: CHARLITERAL;

string_literal: STRING;

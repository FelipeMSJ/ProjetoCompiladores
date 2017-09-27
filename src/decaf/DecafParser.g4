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

field_decl: {type id | type id LCOLCH int_literal RCOLCH }+,';';

method_decl: {type | LIMBO} id LPAREN [{type id}+,] RPAREN block;

block: LCURLY var_decl* statement* RCURLY;

var_decl: type id+, ';';

type: INTEIRO | BOOL;

statement: location assing_op expr ';' 
	| method_call ';' 
	| SE (expr) block [SENAO block]
	| PARA (id = expr ';' expr ';' block)
	| RETORNE [expr] ';'
	| QUEBRAR ';'
	| CONT ';'
	| block;

assing_op: '=' | '+=' | '-=';

method_call: method_name ([expr+,])
	| CHAMARFORA (string_literal [, callout_arg+,]);

method_name: id;

location: id 
	| id LCOLCH expr RCOLCH;

expr: location
	|method_call
	|literal
	|expr bin_op expr
	|'-'expr
	|'!'expr
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

int_literal: decimal_literal | hex_digit;

hex_literal: HEX;

bool_literal: FALSO|VERIDICO;

char_literal: CHAR;

string_literal: STRING;

lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';

SE: 'if';

ID: ('_' | LETTER)('_' |  LETTER | NUMBER)* ;  

LETTER: ('a'..'z' | 'A'..'Z'); 

HEX : '0x'(NUMBER | 'a'..'f' | 'A'..'F')+ ;

DECIMAL: NUMBER+;

NUMBER: ('0'..'9');

OP: ('+'|'-'|'*'|'<'|'>'|'<='|'>='|'!='|'&&');

ESPEC: ('!'|'@'|'#'|'$'|'%'|'^'|'&'|'*'|'('|')'|'_'|'='|'{'|'}'|'.');

WS_ : (' '|'\n'|'\t')+ -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHARLITERAL: '\'' ( ESC | CHAR ) '\'' ;

STRING: '"' ( CHAR | ESC )* '"' ;

CHAR: ']'..'~' | '#'..'&' | '('..'[' | ' ' | '!' ;

fragment ESC: '\\' ( 'r' | 'n' | 't' | '\'' | '"' | '\\' ) ;

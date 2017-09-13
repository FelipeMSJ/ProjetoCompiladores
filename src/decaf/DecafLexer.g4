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
SENAO: 'else';
BOOL: 'boolean';
QUEBRAR: 'break';
CHAMARFORA: 'callout';
CLASSE: 'class';
CONT: 'continue';
FALSO: 'false';
PARA: 'for';
INTEIRO: 'int';
RETORNE: 'return';
VERIDICO: 'true';
LIMBO: 'void';

PR: (SE|SENAO|BOOL|QUEBRAR|CHAMARFORA|CLASSE|CONT|FALSO|PARA|INTEIRO|RETORNE|VERIDICO|LIMBO);

ID: ('_' | LETTER )('_' |  LETTER | NUMBER)*;  

LETTER: ('a'..'z' | 'A'..'Z'); 

HEX : '0x'(NUMBER | 'a'..'f' | 'A'..'F')+ ;

DECIMAL: NUMBER+;

NUMBER: ('0'..'9');

OP: ('+'|'-'|'*'|'<'|'>'|'<='|'>='|'!='|'&&'|'=='|'||');

ESPEC: ('!'|'@'|'#'|'$'|'%'|'^'|'&'|'*'|'('|')'|'_'|'='|'{'|'}'|'.');

WS_ : (' '|'\n'|'\t')+ -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHARLITERAL: '\'' ( ESC | CHAR ) '\'' ;

STRING: '"' ( CHAR | ESC )* '"' ;

CHAR: ']'..'~' | '#'..'&' | '('..'[' | ' ' | '!' ;

fragment ESC: '\\' ( 'r' | 'n' | 't' | '\'' | '"' | '\\' ) ;

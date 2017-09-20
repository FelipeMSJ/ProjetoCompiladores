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

HEX : '0x' HEXCHARS+ ;

DECIMAL: NUMBER+;

OP: ('+'|'-'|'*'|'<'|'>'|'<='|'>='|'!='|'&&'|'=='|'||');

CHARLITERAL: '\'' ( ESC | CHAR ) '\'' ;

STRING: '"' ( CHAR | ESC )* '"' ;

ID: ('_'|LETTER)('_'|LETTER|NUMBER)+; 

WS_ : (' '|'\n'|'\t'|'\r')+ -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

//ESPEC: ('!'|'@'|'#'|'$'|'%'|'^'|'&'|'*'|'('|')'|'_'|'='|'{'|'}'|'.');

fragment LETTER: [a-zA-Z];

fragment CHAR: ']'..'~' | '#'..'&' | '('..'[' | ' ' | '!' ;

fragment HEXCHARS: [0-9a-fA-F];

fragment NUMBER: [0-9];

fragment ESC: '\\' ( 'r' | 'n' | 't' | '\'' | '"' | '\\' ) ;

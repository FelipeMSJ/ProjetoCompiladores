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

OP: ('+'|'-'|'*'|'<'|'>'|'<='|'>='|'!='|'&&'|'=='|'||');

LCURLY : '{';
RCURLY : '}';

LPAREN : '(';
RPAREN : ')';

LCOLCH : '[';
RCOLCH : ']';

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

HEX : '0x'[0-9a-fA-F]+ ;

DECIMAL: NUMBER+;

CHARLITERAL: '\'' ( CHAR | ESC | ESPEC) '\'' ;

STRING: '"' ( CHAR | ESC | ESPEC)* '"' ; 

ID: ('_'|LETTER)(NUMBER|LETTER|'_')*;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

WS_ : (' '|'\n'|'\t'|'\r')+ -> skip;

ESPEC: ('!'|'@'|'#'|'$'|'%'|'^'|'&'|'*'|'_'|'='|'.'|';'|',');

fragment LETTER: [a-zA-Z];

fragment CHAR: ']'..'~' | '#'..'&' | '('..'[' | ' ' | '!' ;

fragment NUMBER: [0-9];

fragment ESC: '\\' ( 'r' | 'n' | 't' | '\'' | '"' | '\\' ) ;

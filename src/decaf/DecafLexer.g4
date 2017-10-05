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

OP: (AR_OP|REL_OP|EQ_OP|COND_OP);
AR_OP: ('+'|'*'|'/'|'%');
REL_OP: ('<'|'>'|'<='|'>=');
EQ_OP: ('==' | '!=');
COND_OP: ('&&' |'||');
ASSING_OP: ('+=' | '-=');

LCURLY : '{';
RCURLY : '}';

LPAREN : '(';
RPAREN : ')';

LCOLCH : '[';
RCOLCH : ']';

PVIRGULA: ';';
VIRGULA: ',';

EXCLA: '!';
MENOS: '-';
IGUAL: '=';

PROGRAMA: 'Program';
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

HEXD: NUMBER [0-9a-fA-F];

DECIMAL: NUMBER+;

NUMBER: [0-9];

CHARLITERAL: '\'' ( CHAR | ESC | ESPEC) '\'' ;

STRING: '"' ( CHAR | ESC | ESPEC)* '"' ; 

ID: ('_'|LETTER)(NUMBER|LETTER|'_')*;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

WS_ : (' '|'\n'|'\t'|'\r')+ -> skip;

ESPEC: ('!'|'@'|'#'|'$'|'%'|'^'|'&'|'*'|'_'|'='|'.');

fragment LETTER: [a-zA-Z];

fragment CHAR: ']'..'~' | '#'..'&' | '('..'[' | ' ' | '!' ;

fragment ESC: '\\' ( 'r' | 'n' | 't' | '\'' | '"' | '\\' ) ;

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

ID : ('a'..'z' | 'A'..'Z');

HEX : '0x'('0'..'9'|'a'..'f'|'A'..'F')+; 
  
NUMBER : ('-')? ('0'..'9')+;

ESPEC: ('!'|'@'|'#'|'$'|'%'|'^'|'&'|'*'|'('|')'|'_'|'+'|'='|'{'|'}');

WS_ : (' '|'\n'|'\t')+ -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ID|NUMBER|ESPEC|ESC) '\'';
STRING : '\"' (ID|NUMBER|ESPEC|ESC)* '\"';

fragment
ESC :  '\\' ('n'|'"'|'t'|'\\');

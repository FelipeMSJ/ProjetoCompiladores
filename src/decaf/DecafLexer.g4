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

ID  :
  ('a'..'z' | 'A'..'Z')+;
  
NUMBER : ('0'..'9')+;

WS_ : (' ' | '\n' | '	' | '\t' )+ -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|~'\'') '\'';
STRING : '"' (ESC|~'"')* '"';

fragment
ESC :  '\\' ('n'|'"');

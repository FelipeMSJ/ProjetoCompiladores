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

ID : [_a-zA-Z][_0-9a-zA-Z]?;
IDS : (ID)+;

HEX : '0x'('0'..'9'|'a'..'f'|'A'..'F')+; 
  
NUMBER :[0-9]+;

OP: ('+'|'-'|'*'|'<'|'>'|'<='|'>='|'!='|'&&');

ESPEC: ('!'|'@'|'#'|'$'|'%'|'^'|'&'|'*'|'('|')'|'_'|'='|'{'|'}'|'.');

WS_ : (' '|'\n'|'\t')+ -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' ALL '\'';
STRING : '"' ALLS* '"';

fragment ESC :  '\\' ('n'|'"'|'t'|'\\');
fragment ALL : (ID|NUMBER|ESPEC|ESC|OP);
//fragment ALLS : (IDS|NUMBER|ESPEC|ESC|OP);

SE: 'if';

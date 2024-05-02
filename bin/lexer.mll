{
	open Parser
} 

rule token = parse 
	[' ' '\t' '\r'] { token lexbuf }
  | '\n'            { Lexing.new_line lexbuf; token lexbuf }
  | ['0'-'9']+      { INT (int_of_string(Lexing.lexeme lexbuf))}
  | [+-]?([0-9]*[.])?[0-9]+    { FLOAT (float_of_string (Lexing.lexeme lexbuf)) }
  | "molecule"      { MOLECULE }
  | "peptide"        { PEPTIDE }
  | "solvent"       { SOLVENT }
  | "solution"      { SOLUTION }
  | "in"            { IN }
  | "combine"       { COMBINE }
  | "and"           { AND }
  | "with"          { WITH }
  | "agitate"       { AGITATE }
  | "move"          { MOVE }
  | "set"           { SET }
  | "temp"          { TEMP }
  | "protocol"      { PROTOCOL }
  | "produces"      { PRODUCES }
  | "for"           { FOR }
  | "mM"            { MM }
  | "hours"         { HOURS }
  | "minutes"         { MINUTES }
  | ';' 		    { SEMICOLON }
  | '='             { EQUAL }
  | "<"             { LT }
  | ">"             { GT }
  | '('             { LPAREN }
  | ')'             { RPAREN }   
  | ','             { COMMA  }
  | '_'             {UNDERSCORE}
  | '{'             {LBRACE}
  | '}'             {RBRACE}
  | ['A'-'Z']['a'-'z']* { ID (Lexing.lexeme lexbuf) }
  | ['A'-'Z']+      { PEPID (Lexing.lexeme lexbuf) }
  | eof             { EOF }
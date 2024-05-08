{
	open Parser
} 




rule token = parse 
	| [' ' '\t' '\r'] { token lexbuf }
  | '\n'            { Lexing.new_line lexbuf; token lexbuf }
  | "peptide"       { PEPTIDE }
  | "molecule"      { MOLECULE }
  | "solvent"       { SOLVENT }
  | "("             { LPAREN }
  | ")"             { RPAREN }
  | ';' 		        { SEMICOLON }
  | '='             { EQUAL }
  | "<"             { LT }
  | ">"             { GT }
  | ['A'- 'Z' 'a'-'z']*      { ID (Lexing.lexeme lexbuf) }
  | ['A'- 'Z']*     { PEPID (Lexing.lexeme lexbuf) }
  | ['A'-'Z' '0'-'9']+  { MOLID (Lexing.lexeme lexbuf) }
  | eof             { EOF }
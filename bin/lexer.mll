{
	open Parser
} 

rule token = parse 
	[' ' '\t' '\r'] { token lexbuf }
  | '\n'            { Lexing.new_line lexbuf; token lexbuf }
  | "peptide"        { PEPTIDE }
  | "molecule"       { MOLECULE }
  | "("             { LPAREN }
  | ")"             { RPAREN }
  | ';' 		    { SEMICOLON }
  | '='             { EQUAL }
  | "<"             { LT }
  | ">"             { GT }
  | ['a'-'z']* { ID (Lexing.lexeme lexbuf) }
  | ['A'-'Z']+      { PEPID (Lexing.lexeme lexbuf) }
  | eof             { EOF }
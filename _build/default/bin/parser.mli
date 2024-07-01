
(* The type of tokens. *)

type token = 
  | SOLVENT
  | SOLUTION
  | SEMICOLON
  | RPAREN
  | RBRACE
  | RBRAC
  | PROTOCOL
  | PRINT
  | PEPTIDE
  | PEPID of (string)
  | NUMERAL of (int)
  | MOLID of (string)
  | MOLECULE
  | MM
  | MINUTES
  | LT
  | LPAREN
  | LOCATION
  | LBRACE
  | LBRAC
  | IN
  | ID of (string)
  | HOURS
  | GT
  | GENERATE_SMILES
  | FOR
  | FLOAT of (float)
  | FIND
  | EQUAL
  | EOF
  | DISPENSE
  | COMBINE
  | CALL
  | CALCULATE_AVERAGE_MASS
  | AT
  | AND
  | AGITATE

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val toplevel: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Types.expression)

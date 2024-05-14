
(* The type of tokens. *)

type token = 
  | SOLVENT
  | SOLUTION
  | SEMICOLON
  | RPAREN
  | RBRACE
  | PROTOCOL
  | PEPTIDE
  | PEPID of (string)
  | NUMERAL of (int)
  | MOLID of (string)
  | MOLECULE
  | MM
  | LT
  | LPAREN
  | LBRACE
  | IN
  | ID of (string)
  | GT
  | GENERATE_SMILES
  | FLOAT of (float)
  | EQUAL
  | EOF
  | CALCULATE_AVERAGE_MASS

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val toplevel: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Syntax.expression)

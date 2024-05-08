
(* The type of tokens. *)

type token = 
  | SOLVENT
  | SEMICOLON
  | RPAREN
  | PEPTIDE
  | PEPID of (string)
  | MOLID of (string)
  | MOLECULE
  | LT
  | LPAREN
  | ID of (string)
  | GT
  | EQUAL
  | EOF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val toplevel: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Syntax.expression)

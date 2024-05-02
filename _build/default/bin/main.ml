open Syntax
open Parser
open Lexer

let () =
  let lexbuf = Lexing.from_channel stdin in
  let e = Parser.toplevel Lexer.token lexbuf in 
  print_expr e 

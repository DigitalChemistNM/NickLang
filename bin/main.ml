open Syntax

let () =
  let lexbuf = Lexing.from_channel stdin in
  let e = Parser.toplevel Lexer.token lexbuf in 
  eval_expr e  

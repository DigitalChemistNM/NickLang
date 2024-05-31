open Syntax
open Functions
open Types

let print_env (env : env) : unit =
  (* Print peptides *)
  print_endline "Peptides:";
  PepMap.iter (fun key value ->
    print_string key;
    print_string " : ";
    print_string (String.concat "" (List.map (fun x -> String.make 1 x.one_letter_code) value.sequence));
    print_newline();
  ) env.peptides;

  (* Print solvents *)
  print_endline "Solvents:";
  SolventMap.iter (fun key value ->
    print_string key;
     print_string " : ";
     print_string value.name;
    print_newline();
  ) env.solvents;

  (* Print solutions *)
  print_endline "Solutions:";
  SolutionMap.iter (fun key value ->
    print_string key;
    print_string " : ";
    print_string " ";
    print_string (string_of_float value.concentration);
    print_string " ";
    print_string (String.concat "" (List.map (fun x -> String.make 1 x.one_letter_code) value.solute.sequence));
    print_string " in ";
    print_string value.solvent.name;
    print_newline();
  ) env.solutions

  (*Print protocls*)
  (**print_endline "Protocols:";
  ProtocolMap.iter (fun key value ->
    print_string key;
    print_string " : ";
    print_string value.name;
    print_newline();
     )  env.protocols*)

let () =
  let initial_env = {
    peptides = PepMap.empty;
    solvents = SolventMap.empty;
    solutions = SolutionMap.empty;
    protocols = ProtocolMap.empty
  } in

  let lexbuf = Lexing.from_channel stdin in
  let e = Parser.toplevel Lexer.token lexbuf in
  let updated_env =  eval_expr e initial_env in
  print_env updated_env

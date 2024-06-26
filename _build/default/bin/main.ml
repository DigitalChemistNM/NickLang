open Syntax
open Types
open Functions


let () =
  let initial_env = {
    peptides = PepMap.empty;
    solvents = SolventMap.empty;
    solutions = SolutionMap.empty;
    protocols = ProtocolMap.empty;
    molecules = MoleculeMap.empty;
    mol_solutions = MolsolutionMap.empty;
  } in

  let lexbuf = Lexing.from_channel stdin in
  let e = Parser.toplevel Lexer.token lexbuf in
  let updated_env =  eval_expr e initial_env in
  print_env updated_env

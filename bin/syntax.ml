open Types
open Functions



let rec eval_expr (e : expression)(env : env): env =
  match e with
  | Sequence (e1, e2) -> let env' = eval_expr e1 env in eval_expr e2 env'
  | Addpeptide (s, t) -> {env with solutes = add_peptide s t env.solutes}
  | Molecule (_s, _t) -> {env with solutes = add_molecule _s _t env.solutes}
  | Solvent (s)  -> {env with solvents = add_solvent s env.solvents}
  (*| Solution (a, b, c, d) ->{env with solutions = add_solution a b c d env.peptides env.solvents  env.solutions}*)
  (* | CalculateAverageMass (s) -> let x = calculate_mass s in print_float x; print_newline()*)
  (*| GenerateSmiles (s) -> let x = generate_smiles s in print_string x; print_newline()*)
  | Protocol (s, a, e) -> {env with protocols = add_protocol(create_protocol s a e) env.protocols  }
  | Call(s, args) ->  (let env' = bind_args env s args in
    let p = retrieve_protocol s env.protocols in
    let _  =  eval_expr p.expressions env' in env)
  (*| Dispense (v) -> print_string "Dispense "; print_string v; print_newline()
    | FindLocation(v) -> print_string "FindLocation "; print_string v; print_newline()*)
  (*| Agitate (v, i) -> print_string "Agitate "; print_string v; print_string " "; print_int i; print_newline()
  | Print -> print_maps()*)
  | _ -> env

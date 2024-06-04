open Types
open Functions



let rec eval_expr (e : expression)(env : env): env =
  match e with
  | Sequence (e1, e2) -> let env' = eval_expr e1 env in eval_expr e2 env'
  | Peptide (s, t) -> {env with peptides = add_peptide s t env.peptides}
  (*| Molecule (s, t) -> print_string s; print_string " "; print_string t; print_newline()*)
  | Solvent (s)  -> {env with solvents = add_solvent s env.solvents}
  | Solution (a, b, c, d) ->{env with solutions = add_solution a b c d env.peptides env.solvents  env.solutions}
  (* | CalculateAverageMass (s) -> let x = calculate_mass s in print_float x; print_newline()*)
  (*| GenerateSmiles (s) -> let x = generate_smiles s in print_string x; print_newline()*)
  | Protocol (s, a, e) -> {env with protocols = add_protocol(create_protocol s a e) env.protocols  }
  | Call(s) -> let env' = eval_expr(retrieve__protocol s env.protocols).expressions env in
      eval_expr(retrieve__protocol s env.protocols).expressions env'
  | Location(a) -> {env with locations = add_location a env.locations}
  (*| Contains(a,b) -> {env with locations =
                                 add_solution_to_location b a env.locations env.solutions }
  | Dispense (v) -> print_string "Dispense "; print_string v; print_newline()
  | FindLocation(v) -> print_string "FindLocation "; print_string v; print_newline() 
  | Combine (v1, v2, v3) -> print_string "Combine "; print_string v1; print_string " "; print_string v2; print_string " "; print_string v3; print_newline()
  | Agitate (v, i) -> print_string "Agitate "; print_string v; print_string " "; print_int i; print_newline()
  | Print -> print_maps()*)
  | _ -> env

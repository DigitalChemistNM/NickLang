open Types
open Functions

(*let rec create_solute_list sollist =
  match sollist with
  | EmptySollist -> []
  | Sollist (s, t, rest) ->
    match s with
    | Peptide (s) -> (find_solute_by_name s, t)::(create_solute_list rest)
    | Molecule (s) ->((find_solute_by_name s), t)::(create_solute_list rest)*)

let rec create_solute_list sollist solute_map =
  match sollist with
  | EmptySollist -> []
  | Sollist (s, t, rest) ->
    let solute = find_solute_by_name s solute_map in
    (solute, t) :: (create_solute_list rest solute_map)

let rec create_solvent_list solvnlist map =
  match solvnlist with
  | EmptySolvnlist -> []
  | Solvnlist (s, rest) -> (find_solvent_by_name s map )::(create_solvent_list rest map)



let rec eval_expr (e : expression)(env : env): env =
  match e with
  | Sequence (e1, e2) -> let env' = eval_expr e1 env in eval_expr e2 env'
  | Addpeptide (s, t) -> {env with solutes = add_peptide s t env.solutes}
  | Addmolecule (s, t) -> {env with solutes = add_molecule s t env.solutes}
  | Solvent (s)  -> {env with solvents = add_solvent s env.solvents}
  | Solution (var, args1, args2) -> (let solute_list = create_solute_list args1 env.solutes in
   let solvent_list = create_solvent_list args2 env.solvents in
    {env with solutions = add_solution var solute_list solvent_list env.solutions})
  | Combine (s1, s2, s3) -> {env with solutions = combine_solutions s1 s2 s3 env.solutions}
  | Agitate (s) -> {env with solutions = agitate_solution s env.solutions}
  (* | CalculateAverageMass (s) -> let x = calculate_mass s in print_float x; print_newline()*)
  (*| GenerateSmiles (s) -> let x = generate_smiles s in print_string x; print_newline()*)
  | Protocol (s, a, e) -> {env with protocols = add_protocol(create_protocol s a e) env.protocols  }
  | Call(s, args) ->  (let env' = bind_args env s args in
    let p = retrieve_protocol s env.protocols in
    let _  =  eval_expr p.expressions env' in
    let _ =print_endline ("Temporary environment: "); print_env env in
         env)
  (*| Dispense (v) -> print_string "Dispense "; print_string v; print_newline()
    | FindLocation(v) -> print_string "FindLocation "; print_string v; print_newline()*)
  (*| Agitate (v, i) -> print_string "Agitate "; print_string v; print_string " "; print_int i; print_newline()
  | Print -> print_maps()*)
  | _ -> env

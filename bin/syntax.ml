open Functions
open Types

type arglist = 
 | EmptyArglist
 | Arglist of string * arglist

type expression =
  | Sequence of expression * expression
  | Peptide of string * string
  | Molecule of string * string
  | Solvent of string
  | Solution of string * string * float * string
  | CalculateAverageMass of string
  | GenerateSmiles of string
  | Protocol of string * arglist * expression
  | Dispense of string
  | FindLocation of string
  | Combine of string * string * string
  | Agitate of string * int
  | Print

type env = {

  peptides : peptide PepMap.t;
  solvents : solvent SolventMap.t;
  solutions : solution SolutionMap.t

}

let rec print_arglist a =
    match a with
    | EmptyArglist -> ()
    | Arglist (s, a) -> print_string s; print_string " "; print_arglist a

let rec eval_expr (e : expression)(env : env): env =
  match e with
  | Sequence (e1, e2) -> let env' = eval_expr e1 env in eval_expr e2 env'
  | Peptide (s, t) -> {env with peptides = add_peptide s t env.peptides}
  (*| Molecule (s, t) -> print_string s; print_string " "; print_string t; print_newline()*)
  | Solvent (s)  -> {env with solvents = add_solvent s env.solvents}
  | Solution (a, b, c, d) ->{env with solutions = add_solution a b c d  env.solutions}
  (* | CalculateAverageMass (s) -> let x = calculate_mass s in print_float x; print_newline()*)
  (*| GenerateSmiles (s) -> let x = generate_smiles s in print_string x; print_newline()*)
 (* | Protocol (s, a, e) -> print_string s; print_string " ";  print_arglist a ; eval_expr e
  | Dispense (v) -> print_string "Dispense "; print_string v; print_newline()
  | FindLocation(v) -> print_string "FindLocation "; print_string v; print_newline() 
  | Combine (v1, v2, v3) -> print_string "Combine "; print_string v1; print_string " "; print_string v2; print_string " "; print_string v3; print_newline()
  | Agitate (v, i) -> print_string "Agitate "; print_string v; print_string " "; print_int i; print_newline()
  | Print -> print_maps()*)
  | _ -> env

open Aminoacids 

type arglist = 
 | Nil
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

  let rec print_arglist a = 
    match a with
    | Nil -> ()
    | Arglist (s, a) -> print_string s; print_string " "; print_arglist a

let rec eval_expr e = 
  match e with
  | Sequence (e1, e2) -> eval_expr e1; eval_expr e2
  | Peptide (s, t) -> print_string s; print_string " "; print_string t; print_newline()
  | Molecule (s, t) -> print_string s; print_string " "; print_string t; print_newline()
  | Solvent (s)  -> print_string s; print_newline()
  | Solution (s, t, f, l) -> print_string s; print_string " "; print_string t; print_string " "; print_float f; print_string " "; print_string l; print_newline()
  | CalculateAverageMass (s) -> let x = calculate_mass s in print_float x; print_newline()
  | GenerateSmiles (s) -> let x = generate_smiles s in print_string x; print_newline()
  | Protocol (s, a, e) -> print_string s; print_string " ";  print_arglist a ; eval_expr e 


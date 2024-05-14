open Aminoacids 

type expression =
  | Sequence of expression * expression
  | Peptide of string * string
  | Molecule of string * string
  | Solvent of string
  | Solution of string * string * float * string
  | CalculateAverageMass of string
  | GenerateSmiles of string



let rec print_expr e = 
  match e with
  | Sequence (e1, e2) -> print_expr e1; print_expr e2
  | Peptide (s, t) -> print_string s; print_string " "; print_string t; print_newline()
  | Molecule (s, t) -> print_string s; print_string " "; print_string t; print_newline()
  | Solvent (s)  -> print_string s; print_newline()
  | Solution (s, t, f, l) -> print_string s; print_string " "; print_string t; print_string " "; print_float f; print_string " "; print_string l; print_newline()
  | CalculateAverageMass (s) -> print_string s; print_newline()
  | GenerateSmiles (s) -> print_string s; print_newline() 

let eval_expr e = 
  match e with
  | CalculateAverageMass (s) -> let x = calculate_mass s in print_float x; print_newline()
  | GenerateSmiles (s) -> let x = generate_smiles s in print_string x; print_newline()
    | _ -> print_expr e 
type expression =
  | Sequence of expression * expression
  | Peptide of string * string
  | Molecule of string * string
  | Solvent of string



let rec print_expr e = 
  match e with
  | Sequence (e1, e2) -> print_expr e1; print_expr e2
  | Peptide (s, t) -> print_string s; print_string " "; print_string t; print_newline()
  | Solvent (s)  -> print_string s; print_newline()
  | _ -> print_string ""

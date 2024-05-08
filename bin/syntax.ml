type expression =
  | Sequence of expression * expression
  | Peptide of string * string
  | Molecule of string * string
  | Solvent of string
  | Solution of string * string * float * string



let rec print_expr e = 
  match e with
  | Sequence (e1, e2) -> print_expr e1; print_expr e2
  | Peptide (s, t) -> print_string s; print_string " "; print_string t; print_newline()
  | Molecule (s, t) -> print_string s; print_string " "; print_string t; print_newline()
  | Solvent (s)  -> print_string s; print_newline()
  | Solution (s, t, f, l) -> print_string s; print_newline(); print_string t; print_newline(); print_float f; print_newline(); print_string l; print_newline()


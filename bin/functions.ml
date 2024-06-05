open Types
open Aminoacids 
open Solvents 

(*Neccesary to fetch an amino acid from a one letter code input from a sequence*)


let find_amino_acid_by_one_letter_code c = List.find (fun aa -> aa.one_letter_code = c)

(*Same as above but for three letter code, this functionality isn't utilised yet*)

let find_amino_acid_by_three_letter_code c amino_acid_list =
  let aa = List.find (fun aa -> aa.one_letter_code = c) amino_acid_list in
    aa.three_letter_code


(*Find the mass of a paricular amino acid by its one letter code, useful for calculating the mass of a peptide sequence*)


let find_average_mass_by_one_letter_code c amino_acid_list =
  let aa = List.find (fun aa -> aa.one_letter_code = c) amino_acid_list in
    aa.average_mass



(*Same as above but for the monoisotopic mass*)


let find_monoisotopic_mass_by_one_letter_code  c amino_acid_list =
  let aa = List.find (fun aa -> aa.one_letter_code = c) amino_acid_list in
    aa.monoisotopic_mass



(*Fetch the smiles string of an amino acid from one letter code*)


let find_smiles_by_one_letter_code c amino_acid_list =
  let aa = List.find (fun aa -> aa.one_letter_code = c) amino_acid_list in
    aa.smiles


let calculate_peptide_mass sequence =
  let total_mass = List.fold_left(fun acc aa ->
      acc  +. find_average_mass_by_one_letter_code aa.one_letter_code natural_amino_acids ) 0.0  sequence in
      total_mass +. 18.01528

(*same as above for monoisotopic*)

let calculate_peptide_monoisotopic_mass sequence =
  let total_mass = List.fold_left(fun acc aa ->
      acc  +. find_monoisotopic_mass_by_one_letter_code aa.one_letter_code natural_amino_acids ) 0.0  sequence in
      total_mass +. 18.0105


(*This function is neccesary for combing smiles strings of amino acids to form the smiles string of a peptide
  This is because there is a loss of water molecule in the condensations reaction of amino acids
  i.e the "O" is taken off the smiles string, hydrogens are ommitted in smiles representation*)
  let remove_last_char str = 
    let len = String.length str in 
    let new_str = String.sub str 0 (len - 1) in 
    new_str 
  

let generate_smiles sequence =
  let smiles = List.fold_left(fun acc aa -> acc  ^ remove_last_char(find_smiles_by_one_letter_code aa.one_letter_code natural_amino_acids)) ""  sequence in
  smiles ^ "O"

  
(*This function constructs a sequence, which is a list of amino_acids, from an string input of just the one letter code*)

let construct_sequence aa_sequence =
  String.fold_right (fun c acc ->
    let found_amino_acid = find_amino_acid_by_one_letter_code c natural_amino_acids in
    found_amino_acid :: acc) aa_sequence []



 (*Constructs a whole peptide type from a sequence, other properties are calculated from previously defined functions*)
  let construct_peptide aa_sequence =
    let sequence = construct_sequence aa_sequence in
    let average_mass = calculate_peptide_mass sequence in
    let monoisotopic_mass = calculate_peptide_monoisotopic_mass sequence in
    let smiles = generate_smiles sequence in
    {
      sequence;
      average_mass;
      monoisotopic_mass;
      smiles;
    }




(*This function adds user declared peptides to map*)
let add_peptide name sequence map  =
  let peptide = construct_peptide sequence in 
  let key = name in 
  PepMap.add key peptide map

  
let find_peptide_by_name name map =
  try 
    PepMap.find name map
  with 
   | Not_found -> raise Not_found



let find_solvent_from_list name  =
  try
  List.find (fun x -> x.solname = name) solvent_list
  with 
  | Not_found -> raise Not_found

let add_solvent name map =
  let key = name in
  let solvent = find_solvent_from_list name in
  SolventMap.add key solvent map

let find_solvent_by_name name map =
  try
    SolventMap.find name map
  with
  | Not_found -> raise Not_found




let add_solution name solute concentration solvent map1 map2 map3 =
  let solute = find_peptide_by_name solute map1 in
  let solvent = find_solvent_by_name solvent map2 in
  let concentration = concentration in
  let key = name in 
  let solution: solution ={
    solute;
    solvent;
    concentration;
  } in  
  SolutionMap.add key solution map3

let find_solution_by_name name map =
  try 
    SolutionMap.find name map
  with 
    | Not_found -> raise Not_found

let add_molecule name formula  map =
  let key = name in
  let molecule =
    {
      name;
      average_mass = 0.0;
      monoisotopic_mass = 0.0;
      formula;
      smiles = "";
    }
    in
  MoleculeMap.add key molecule map

let find_molecule_by_name name map =
  try
    MoleculeMap.find name map
  with
   | Not_found -> raise Not_found

let add_mol_solution name solute concentration solvent map1 map2 map3 =
  let solute = find_molecule_by_name solute map1 in
  let solvent = find_solvent_by_name solvent map2 in
  let concentration = concentration in
  let key = name in
  let mol_solution : mol_solution  = {
    solute;
    solvent;
    concentration;
  } in
  MolsolutionMap.add key (mol_solution : mol_solution) map3


let create_protocol name arglist expressions =
  let name = name in
  let arglist = arglist in
  let expressions = expressions in
  {
    name;
    arglist;
    expressions;
  }

let add_protocol protocol map =
  let key = protocol.name in
  ProtocolMap.add key protocol map

let retrieve_protocol name map =
  try
    ProtocolMap.find name map
  with
  | Not_found -> raise Not_found

let bind_arg env argname callname =
  let solution = find_solution_by_name callname env.solutions in
  let smap = SolutionMap.add argname solution env.solutions in
  {env with solutions = smap}

 let bind_args env pid pargs =
  let p = retrieve_protocol pid env.protocols in
  let bargs = List.fold_left2 (fun  acc a i -> bind_arg acc a i) env (arglist_to_lst  p.arglist) pargs in
  bargs


let print_env (env : env) : unit =
  (* Print peptides *)
  print_endline "Peptides:";
  PepMap.iter (fun key (value : peptide) ->
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
     print_string value.solname;
    print_newline();
  ) env.solvents;

  (* Print solutions *)
  print_endline "Solutions:";
  SolutionMap.iter (fun key (value : solution) ->
    print_string key;
    print_string " : ";
    print_string " ";
    print_string (string_of_float value.concentration);
    print_string " ";
    print_string (String.concat "" (List.map (fun x -> String.make 1 x.one_letter_code) value.solute.sequence));
    print_string " in ";
    print_string value.solvent.solname;
    print_newline();
  ) env.solutions;

  (*Print protocls*)
  print_endline "Protocols:";
  ProtocolMap.iter (fun key (value : protocol) ->
    print_string key;
    print_string " : ";
    print_string value.name;
    print_newline();
     )  env.protocols

open Types
open Aminoacids 
open Solvents 

let rec find_amino_acid_by_one_letter_code code amino_acid_list = 
  match amino_acid_list with 
  | [] -> raise Not_found
  | aa :: rest -> 
      if aa.one_letter_code = code then 
        aa
    else 
      find_amino_acid_by_one_letter_code code rest 

let rec find_amino_acid_by_three_letter_code code amino_acid_list = 
  match amino_acid_list with 
  | [] -> raise Not_found
  | aa :: rest -> 
      if aa.three_letter_code = code then 
        aa
      else 
        find_amino_acid_by_three_letter_code code rest
      

(*find the mass of a paricular amino acid by its one letter code*)
let rec find_average_mass_by_one_letter_code code amino_acid_list = 
  match amino_acid_list with 
  | [] -> raise Not_found
  | aa :: rest -> 
      if aa.one_letter_code = code then 
        aa.average_mass
      else 
        find_average_mass_by_one_letter_code code rest 

let rec find_monoisotopic_mass_by_one_letter_code code amino_acid_list = 
  match amino_acid_list with 
  | [] -> raise Not_found
  | aa :: rest -> 
      if aa.one_letter_code = code then 
        aa.monoisotopic_mass
      else 
        find_monoisotopic_mass_by_one_letter_code code rest

let rec find_smiles_by_one_letter_code code amino_acid_list = 
  match amino_acid_list with 
  | [] -> raise Not_found
  | aa :: rest -> 
      if aa.one_letter_code = code then 
        aa.smiles
      else 
        find_smiles_by_one_letter_code code rest

(*let iterate_through_string str = 
  let len = String.length str in 
  for i = 0 to len -1 do 
    let current_char = str.[i] in 
    print_char current_char;
    print_newline() 
  done*)


  let calculate_mass sequence = 
    let mass = ref 0.0 in
    let len = String.length sequence in 
    for i = 0 to len -1 do 
      let current_char = sequence.[i] in 
      let found_mass = find_average_mass_by_one_letter_code current_char natural_amino_acids in 
      mass := !mass +. found_mass;
    done;
    mass := !mass +. 18.01528;
    !mass 
  
  let calculate_monoisotopic_mass sequence = 
    let mass = ref 0.0 in
    let len = String.length sequence in 
    for i = 0 to len -1 do 
      let current_char = sequence.[i] in 
      let found_mass = find_monoisotopic_mass_by_one_letter_code current_char natural_amino_acids in 
      mass := !mass +. found_mass;
    done;
    mass := !mass +. 18.0105;
    !mass
  
  let remove_last_char str = 
    let len = String.length str in 
    let new_str = String.sub str 0 (len - 1) in 
    new_str 
  
  let generate_smiles sequence = 
    let smiles = ref "" in 
    let len = String.length sequence in 
    for i = 0 to len -1 do 
      let current_char = sequence.[i] in 
      let found_smiles = find_smiles_by_one_letter_code current_char natural_amino_acids in 
      smiles := !smiles ^ remove_last_char(found_smiles);
    done;
    smiles := !smiles ^ "O";
    !smiles 
  
  
    let construct_sequence sequence = 
      let len = String.length sequence in 
      let constructed_sequence = ref [] in 
      for i = 0 to len -1 do 
        let current_char = sequence.[i] in 
        let found_amino_acid = find_amino_acid_by_one_letter_code current_char natural_amino_acids in 
        constructed_sequence := found_amino_acid :: !constructed_sequence;
      done;
      !constructed_sequence 
  
  let construct_peptide sequence = 
    let amino_acid_list = construct_sequence sequence in 
    let average_mass = calculate_mass sequence in 
    let monoisotopic_mass = calculate_monoisotopic_mass sequence in 
    let smiles = generate_smiles sequence in 
    {
      sequence = amino_acid_list;
      average_mass;
      monoisotopic_mass;
      smiles;
    }
   
  
module PepKey =
  struct
    type t = string
    let compare = compare
  end
            
module PepMap = Map.Make(PepKey) 
    
let user_defined_peptides = ref PepMap.empty
  
let add_peptide name sequence = 
  let peptide = construct_peptide sequence in 
  let key = name in 
  user_defined_peptides := PepMap.add key peptide !user_defined_peptides;
  ()
  
let find_peptide_by_name name = 
  try 
    PepMap.find name !user_defined_peptides
  with 
  | Not_found -> raise Not_found 

  module SolventKey =
  struct
    type t = string
    let compare = compare
  end
            
module SolventMap = Map.Make(SolventKey) 
    
let user_defined_solvents = ref SolventMap.empty  

let find_solvent_by_name name = 
  try
  List.find (fun x -> x.name = name) solvent_list
  with 
  | Not_found -> raise Not_found

let add_solvent name =
  let key = name in
  let solvent = find_solvent_by_name name in  
  user_defined_solvents := SolventMap.add key solvent !user_defined_solvents;
  ()




module SolutionKey =
  struct
    type t = string
    let compare = compare
  end
            
module SolutionMap = Map.Make(SolutionKey) 
    
let user_defined_solutions = ref SolutionMap.empty 

let add_solution name solute concentration solvent =  
  let solute = find_peptide_by_name solute in
  let solvent = find_solvent_by_name solvent in
  let concentration = float_of_string concentration in
  let key = name in 
  let solution ={
    solute;
    solvent;
    concentration;
  } in  
  user_defined_solutions := SolutionMap.add key solution !user_defined_solutions;
  () 

let find_solution_by_name name =
  try 
    SolutionMap.find name !user_defined_solutions
  with 
  | Not_found -> raise Not_found 


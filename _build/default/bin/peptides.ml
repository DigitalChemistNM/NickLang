open Types
type peptide = 
  {
    sequence: amino_acid list;
    average_mass: float;
    monoisotopic_mass: float;
    smiles: string;
  } 
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
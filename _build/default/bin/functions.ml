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
  let total_mass = List.fold_left(fun acc aa -> acc  +. find_average_mass_by_one_letter_code aa.one_letter_code natural_amino_acids ) 0.0  sequence in
  total_mass +. 18.01528

(*same as above for monoisotopic*)

let calculate_peptide_monoisotopic_mass sequence =
  let total_mass = List.fold_left(fun acc aa -> acc  +. find_monoisotopic_mass_by_one_letter_code aa.one_letter_code natural_amino_acids ) 0.0  sequence in
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
  smiles

  
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


(*A map to keep track of peptide variables declared in scope*)
module PepKey =
  struct
    type t = string
    let compare = compare
  end



module PepMap = Map.Make(PepKey) 
    
let user_defined_peptides = ref PepMap.empty

(*This function adds user declared peptides to map*)
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

(*Same logic as above for solvents*)
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
(*Same logic as above for solutions*)
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
  let concentration = concentration in
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

(*this function is just for print debugging*)
let print_maps () = 
  let print_peptides () = 
    PepMap.iter (fun key value -> 
      print_string key;
      print_string " : ";
      print_string (String.concat "" (List.map (fun x -> String.make 1 x.one_letter_code) value.sequence |> List.rev));
      print_newline();
    ) !user_defined_peptides in 
  let print_solvents () = 
    SolventMap.iter (fun key value -> 
      print_string key;
      print_string " : ";
      print_string value.name;
      print_newline();
    ) !user_defined_solvents in 
  let print_solutions () = 
    SolutionMap.iter (fun key value -> 
      print_string key;
      print_string " : ";
      print_string " ";
      print_string (string_of_float value.concentration);
      print_string " ";
      print_string (String.concat "" (List.map (fun x -> String.make 1 x.one_letter_code) value.solute.sequence |> List.rev));
      print_string " in ";
      print_string value.solvent.name;
      print_newline();
    ) !user_defined_solutions in 
  print_peptides ();
  print_solvents  ();
  print_solutions ()


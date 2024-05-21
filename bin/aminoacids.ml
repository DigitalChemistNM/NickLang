type amino_acid =
  { 
    number: int;
    name: string;
    three_letter_code: string;
    one_letter_code: char;
    monoisotopic_mass : float;
    average_mass : float;
    formula: string;
    smiles: string;

  }

 

(*function for parsing lines of the CSV file and creating an amino acid type with the info populated*)
  let parse_line line = 
  match String.split_on_char ',' line with 
  | [number; name; three_letter_code; one_letter_code; monoisotopic_mass; average_mass; formula; smiles ] ->
    {
      number = int_of_string number;
      name;
      three_letter_code;
      one_letter_code = String.get one_letter_code 0;
      monoisotopic_mass = float_of_string monoisotopic_mass;
      average_mass = float_of_string average_mass;  
      formula; 
      smiles;
    }
    | _ -> failwith "You suck at coding" 


(*function to read in CSV*)
let read_csv filename =
  let channel = open_in filename in
  let rec read_lines acc =
    try
      let line = input_line channel in
      let amino_acid = parse_line line in
      read_lines (amino_acid :: acc)
    with
        End_of_file -> close_in channel; List.rev acc
    in
      read_lines []

(*create a list of amino_acids that comprise of the 20 naturally ocurring ones*)
let natural_amino_acids = read_csv "aa.csv"  

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


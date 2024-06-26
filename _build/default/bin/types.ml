(*This module defines some types that are useful for chemistry. Properties of different species is encoded in, with scope to expand this*)

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

  type peptide = 
  {
    sequence: amino_acid list;
    average_mass: float;
    monoisotopic_mass: float;
    smiles: string;
  }

type molecule = {

   name: string;
   monoisotopic_mass : float;
   average_mass : float;
   formula: string;
   smiles: string
  }

type dissolved_compound =
  | Peptide of peptide * float
  | Molecule of molecule * float



type solvent = 
  {
    solname: string;
    formula: string;
    protic: bool; 
    polar: bool;
 }


type solution = {
  solute: peptide;
  solvent: solvent;
  concentration: float;
}

type mol_solution = {
  solute: molecule;
  solvent: solvent;
  concentration: float;
}


type super_solution = {

  solutes : dissolved_compound list;
  solvents : solvent list;

}


type arglist =
 | EmptyArglist
 | Arglist of string * arglist

let rec arglist_to_lst args =
  match args with
  | EmptyArglist -> []
  | Arglist(s,l) -> s :: (arglist_to_lst l)

type expression =
  | Sequence of expression * expression
  | Peptide of string * string
  | Molecule of string * string
  | Solvent of string
  | Solution of string * string * float * string
  | Molsolution of string * string * float * string
  | CalculateAverageMass of string
  | GenerateSmiles of string
  | Protocol of string * arglist * expression
  | Dispense of string
  | FindLocation of string
  | Combine of string * string
  | Agitate of string * int
  | Print
  | Call of string * string list


type protocol ={
  name : string;
  arglist : arglist;
  expressions: expression
}


 (*A map to keep track of peptide variables declared in scope*)
module PepKey =
  struct
    type t = string
    let compare = compare
  end


module PepMap = Map.Make(PepKey)

(*Same logic as above for solvents*)
  module SolventKey =
  struct
    type t = string
    let compare = compare
  end

module SolventMap = Map.Make(SolventKey)

 (*for solutions*)
module SolutionKey =
  struct
    type t = string
    let compare = compare
  end

module SolutionMap = Map.Make(SolutionKey)

(*maps to keep track of user protocols*)

module ProtocolKey =
  struct
    type t = string
    let compare = compare
  end

module ProtocolMap = Map.Make(ProtocolKey)

module MoleculeKey =
  struct
    type t = string
    let compare = compare
  end

module MoleculeMap = Map.Make(MoleculeKey)

module MolsolutionKey =
  struct
    type t = string
    let compare = compare
  end

module MolsolutionMap = Map.Make(MolsolutionKey)

type env = {

  peptides : peptide PepMap.t;
  molecules : molecule MoleculeMap.t;
  solvents : solvent SolventMap.t;
  solutions : solution SolutionMap.t;
  mol_solutions : mol_solution MolsolutionMap.t;
  protocols : protocol ProtocolMap.t

}

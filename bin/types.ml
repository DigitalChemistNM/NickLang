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


type solvent =
  {
    solname: string;
    formula: string;
    protic: bool; 
    polar: bool;
 }

type solute =
  | Peptide of peptide
  | Molecule of molecule


type solution = {
  solutes  : (solute * float) list;
  solvents : solvent list;
  agitate : bool;
}


type 'a input =
  | PeptideInput of peptide
  | MoleculeInput of molecule



type arglist =
 | EmptyArglist
 | Arglist of string * arglist

type sollist =
  | EmptySollist
  | Sollist of string * float * sollist

type solvnlist =
  | EmptySolvnlist
  | Solvnlist of string * solvnlist

let rec arglist_to_lst args =
  match args with
  | EmptyArglist -> []
  | Arglist(s,l) -> s :: (arglist_to_lst l)

type expression =
  | Sequence of expression * expression
  | Addpeptide of string * string
  | Molecule of string * string
  | Solvent of string
  | Solution of string * sollist * solvnlist
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
module SoluteKey =
  struct
    type t = string
    let compare = compare
  end


module SoluteMap = Map.Make(SoluteKey)

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


type env = {

  solutes: solute SoluteMap.t;
  solvents : solvent SolventMap.t;
  solutions : solution SolutionMap.t;
  protocols : protocol ProtocolMap.t

}

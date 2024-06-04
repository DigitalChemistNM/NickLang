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

type location = {
  name: int;
  id : int;
  contains: solution list
}

type arglist =
 | EmptyArglist
 | Arglist of string * arglist

type expression =
  | Sequence of expression * expression
  | Peptide of string * string
  | Molecule of string * string
  | Solvent of string
  | Solution of string * string * float * string
  | CalculateAverageMass of string
  | GenerateSmiles of string
  | Protocol of string * arglist * expression
  | Dispense of string
  | FindLocation of string
  | Combine of string * string * string
  | Agitate of string * int
  | Print
  | Call of string
  | Location of int
  | Contains of int * string


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

module LocationKey =
  struct
    type t = int
    let compare = compare
  end

module LocationMap = Map.Make(LocationKey)


type env = {

  peptides : peptide PepMap.t;
  solvents : solvent SolventMap.t;
  solutions : solution SolutionMap.t;
  protocols : protocol ProtocolMap.t;
  locations : location LocationMap.t

}

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
    name: string;
    formula: string;
    protic: bool; 
    polar: bool;
 } 

type solution = {
  solute: peptide;
  solvent: solvent;
  concentration: float;
}

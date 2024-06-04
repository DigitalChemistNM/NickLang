
%{
  open Types
%}

%token <float> FLOAT
%token <int> NUMERAL
%token <string> ID
%token <string> PEPID
%token <string> MOLID
%token PEPTIDE
%token MOLECULE
%token SOLVENT
%token SOLUTION
%token PROTOCOL
%token DISPENSE
%token FIND
%token LOCATION
%token IN
%token COMBINE
%token AND
%token AT
%token AGITATE
%token FOR
%token MINUTES
%token MM
%token CALCULATE_AVERAGE_MASS
%token GENERATE_SMILES
%token PRINT
%token CALL
%token CONTAINS
%token LPAREN
%token RPAREN
%token LBRACE
%token RBRACE
%token EQUAL
%token LT
%token GT

%token SEMICOLON
%token EOF

/* Precedence */
%left SEMICOLON

/* Top level rule */
%start toplevel
%type <Types.expression> toplevel

%%

/* Grammar */

toplevel: e = expression EOF
  { e }
;

arglist:
| var = ID rest = arglist {Arglist(var, rest)}
|  { EmptyArglist }




expression: 
| e1 = expression SEMICOLON e2 = expression {Sequence (e1, e2)}
| PEPTIDE var = ID EQUAL LT var2 = PEPID GT {Peptide (var, var2)}
| MOLECULE var = ID EQUAL LPAREN var2 = MOLID RPAREN {Molecule (var, var2)}
| SOLVENT var = ID {Solvent var}
| SOLUTION var = ID EQUAL var2 = ID LPAREN var3 = FLOAT MM RPAREN IN var4 = ID {Solution (var, var2, var3, var4)}
| CALCULATE_AVERAGE_MASS LT var = PEPID GT {CalculateAverageMass (var)}
| GENERATE_SMILES LT var = PEPID GT {GenerateSmiles (var)} 
| PROTOCOL var = ID args = arglist LBRACE body = expression RBRACE   {Protocol (var, args, body)}
| DISPENSE var = ID {Dispense var}
| var = ID EQUAL FIND LOCATION {FindLocation(var)}
| COMBINE var = ID AND var2 = ID AT var3 = ID {Combine(var, var2, var3)}
| AGITATE var = ID FOR var2 = NUMERAL MINUTES {Agitate(var, var2)}
| PRINT {Print}
| CALL var = ID {Call(var)}
| LOCATION var = NUMERAL{Location(var)}
| var = NUMERAL CONTAINS var2 = ID{Contains(var,var2)}

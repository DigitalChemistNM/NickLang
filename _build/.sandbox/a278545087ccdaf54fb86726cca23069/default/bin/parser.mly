%{
	open Syntax
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
%token IN
%token MM
%token CALCULATE_AVERAGE_MASS
%token GENERATE_SMILES
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
%type <Syntax.expression> toplevel 

%%

/* Grammar */

toplevel: e = expression EOF
  { e }
;

expression: 
| e1 = expression SEMICOLON e2 = expression {Sequence (e1, e2)}
| PEPTIDE var = ID EQUAL LT var2 = PEPID GT {Peptide (var, var2)}
| MOLECULE var = ID EQUAL LPAREN var2 = MOLID RPAREN {Molecule (var, var2)}
| SOLVENT var = ID {Solvent var}
| SOLUTION var = ID EQUAL var2 = ID LPAREN var3 = FLOAT MM RPAREN IN var4 = ID {Solution (var, var2, var3, var4)}
| CALCULATE_AVERAGE_MASS LT var = PEPID GT {CalculateAverageMass (var)}
| GENERATE_SMILES LT var = PEPID GT {GenerateSmiles (var)} 
| PROTOCOL var = ID args = arglist LBRACE body = expression RBACE   {Protocol (var, args, body)}

arglist:
| var = ID arglist {Arglist(var, arglist)}


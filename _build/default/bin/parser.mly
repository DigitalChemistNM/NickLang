%{
	open Syntax
%}

%token <string> ID
%token <string> PEPID
%token <string> MOLID
%token PEPTIDE
%token MOLECULE
%token SOLVENT
%token LPAREN
%token RPAREN
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

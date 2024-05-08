%{
	open Syntax
%}


%token <int> INT
%token <float> FLOAT
%token <string> ID
%token MOLECULE
%token PEPITDE
%token SOLVENT
%token SOLUTION
%token COMBINE
%token COMBINE
%token SET
%token TEMP
%token MM
%token PROTOCOL
%token PRODUCES
%token SEMICOLON
%token AND
%token WITH
%token FOR
%token HOURS
%token MINUTES
%token IN
%token EQUAL
%token LT
%token GT
%token COMMA
%token RPAREN
%token LPAREN
%token LBRACE
%token RBRACE
%token UNDERSCORE
%token EOF

/* Precedence */
%left SEMICOLON

/* Top level rule */
%start toplevel
%type <Syntax.expression list> toplevel 

%%

/* Grammar */

toplevel: e = separated_nonempty_list(SEMICOLON, expression); EOF
  { e }
;

expression: 
(*| e1 = expression SEMICOLON e2 = expression {Sequence (e1, e2)}*)
| PEPTIDE var = ID EQUAL LT var2 = PEPID GT {Peptide (var, var2)}
| MOLECULE var = ID EQUAL LT var = MOLECULE GT
| SOLVENT var = ID
| SOLUTION var = ID EQUAL var2 = ID LBRACE FLOAT MM RBRACE IN var3 = ID  
| SOLUTION var = ID EQUAL COMBINE LPAREN var = ID COMMA var = ID RPAREN
| SOLUTION var = ID EQUAL AGITATE var = ID FOR FLOAT HOURS

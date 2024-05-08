%{
	open Syntax
%}

%token <string> ID
%token <string> PEPID
%token PEPITDE
%token EQUAL
%token LT
%token GT
%token COMMA
%token SEMICOLON
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


module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | SOLVENT
    | SOLUTION
    | SEMICOLON
    | RPAREN
    | RBRACE
    | RBRAC
    | PROTOCOL
    | PRINT
    | PEPTIDE
    | PEPID of (
# 9 "bin/parser.mly"
       (string)
# 24 "bin/parser.ml"
  )
    | NUMERAL of (
# 7 "bin/parser.mly"
       (int)
# 29 "bin/parser.ml"
  )
    | MOLSOLUTION
    | MOLID of (
# 10 "bin/parser.mly"
       (string)
# 35 "bin/parser.ml"
  )
    | MOLECULE
    | MM
    | MINUTES
    | LT
    | LPAREN
    | LOCATION
    | LBRACE
    | LBRAC
    | IN
    | ID of (
# 8 "bin/parser.mly"
       (string)
# 49 "bin/parser.ml"
  )
    | GT
    | GENERATE_SMILES
    | FOR
    | FLOAT of (
# 6 "bin/parser.mly"
       (float)
# 57 "bin/parser.ml"
  )
    | FIND
    | EQUAL
    | EOF
    | DISPENSE
    | COMBINE
    | CALL
    | CALCULATE_AVERAGE_MASS
    | AT
    | AND
    | AGITATE
  
end

include MenhirBasics

# 2 "bin/parser.mly"
  
  open Types

# 78 "bin/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_toplevel) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: toplevel. *)

  | MenhirState06 : (('s, _menhir_box_toplevel) _menhir_cell1_SOLUTION _menhir_cell0_ID, _menhir_box_toplevel) _menhir_state
    (** State 06.
        Stack shape : SOLUTION ID.
        Start symbol: toplevel. *)

  | MenhirState11 : (('s, _menhir_box_toplevel) _menhir_cell1_LPAREN _menhir_cell0_ID _menhir_cell0_FLOAT, _menhir_box_toplevel) _menhir_state
    (** State 11.
        Stack shape : LPAREN ID FLOAT.
        Start symbol: toplevel. *)

  | MenhirState16 : ((('s, _menhir_box_toplevel) _menhir_cell1_SOLUTION _menhir_cell0_ID, _menhir_box_toplevel) _menhir_cell1_sollist, _menhir_box_toplevel) _menhir_state
    (** State 16.
        Stack shape : SOLUTION ID sollist.
        Start symbol: toplevel. *)

  | MenhirState17 : (('s, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_state
    (** State 17.
        Stack shape : ID.
        Start symbol: toplevel. *)

  | MenhirState22 : (('s, _menhir_box_toplevel) _menhir_cell1_PROTOCOL _menhir_cell0_ID, _menhir_box_toplevel) _menhir_state
    (** State 22.
        Stack shape : PROTOCOL ID.
        Start symbol: toplevel. *)

  | MenhirState23 : (('s, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_state
    (** State 23.
        Stack shape : ID.
        Start symbol: toplevel. *)

  | MenhirState26 : ((('s, _menhir_box_toplevel) _menhir_cell1_PROTOCOL _menhir_cell0_ID, _menhir_box_toplevel) _menhir_cell1_arglist, _menhir_box_toplevel) _menhir_state
    (** State 26.
        Stack shape : PROTOCOL ID arglist.
        Start symbol: toplevel. *)

  | MenhirState55 : (('s, _menhir_box_toplevel) _menhir_cell1_CALL _menhir_cell0_ID, _menhir_box_toplevel) _menhir_state
    (** State 55.
        Stack shape : CALL ID.
        Start symbol: toplevel. *)

  | MenhirState56 : (('s, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_state
    (** State 56.
        Stack shape : ID.
        Start symbol: toplevel. *)

  | MenhirState69 : (('s, _menhir_box_toplevel) _menhir_cell1_expression, _menhir_box_toplevel) _menhir_state
    (** State 69.
        Stack shape : expression.
        Start symbol: toplevel. *)


and ('s, 'r) _menhir_cell1_arglist = 
  | MenhirCell1_arglist of 's * ('s, 'r) _menhir_state * (Types.arglist)

and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (Types.expression)

and ('s, 'r) _menhir_cell1_sollist = 
  | MenhirCell1_sollist of 's * ('s, 'r) _menhir_state * (Types.sollist)

and ('s, 'r) _menhir_cell1_CALL = 
  | MenhirCell1_CALL of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_FLOAT = 
  | MenhirCell0_FLOAT of 's * (
# 6 "bin/parser.mly"
       (float)
# 153 "bin/parser.ml"
)

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 8 "bin/parser.mly"
       (string)
# 160 "bin/parser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 8 "bin/parser.mly"
       (string)
# 167 "bin/parser.ml"
)

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PROTOCOL = 
  | MenhirCell1_PROTOCOL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SOLUTION = 
  | MenhirCell1_SOLUTION of 's * ('s, 'r) _menhir_state

and _menhir_box_toplevel = 
  | MenhirBox_toplevel of (Types.expression) [@@unboxed]

let _menhir_action_01 =
  fun rest var ->
    (
# 61 "bin/parser.mly"
                          (Arglist(var, rest))
# 187 "bin/parser.ml"
     : (Types.arglist))

let _menhir_action_02 =
  fun () ->
    (
# 62 "bin/parser.mly"
   ( EmptyArglist )
# 195 "bin/parser.ml"
     : (Types.arglist))

let _menhir_action_03 =
  fun e1 e2 ->
    (
# 76 "bin/parser.mly"
                                            (Sequence (e1, e2))
# 203 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_04 =
  fun var var2 ->
    (
# 77 "bin/parser.mly"
                                            (Addpeptide (var, var2))
# 211 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_05 =
  fun var var2 ->
    (
# 78 "bin/parser.mly"
                                                     (Molecule (var, var2))
# 219 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_06 =
  fun var ->
    (
# 79 "bin/parser.mly"
                   (Solvent var)
# 227 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_07 =
  fun args1 args2 var ->
    (
# 81 "bin/parser.mly"
                                (Solution (var, args1, args2))
# 235 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_08 =
  fun var ->
    (
# 82 "bin/parser.mly"
                                           (CalculateAverageMass (var))
# 243 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_09 =
  fun var ->
    (
# 83 "bin/parser.mly"
                                    (GenerateSmiles (var))
# 251 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_10 =
  fun args body var ->
    (
# 84 "bin/parser.mly"
                                                                     (Protocol (var, args, body))
# 259 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_11 =
  fun var ->
    (
# 85 "bin/parser.mly"
                    (Dispense var)
# 267 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_12 =
  fun var ->
    (
# 86 "bin/parser.mly"
                               (FindLocation(var))
# 275 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_13 =
  fun var var2 ->
    (
# 87 "bin/parser.mly"
                                 (Combine(var, var2))
# 283 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_14 =
  fun var var2 ->
    (
# 88 "bin/parser.mly"
                                              (Agitate(var, var2))
# 291 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_15 =
  fun () ->
    (
# 89 "bin/parser.mly"
        (Print)
# 299 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_16 =
  fun args var ->
    (
# 90 "bin/parser.mly"
                                 (Call(var, args))
# 307 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_17 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 315 "bin/parser.ml"
     : (string list))

let _menhir_action_18 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 323 "bin/parser.ml"
     : (string list))

let _menhir_action_19 =
  fun conc rest var ->
    (
# 65 "bin/parser.mly"
                                                          (Sollist(var, conc, rest))
# 331 "bin/parser.ml"
     : (Types.sollist))

let _menhir_action_20 =
  fun () ->
    (
# 66 "bin/parser.mly"
   ( EmptySollist )
# 339 "bin/parser.ml"
     : (Types.sollist))

let _menhir_action_21 =
  fun rest var ->
    (
# 69 "bin/parser.mly"
                            (Solvnlist(var, rest))
# 347 "bin/parser.ml"
     : (Types.solvnlist))

let _menhir_action_22 =
  fun () ->
    (
# 70 "bin/parser.mly"
   ( EmptySolvnlist )
# 355 "bin/parser.ml"
     : (Types.solvnlist))

let _menhir_action_23 =
  fun e ->
    (
# 57 "bin/parser.mly"
  ( e )
# 363 "bin/parser.ml"
     : (Types.expression))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AGITATE ->
        "AGITATE"
    | AND ->
        "AND"
    | AT ->
        "AT"
    | CALCULATE_AVERAGE_MASS ->
        "CALCULATE_AVERAGE_MASS"
    | CALL ->
        "CALL"
    | COMBINE ->
        "COMBINE"
    | DISPENSE ->
        "DISPENSE"
    | EOF ->
        "EOF"
    | EQUAL ->
        "EQUAL"
    | FIND ->
        "FIND"
    | FLOAT _ ->
        "FLOAT"
    | FOR ->
        "FOR"
    | GENERATE_SMILES ->
        "GENERATE_SMILES"
    | GT ->
        "GT"
    | ID _ ->
        "ID"
    | IN ->
        "IN"
    | LBRAC ->
        "LBRAC"
    | LBRACE ->
        "LBRACE"
    | LOCATION ->
        "LOCATION"
    | LPAREN ->
        "LPAREN"
    | LT ->
        "LT"
    | MINUTES ->
        "MINUTES"
    | MM ->
        "MM"
    | MOLECULE ->
        "MOLECULE"
    | MOLID _ ->
        "MOLID"
    | MOLSOLUTION ->
        "MOLSOLUTION"
    | NUMERAL _ ->
        "NUMERAL"
    | PEPID _ ->
        "PEPID"
    | PEPTIDE ->
        "PEPTIDE"
    | PRINT ->
        "PRINT"
    | PROTOCOL ->
        "PROTOCOL"
    | RBRAC ->
        "RBRAC"
    | RBRACE ->
        "RBRACE"
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"
    | SOLUTION ->
        "SOLUTION"
    | SOLVENT ->
        "SOLVENT"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let var = _v in
          let _v = _menhir_action_06 var in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_73 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState69 ->
          _menhir_run_70 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState26 ->
          _menhir_run_68 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_73 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_69 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let e = _v in
          let _v = _menhir_action_23 e in
          MenhirBox_toplevel _v
      | _ ->
          _eRR ()
  
  and _menhir_run_69 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_expression -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState69 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SOLVENT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SOLUTION ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROTOCOL ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINT ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PEPTIDE ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MOLECULE ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GENERATE_SMILES ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISPENSE ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | COMBINE ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALL ->
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALCULATE_AVERAGE_MASS ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | AGITATE ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_SOLUTION (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LBRAC ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LPAREN ->
                      _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
                  | RBRAC ->
                      let _v_0 = _menhir_action_20 () in
                      _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState06
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | FLOAT _v_0 ->
              let _menhir_stack = MenhirCell0_FLOAT (_menhir_stack, _v_0) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | MM ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | RPAREN ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | LPAREN ->
                          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
                      | RBRAC ->
                          let _v_1 = _menhir_action_20 () in
                          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_12 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_LPAREN _menhir_cell0_ID _menhir_cell0_FLOAT -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell0_FLOAT (_menhir_stack, conc) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, var) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let rest = _v in
      let _v = _menhir_action_19 conc rest var in
      _menhir_goto_sollist _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_sollist : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState06 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState11 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_13 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_SOLUTION _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_sollist (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBRAC ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v_0 ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState16
              | RBRAC ->
                  let _v_1 = _menhir_action_22 () in
                  _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState17
      | RBRAC ->
          let _v_1 = _menhir_action_22 () in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, var) = _menhir_stack in
      let rest = _v in
      let _v = _menhir_action_21 rest var in
      _menhir_goto_solvnlist _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_solvnlist : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState16 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState17 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_19 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_SOLUTION _menhir_cell0_ID, _menhir_box_toplevel) _menhir_cell1_sollist -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_sollist (_menhir_stack, _, args1) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, var) = _menhir_stack in
      let MenhirCell1_SOLUTION (_menhir_stack, _menhir_s) = _menhir_stack in
      let args2 = _v in
      let _v = _menhir_action_07 args1 args2 var in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_21 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PROTOCOL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v_0 ->
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState22
          | LBRACE ->
              let _v_1 = _menhir_action_02 () in
              _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState22
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState23
      | LBRACE ->
          let _v_1 = _menhir_action_02 () in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, var) = _menhir_stack in
      let rest = _v in
      let _v = _menhir_action_01 rest var in
      _menhir_goto_arglist _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_arglist : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState22 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState23 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_25 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_PROTOCOL _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_arglist (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState26 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SOLVENT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SOLUTION ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROTOCOL ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINT ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PEPTIDE ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MOLECULE ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GENERATE_SMILES ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISPENSE ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | COMBINE ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALL ->
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALCULATE_AVERAGE_MASS ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | AGITATE ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_27 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_15 () in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_28 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | PEPID _v_0 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | GT ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let (var, var2) = (_v, _v_0) in
                          let _v = _menhir_action_04 var var2 in
                          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_34 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | MOLID _v_0 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | RPAREN ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let (var, var2) = (_v, _v_0) in
                          let _v = _menhir_action_05 var var2 in
                          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | FIND ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LOCATION ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let var = _v in
                  let _v = _menhir_action_12 var in
                  _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_44 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PEPID _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | GT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let var = _v in
                  let _v = _menhir_action_09 var in
                  _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_48 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let var = _v in
          let _v = _menhir_action_11 var in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_50 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AND ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (var, var2) = (_v, _v_0) in
                  let _v = _menhir_action_13 var var2 in
                  _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_54 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CALL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v_0 ->
              _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState55
          | EOF | RBRACE | SEMICOLON ->
              let _v_1 = _menhir_action_17 () in
              _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_56 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState56
      | EOF | RBRACE | SEMICOLON ->
          let _v_1 = _menhir_action_17 () in
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_57 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_18 x xs in
      _menhir_goto_list_ID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_ID_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState55 ->
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState56 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_58 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_CALL _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_ID (_menhir_stack, var) = _menhir_stack in
      let MenhirCell1_CALL (_menhir_stack, _menhir_s) = _menhir_stack in
      let args = _v in
      let _v = _menhir_action_16 args var in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_59 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PEPID _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | GT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let var = _v in
                  let _v = _menhir_action_08 var in
                  _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_63 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | FOR ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | NUMERAL _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | MINUTES ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (var, var2) = (_v, _v_0) in
                      let _v = _menhir_action_14 var var2 in
                      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_70 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_03 e1 e2 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_68 : type  ttv_stack. (((ttv_stack, _menhir_box_toplevel) _menhir_cell1_PROTOCOL _menhir_cell0_ID, _menhir_box_toplevel) _menhir_cell1_arglist as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_69 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_arglist (_menhir_stack, _, args) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, var) = _menhir_stack in
          let MenhirCell1_PROTOCOL (_menhir_stack, _menhir_s) = _menhir_stack in
          let body = _v in
          let _v = _menhir_action_10 args body var in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState00 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SOLVENT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SOLUTION ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROTOCOL ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINT ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PEPTIDE ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MOLECULE ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GENERATE_SMILES ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISPENSE ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | COMBINE ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALL ->
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALCULATE_AVERAGE_MASS ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | AGITATE ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
end

let toplevel =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_toplevel v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

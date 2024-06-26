
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
    | PROTOCOL
    | PRINT
    | PEPTIDE
    | PEPID of (
# 9 "bin/parser.mly"
       (string)
# 23 "bin/parser.ml"
  )
    | NUMERAL of (
# 7 "bin/parser.mly"
       (int)
# 28 "bin/parser.ml"
  )
    | MOLSOLUTION
    | MOLID of (
# 10 "bin/parser.mly"
       (string)
# 34 "bin/parser.ml"
  )
    | MOLECULE
    | MM
    | MINUTES
    | LT
    | LPAREN
    | LOCATION
    | LBRACE
    | IN
    | ID of (
# 8 "bin/parser.mly"
       (string)
# 47 "bin/parser.ml"
  )
    | GT
    | GENERATE_SMILES
    | FOR
    | FLOAT of (
# 6 "bin/parser.mly"
       (float)
# 55 "bin/parser.ml"
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

# 76 "bin/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_toplevel) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: toplevel. *)

  | MenhirState14 : (('s, _menhir_box_toplevel) _menhir_cell1_PROTOCOL _menhir_cell0_ID, _menhir_box_toplevel) _menhir_state
    (** State 14.
        Stack shape : PROTOCOL ID.
        Start symbol: toplevel. *)

  | MenhirState15 : (('s, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_state
    (** State 15.
        Stack shape : ID.
        Start symbol: toplevel. *)

  | MenhirState18 : ((('s, _menhir_box_toplevel) _menhir_cell1_PROTOCOL _menhir_cell0_ID, _menhir_box_toplevel) _menhir_cell1_arglist, _menhir_box_toplevel) _menhir_state
    (** State 18.
        Stack shape : PROTOCOL ID arglist.
        Start symbol: toplevel. *)

  | MenhirState57 : (('s, _menhir_box_toplevel) _menhir_cell1_CALL _menhir_cell0_ID, _menhir_box_toplevel) _menhir_state
    (** State 57.
        Stack shape : CALL ID.
        Start symbol: toplevel. *)

  | MenhirState58 : (('s, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_state
    (** State 58.
        Stack shape : ID.
        Start symbol: toplevel. *)

  | MenhirState71 : (('s, _menhir_box_toplevel) _menhir_cell1_expression, _menhir_box_toplevel) _menhir_state
    (** State 71.
        Stack shape : expression.
        Start symbol: toplevel. *)


and ('s, 'r) _menhir_cell1_arglist = 
  | MenhirCell1_arglist of 's * ('s, 'r) _menhir_state * (Types.arglist)

and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (Types.expression)

and ('s, 'r) _menhir_cell1_CALL = 
  | MenhirCell1_CALL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 8 "bin/parser.mly"
       (string)
# 128 "bin/parser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 8 "bin/parser.mly"
       (string)
# 135 "bin/parser.ml"
)

and ('s, 'r) _menhir_cell1_PROTOCOL = 
  | MenhirCell1_PROTOCOL of 's * ('s, 'r) _menhir_state

and _menhir_box_toplevel = 
  | MenhirBox_toplevel of (Types.expression) [@@unboxed]

let _menhir_action_01 =
  fun rest var ->
    (
# 59 "bin/parser.mly"
                          (Arglist(var, rest))
# 149 "bin/parser.ml"
     : (Types.arglist))

let _menhir_action_02 =
  fun () ->
    (
# 60 "bin/parser.mly"
   ( EmptyArglist )
# 157 "bin/parser.ml"
     : (Types.arglist))

let _menhir_action_03 =
  fun e1 e2 ->
    (
# 66 "bin/parser.mly"
                                            (Sequence (e1, e2))
# 165 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_04 =
  fun var var2 ->
    (
# 67 "bin/parser.mly"
                                            (Peptide (var, var2))
# 173 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_05 =
  fun var var2 ->
    (
# 68 "bin/parser.mly"
                                                     (Molecule (var, var2))
# 181 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_06 =
  fun var ->
    (
# 69 "bin/parser.mly"
                   (Solvent var)
# 189 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_07 =
  fun var var2 var3 var4 ->
    (
# 70 "bin/parser.mly"
                                                                               (Solution (var, var2, var3, var4))
# 197 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_08 =
  fun var var2 var3 var4 ->
    (
# 71 "bin/parser.mly"
                                                                                  (Molsolution (var, var2, var3, var4))
# 205 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_09 =
  fun var ->
    (
# 72 "bin/parser.mly"
                                           (CalculateAverageMass (var))
# 213 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_10 =
  fun var ->
    (
# 73 "bin/parser.mly"
                                    (GenerateSmiles (var))
# 221 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_11 =
  fun args body var ->
    (
# 74 "bin/parser.mly"
                                                                     (Protocol (var, args, body))
# 229 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_12 =
  fun var ->
    (
# 75 "bin/parser.mly"
                    (Dispense var)
# 237 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_13 =
  fun var ->
    (
# 76 "bin/parser.mly"
                               (FindLocation(var))
# 245 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_14 =
  fun var var2 ->
    (
# 77 "bin/parser.mly"
                                 (Combine(var, var2))
# 253 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_15 =
  fun var var2 ->
    (
# 78 "bin/parser.mly"
                                              (Agitate(var, var2))
# 261 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_16 =
  fun () ->
    (
# 79 "bin/parser.mly"
        (Print)
# 269 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_17 =
  fun args var ->
    (
# 80 "bin/parser.mly"
                                 (Call(var, args))
# 277 "bin/parser.ml"
     : (Types.expression))

let _menhir_action_18 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 285 "bin/parser.ml"
     : (string list))

let _menhir_action_19 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 293 "bin/parser.ml"
     : (string list))

let _menhir_action_20 =
  fun e ->
    (
# 55 "bin/parser.mly"
  ( e )
# 301 "bin/parser.ml"
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
          _menhir_run_75 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState71 ->
          _menhir_run_72 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState18 ->
          _menhir_run_70 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_75 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_71 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let e = _v in
          let _v = _menhir_action_20 e in
          MenhirBox_toplevel _v
      | _ ->
          _eRR ()
  
  and _menhir_run_71 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_expression -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState71 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SOLVENT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SOLUTION ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROTOCOL ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINT ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PEPTIDE ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MOLSOLUTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MOLECULE ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GENERATE_SMILES ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISPENSE ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | COMBINE ->
          _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALL ->
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALCULATE_AVERAGE_MASS ->
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | AGITATE ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LPAREN ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | FLOAT _v_1 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | MM ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              (match (_tok : MenhirBasics.token) with
                              | RPAREN ->
                                  let _tok = _menhir_lexer _menhir_lexbuf in
                                  (match (_tok : MenhirBasics.token) with
                                  | IN ->
                                      let _tok = _menhir_lexer _menhir_lexbuf in
                                      (match (_tok : MenhirBasics.token) with
                                      | ID _v_2 ->
                                          let _tok = _menhir_lexer _menhir_lexbuf in
                                          let (var, var2, var4, var3) = (_v, _v_0, _v_2, _v_1) in
                                          let _v = _menhir_action_07 var var2 var3 var4 in
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
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PROTOCOL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v_0 ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState14
          | LBRACE ->
              let _v_1 = _menhir_action_02 () in
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState14
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState15
      | LBRACE ->
          let _v_1 = _menhir_action_02 () in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, var) = _menhir_stack in
      let rest = _v in
      let _v = _menhir_action_01 rest var in
      _menhir_goto_arglist _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_arglist : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState14 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState15 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_17 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_PROTOCOL _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_arglist (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState18 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SOLVENT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SOLUTION ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROTOCOL ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINT ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PEPTIDE ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MOLSOLUTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MOLECULE ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GENERATE_SMILES ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISPENSE ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | COMBINE ->
          _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALL ->
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALCULATE_AVERAGE_MASS ->
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | AGITATE ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_16 () in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_20 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
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
  
  and _menhir_run_26 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LPAREN ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | FLOAT _v_1 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | MM ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              (match (_tok : MenhirBasics.token) with
                              | RPAREN ->
                                  let _tok = _menhir_lexer _menhir_lexbuf in
                                  (match (_tok : MenhirBasics.token) with
                                  | IN ->
                                      let _tok = _menhir_lexer _menhir_lexbuf in
                                      (match (_tok : MenhirBasics.token) with
                                      | ID _v_2 ->
                                          let _tok = _menhir_lexer _menhir_lexbuf in
                                          let (var, var2, var4, var3) = (_v, _v_0, _v_2, _v_1) in
                                          let _v = _menhir_action_08 var var2 var3 var4 in
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
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_36 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
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
  
  and _menhir_run_42 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
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
                  let _v = _menhir_action_13 var in
                  _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_46 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
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
                  let _v = _menhir_action_10 var in
                  _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_50 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let var = _v in
          let _v = _menhir_action_12 var in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_52 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
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
                  let _v = _menhir_action_14 var var2 in
                  _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_56 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CALL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v_0 ->
              _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState57
          | EOF | RBRACE | SEMICOLON ->
              let _v_1 = _menhir_action_18 () in
              _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_58 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState58
      | EOF | RBRACE | SEMICOLON ->
          let _v_1 = _menhir_action_18 () in
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_59 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_19 x xs in
      _menhir_goto_list_ID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_ID_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState57 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState58 ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_60 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_CALL _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_ID (_menhir_stack, var) = _menhir_stack in
      let MenhirCell1_CALL (_menhir_stack, _menhir_s) = _menhir_stack in
      let args = _v in
      let _v = _menhir_action_17 args var in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_61 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
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
  
  and _menhir_run_65 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
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
                      let _v = _menhir_action_15 var var2 in
                      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_72 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_03 e1 e2 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_70 : type  ttv_stack. (((ttv_stack, _menhir_box_toplevel) _menhir_cell1_PROTOCOL _menhir_cell0_ID, _menhir_box_toplevel) _menhir_cell1_arglist as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_71 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_arglist (_menhir_stack, _, args) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, var) = _menhir_stack in
          let MenhirCell1_PROTOCOL (_menhir_stack, _menhir_s) = _menhir_stack in
          let body = _v in
          let _v = _menhir_action_11 args body var in
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
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINT ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PEPTIDE ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MOLSOLUTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MOLECULE ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GENERATE_SMILES ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISPENSE ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | COMBINE ->
          _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALL ->
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALCULATE_AVERAGE_MASS ->
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | AGITATE ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
end

let toplevel =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_toplevel v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

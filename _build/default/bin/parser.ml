
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | SOLVENT
    | SEMICOLON
    | RPAREN
    | PEPTIDE
    | PEPID of (
# 6 "bin/parser.mly"
       (string)
# 19 "bin/parser.ml"
  )
    | MOLID of (
# 7 "bin/parser.mly"
       (string)
# 24 "bin/parser.ml"
  )
    | MOLECULE
    | LT
    | LPAREN
    | ID of (
# 5 "bin/parser.mly"
       (string)
# 32 "bin/parser.ml"
  )
    | GT
    | EQUAL
    | EOF
  
end

include MenhirBasics

# 1 "bin/parser.mly"
  
  open Syntax

# 46 "bin/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_toplevel) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: toplevel. *)

  | MenhirState17 : (('s, _menhir_box_toplevel) _menhir_cell1_expression, _menhir_box_toplevel) _menhir_state
    (** State 17.
        Stack shape : expression.
        Start symbol: toplevel. *)


and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (Syntax.expression)

and _menhir_box_toplevel = 
  | MenhirBox_toplevel of (Syntax.expression) [@@unboxed]

let _menhir_action_1 =
  fun e1 e2 ->
    (
# 36 "bin/parser.mly"
                                            (Sequence (e1, e2))
# 71 "bin/parser.ml"
     : (Syntax.expression))

let _menhir_action_2 =
  fun var var2 ->
    (
# 37 "bin/parser.mly"
                                            (Peptide (var, var2))
# 79 "bin/parser.ml"
     : (Syntax.expression))

let _menhir_action_3 =
  fun var var2 ->
    (
# 38 "bin/parser.mly"
                                                     (Molecule (var, var2))
# 87 "bin/parser.ml"
     : (Syntax.expression))

let _menhir_action_4 =
  fun var ->
    (
# 39 "bin/parser.mly"
                   (Solvent var)
# 95 "bin/parser.ml"
     : (Syntax.expression))

let _menhir_action_5 =
  fun e ->
    (
# 31 "bin/parser.mly"
  ( e )
# 103 "bin/parser.ml"
     : (Syntax.expression))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | EOF ->
        "EOF"
    | EQUAL ->
        "EQUAL"
    | GT ->
        "GT"
    | ID _ ->
        "ID"
    | LPAREN ->
        "LPAREN"
    | LT ->
        "LT"
    | MOLECULE ->
        "MOLECULE"
    | MOLID _ ->
        "MOLID"
    | PEPID _ ->
        "PEPID"
    | PEPTIDE ->
        "PEPTIDE"
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"
    | SOLVENT ->
        "SOLVENT"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let var = _v in
          let _v = _menhir_action_4 var in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState17 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_18 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_1 e1 e2 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SOLVENT ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
          | PEPTIDE ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
          | MOLECULE ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
          | _ ->
              _eRR ())
      | EOF ->
          let e = _v in
          let _v = _menhir_action_5 e in
          MenhirBox_toplevel _v
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
              | LT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | PEPID _v_0 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | GT ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let (var, var2) = (_v, _v_0) in
                          let _v = _menhir_action_2 var var2 in
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
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
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
                          let _v = _menhir_action_3 var var2 in
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
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SOLVENT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | PEPTIDE ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | MOLECULE ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | _ ->
          _eRR ()
  
end

let toplevel =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_toplevel v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

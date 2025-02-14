(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2016     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(************************************************************************)
(* Coq serialization API/Plugin                                         *)
(* Copyright 2016-2018 MINES ParisTech                                  *)
(************************************************************************)
(* Status: Very Experimental                                            *)
(************************************************************************)

open Sexplib.Std
open Ppx_hash_lib.Std.Hash.Builtin
open Ppx_compare_lib.Builtin

module Ssrmatching_plugin = struct
  module Ssrmatching = Serlib_ssrmatching.Ser_ssrmatching
end

module Ssreflect_plugin = struct
  module Ssrast = Ser_ssrast
  module Ssrequality = Ssreflect_plugin.Ssrequality
end

open Ssreflect_plugin [@@ocaml.warning "-33"]

type ssrwkind =
  [%import: Ssreflect_plugin.Ssrequality.ssrwkind]
  [@@deriving sexp,hash,compare]

type ssrrule =
  [%import: Ssreflect_plugin.Ssrequality.ssrrule]
  [@@deriving sexp,hash,compare]

type ssrrwarg =
  [%import: Ssreflect_plugin.Ssrequality.ssrrwarg]
  [@@deriving sexp,hash,compare]

(* Postfix_Main module for Augeas
 Author: Free Ekanayaka <free@64studio.com>

 Reference:


*)

module Postfix_Main =

   autoload xfm

(************************************************************************
 *                           USEFUL PRIMITIVES
 *************************************************************************)

let eol        = Util.eol
let indent     = del /[ \t]*(\n[ \t]+)?/ " "
let comment    = Util.comment
let empty      = Util.empty
let eq         = del /[ \t]*=/ " ="
let word       = /[A-Za-z0-9\:_.-]+/

(* The value of a parameter, after the '=' sign. Postfix allows that
 * lines are continued by starting continuation lines with spaces.
 * The definition needs to make sure we don't add indented comment lines
 * into values *)
let value =
  let chr = /[^# \t\n]/ in
  let any = /.*/ in
  let line = (chr . any* . chr | chr) in
  let lines = line . (/[ \t]*\n[ \t]+/ . line)* in
    store lines

(************************************************************************
 *                               ENTRIES
 *************************************************************************)

let entry     = [ key word . eq . (indent . value)? . eol ]

(************************************************************************
 *                                LENS
 *************************************************************************)

let lns        = (comment|empty|entry) *

let filter     = incl "/etc/postfix/main.cf"

let xfm        = transform lns filter

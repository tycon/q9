(**************************************************************************)
(*                                                                        *)
(*                                 OCaml                                  *)
(*                                                                        *)
(*              Damien Doligez, projet Para, INRIA Rocquencourt           *)
(*                                                                        *)
(*   Copyright 1998 Institut National de Recherche en Informatique et     *)
(*     en Automatique.                                                    *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)

let mk_k f = 
  "-k", Arg.Int f, 
    Printf.sprintf "BMC bound (default: %d)" !Clflags.bmc_bound 
;;

let mk_f f = 
  "-f", Arg.String f, 
  "Function to verify. By default all operations and transactions \
   in the application are verified."
;;

let mk_p f =
  "-p", Arg.String f,
  "Property to be verified. By default the property verified is \
   defined by the conjunction of all invariant functions defined \
   by the application."
;;

let mk_a f =
  "-a", Arg.Unit f, ""
;;

let mk_absname f =
  "-absname", Arg.Unit f, ""
;;

let mk_annot f =
  "-annot", Arg.Unit f, ""
;;

let mk_binannot f =
  "-bin-annot", Arg.Unit f, ""
;;

let mk_c f =
  "-c", Arg.Unit f, ""
;;

let mk_cc f =
  "-cc", Arg.String f, ""
;;

let mk_cclib f =
  "-cclib", Arg.String f, ""
;;

let mk_ccopt f =
  "-ccopt", Arg.String f,
  ""
;;

let mk_clambda_checks f =
  "-clambda-checks", Arg.Unit f, ""
;;

let mk_compact f =
  "-compact", Arg.Unit f, ""
;;

let mk_compat_32 f =
  "-compat-32", Arg.Unit f,
  ""
;;

let mk_config f =
  "-config", Arg.Unit f, ""
;;

let mk_custom f =
  "-custom", Arg.Unit f, ""
;;

let mk_dllib f =
  "-dllib", Arg.String f, ""
;;

let mk_dllpath f =
  "-dllpath", Arg.String f,
  ""
;;

let mk_dtypes f =
  "-dtypes", Arg.Unit f, ""
;;

let mk_for_pack_byt f =
  "-for-pack", Arg.String f, ""
;;

let mk_for_pack_opt f =
  "-for-pack", Arg.String f, ""
;;

let mk_g_byt f =
  "-g", Arg.Unit f, ""
;;

let mk_g_opt f =
  "-g", Arg.Unit f, ""
;;

let mk_i f =
  "-i", Arg.Unit f, ""
;;

let mk_I f =
  "-I", Arg.String f, ""
;;

let mk_impl f =
  "-impl", Arg.String f, ""
;;

let mk_init f =
  "-init", Arg.String f, ""
;;

let mk_inline f =
  "-inline", Arg.String f,
    Printf.sprintf "<n>|<round>=<n>[,...]  Aggressiveness of inlining \
        (default %.02f, higher numbers mean more aggressive)"
      Clflags.default_inline_threshold
;;

let mk_inline_toplevel f =
  "-inline-toplevel", Arg.String f,
    Printf.sprintf "<n>|<round>=<n>[,...]  Aggressiveness of inlining at \
      toplevel (higher numbers mean more aggressive)"
;;

let mk_inlining_report f =
  "-inlining-report", Arg.Unit f, " Emit `.<round>.inlining' file(s) (one per \
      round) showing the inliner's decisions"
;;

let mk_dump_pass f =
  "-dump-pass", Arg.String f,
  Format.asprintf
    " @[<4>Record transformations performed by these passes:@ @[%a@]@]"
    (Format.pp_print_list
       ~pp_sep:Format.pp_print_space
       Format.pp_print_string)
    !Clflags.all_passes
;;

let mk_o2 f =
  "-O2", Arg.Unit f, ""
;;

let mk_o3 f =
  "-O3", Arg.Unit f, " Apply aggressive optimization for speed (may \
    significantly increase code size and compilation time)"
;;

let mk_rounds f =
  "-rounds", Arg.Int f,
    Printf.sprintf "<n>  Repeat tree optimization and inlining phases this \
        many times (default %d).  Rounds are numbered starting from zero."
      !Clflags.default_simplify_rounds
;;

let mk_inline_max_unroll f =
  "-inline-max-unroll", Arg.String f,
    Printf.sprintf "<n>|<round>=<n>[,...]  Unroll recursive functions at most \
      this many times (default %d)"
      Clflags.default_inline_max_unroll
;;

let mk_classic_inlining f =
  "-Oclassic", Arg.Unit f, " Make inlining decisions at function definition \
     time rather than at the call site (replicates previous behaviour of the \
     compiler)"
;;

let mk_inline_cost arg descr default f =
  Printf.sprintf "-inline-%s-cost" arg,
  Arg.String f,
  Printf.sprintf "<n>|<round>=<n>[,...]  The cost of not removing %s during \
      inlining (default %d, higher numbers more costly)"
    descr
    default
;;

let mk_inline_call_cost =
  mk_inline_cost "call" "a call" Clflags.default_inline_call_cost
let mk_inline_alloc_cost =
  mk_inline_cost "alloc" "an allocation" Clflags.default_inline_alloc_cost
let mk_inline_prim_cost =
  mk_inline_cost "prim" "a primitive" Clflags.default_inline_prim_cost
let mk_inline_branch_cost =
  mk_inline_cost "branch" "a conditional" Clflags.default_inline_branch_cost
let mk_inline_indirect_cost =
  mk_inline_cost "indirect" "an indirect call"
    Clflags.default_inline_indirect_cost

let mk_inline_lifting_benefit f =
  "-inline-lifting-benefit",
  Arg.String f,
  Printf.sprintf "<n>|<round>=<n>[,...]  The benefit of lifting definitions \
    to toplevel during inlining (default %d, higher numbers more beneficial)"
    Clflags.default_inline_lifting_benefit
;;

let mk_inline_branch_factor f =
  "-inline-branch-factor", Arg.String f,
    Printf.sprintf "<n>|<round>=<n>[,...]  Estimate the probability of a \
        branch being cold as 1/(1+n) (used for inlining) (default %.2f)"
    Clflags.default_inline_branch_factor
;;

let mk_intf f =
  "-intf", Arg.String f, ""
;;

let mk_intf_suffix f =
  "-intf-suffix", Arg.String f,
  ""
;;

let mk_intf_suffix_2 f =
  "-intf_suffix", Arg.String f, ""
;;

let mk_keep_docs f =
  "-keep-docs", Arg.Unit f, ""
;;

let mk_no_keep_docs f =
  "-keep-docs", Arg.Unit f,
  ""
;;

let mk_keep_locs f =
  "-keep-locs", Arg.Unit f, ""
;;

let mk_no_keep_locs f =
  "-no-keep-locs", Arg.Unit f, ""
;;

let mk_labels f =
  "-labels", Arg.Unit f, ""
;;

let mk_linkall f =
  "-linkall", Arg.Unit f, ""
;;

let mk_make_runtime f =
  "-make-runtime", Arg.Unit f,
  ""
;;

let mk_make_runtime_2 f =
  "-make_runtime", Arg.Unit f, ""
;;

let mk_inline_max_depth f =
  "-inline-max-depth", Arg.String f,
    Printf.sprintf "<n>|<round>=<n>[,...]  Maximum depth of search for \
      inlining opportunities inside inlined functions (default %d)"
      Clflags.default_inline_max_depth
;;

let mk_modern f =
  "-modern", Arg.Unit f, ""
;;

let mk_alias_deps f =
  "-alias-deps", Arg.Unit f,
  ""
;;

let mk_no_alias_deps f =
  "-no-alias-deps", Arg.Unit f,
  ""
;;

let mk_app_funct f =
  "-app-funct", Arg.Unit f, ""
;;

let mk_no_app_funct f =
  "-no-app-funct", Arg.Unit f, ""
;;

let mk_no_check_prims f =
  "-no-check-prims", Arg.Unit f, ""
;;

let mk_no_float_const_prop f =
  "-no-float-const-prop", Arg.Unit f,
  ""
;;

let mk_noassert f =
  "-noassert", Arg.Unit f, ""
;;

let mk_noautolink_byt f =
  "-noautolink", Arg.Unit f,
  ""
;;

let mk_noautolink_opt f =
  "-noautolink", Arg.Unit f,
  ""
;;

let mk_nodynlink f =
  "-nodynlink", Arg.Unit f,
  ""
;;

let mk_noinit f =
  "-noinit", Arg.Unit f,
  ""

let mk_nolabels f =
  "-nolabels", Arg.Unit f, ""
;;

let mk_noprompt f =
  "-noprompt", Arg.Unit f, ""
;;

let mk_nopromptcont f =
  "-nopromptcont", Arg.Unit f,
  ""
;;

let mk_nostdlib f =
  "-nostdlib", Arg.Unit f,
  ""
;;

let mk_no_unbox_free_vars_of_closures f =
  "-no-unbox-free-vars-of-closures", Arg.Unit f,
  ""
;;

let mk_no_unbox_specialised_args f =
  "-no-unbox-specialised-args", Arg.Unit f,
  ""
;;

let mk_o f =
  "-o", Arg.String f, ""
;;

let mk_open f =
  "-open", Arg.String f, ""

let mk_output_obj f =
  "-output-obj", Arg.Unit f, ""
;;

let mk_output_complete_obj f =
  "-output-complete-obj", Arg.Unit f,
  ""
;;

let mk_pack_byt f =
  "-pack", Arg.Unit f, ""
;;

let mk_pack_opt f =
  "-pack", Arg.Unit f, ""
;;

let mk_pp f =
  "-pp", Arg.String f, ""
;;

let mk_ppx f =
  "-ppx", Arg.String f,
  ""
;;

let mk_principal f =
  "-principal", Arg.Unit f, ""
;;

let mk_no_principal f =
  "-no-principal", Arg.Unit f,
  ""
;;

let mk_rectypes f =
  "-rectypes", Arg.Unit f, ""
;;

let mk_no_rectypes f =
  "-no-rectypes", Arg.Unit f,
  ""
;;

let mk_remove_unused_arguments f =
  "-remove-unused-arguments", Arg.Unit f,
  ""
;;

let mk_runtime_variant f =
  "-runtime-variant", Arg.String f,
  ""
;;

let mk_S f =
  "-S", Arg.Unit f, ""
;;

let mk_safe_string f =
  "-safe-string", Arg.Unit f, ""
;;

let mk_shared f =
  "-shared", Arg.Unit f, ""
;;

let mk_short_paths f =
  "-short-paths", Arg.Unit f, ""
;;

let mk_stdin f =
  "-stdin", Arg.Unit f, ""
;;

let mk_no_strict_sequence f =
  "-no-strict-sequence", Arg.Unit f,
  ""
;;

let mk_strict_sequence f =
  "-strict-sequence", Arg.Unit f,
  ""
;;

let mk_thread f =
  "-thread", Arg.Unit f,
  ""
;;

let mk_dtimings f =
  "-dtimings", Arg.Unit f, ""
;;

let mk_unbox_closures f =
  "-unbox-closures", Arg.Unit f,
  ""
;;

let mk_unbox_closures_factor f =
  "-unbox-closures-factor", Arg.Int f,
  Printf.sprintf "<n > 0>  Scale the size threshold above which \
      unbox-closures will slow down indirect calls rather than duplicating a \
      function (default %d)"
    Clflags.default_unbox_closures_factor
;;

let mk_unsafe f =
  "-unsafe", Arg.Unit f,
  ""
;;

let mk_unsafe_string f =
  "-unsafe-string", Arg.Unit f, ""
;;

let mk_use_runtime f =
  "-use-runtime", Arg.String f,
  ""
;;

let mk_use_runtime_2 f =
  "-use_runtime", Arg.String f,
  ""
;;

let mk_v f =
  "-v", Arg.Unit f,
  ""
;;

let mk_verbose f =
  "-verbose", Arg.Unit f, ""
;;

let mk_version f =
  "-version", Arg.Unit f, ""
;;

let mk__version f =
  "--version", Arg.Unit f, ""
;;

let mk_vmthread f =
  "-vmthread", Arg.Unit f, ""
;;

let mk_vnum f =
  "-vnum", Arg.Unit f, ""
;;

let mk_w f =
  "-w", Arg.String f, ""
;;

let mk_warn_error f =
  "-warn-error", Arg.String f, ""
;;

let mk_warn_help f =
  "-warn-help", Arg.Unit f, ""
;;

let mk_color f =
  "-color", Arg.Symbol (["auto"; "always"; "never"], f), ""
;;

let mk_where f =
  "-where", Arg.Unit f, ""
;;

let mk_nopervasives f =
  "-nopervasives", Arg.Unit f, ""
;;

let mk_use_prims f =
  "-use-prims", Arg.String f, ""
;;

let mk_dparsetree f =
  "-dparsetree", Arg.Unit f, ""
;;

let mk_dtypedtree f =
  "-dtypedtree", Arg.Unit f, "<undocumented>"
;;

let mk_drawlambda f =
  "-drawlambda", Arg.Unit f, ""
;;

let mk_dsource f =
  "-dsource", Arg.Unit f, "<undocumented>"
;;

let mk_dlambda f =
  "-dlambda", Arg.Unit f, ""
;;

let mk_drawclambda f =
  "-drawclambda", Arg.Unit f, ""
;;

let mk_dclambda f =
  "-dclambda", Arg.Unit f, ""
;;

let mk_dflambda f =
  "-dflambda", Arg.Unit f, ""
;;

let mk_drawflambda f =
  "-drawflambda", Arg.Unit f, ""
;;

let mk_dflambda_no_invariants f =
  "-dflambda-no-invariants", Arg.Unit f, " Do not Check Flambda invariants \
      around each pass"
;;

let mk_dflambda_let f =
  "-dflambda-let", Arg.Int f, "<stamp>  Print when the given Flambda [Let] \
      is created"
;;

let mk_dflambda_verbose f =
  "-dflambda-verbose", Arg.Unit f, " Print Flambda terms including around \
      each pass"
;;

let mk_dinstr f =
  "-dinstr", Arg.Unit f, ""
;;

let mk_dcmm f =
  "-dcmm", Arg.Unit f, ""
;;

let mk_dsel f =
  "-dsel", Arg.Unit f, ""
;;

let mk_dcombine f =
  "-dcombine", Arg.Unit f, ""
;;

let mk_dcse f =
  "-dcse", Arg.Unit f, ""
;;

let mk_dlive f =
  "-dlive", Arg.Unit f, ""
;;

let mk_dspill f =
  "-dspill", Arg.Unit f, ""
;;

let mk_dsplit f =
  "-dsplit", Arg.Unit f, ""
;;

let mk_dinterf f =
  "-dinterf", Arg.Unit f, ""
;;

let mk_dprefer f =
  "-dprefer", Arg.Unit f, ""
;;

let mk_dalloc f =
  "-dalloc", Arg.Unit f, ""
;;

let mk_dreload f =
  "-dreload", Arg.Unit f, ""
;;

let mk_dscheduling f =
  "-dscheduling", Arg.Unit f, ""
;;

let mk_dlinear f =
  "-dlinear", Arg.Unit f, ""
;;

let mk_dstartup f =
  "-dstartup", Arg.Unit f, ""
;;

let mk_opaque f =
  "-opaque", Arg.Unit f, ""
;;

let mk_strict_formats f =
  "-strict-formats", Arg.Unit f, ""

let mk_no_strict_formats f =
  "-no-strict-formats", Arg.Unit f, ""
;;

let mk__ f =
  "-", Arg.String f,
  ""
;;

module type Common_options = sig
  val _f : string -> unit
  val _p : string -> unit
  val _absname : unit -> unit
  val _I : string -> unit
  val _labels : unit -> unit
  val _alias_deps : unit -> unit
  val _no_alias_deps : unit -> unit
  val _app_funct : unit -> unit
  val _no_app_funct : unit -> unit
  val _noassert : unit -> unit
  val _nolabels : unit -> unit
  val _nostdlib : unit -> unit
  val _open : string -> unit
  val _ppx : string -> unit
  val _principal : unit -> unit
  val _no_principal : unit -> unit
  val _rectypes : unit -> unit
  val _no_rectypes : unit -> unit
  val _safe_string : unit -> unit
  val _short_paths : unit -> unit
  val _strict_sequence : unit -> unit
  val _no_strict_sequence : unit -> unit
  val _strict_formats : unit -> unit
  val _no_strict_formats : unit -> unit
  val _unsafe : unit -> unit
  val _unsafe_string : unit -> unit
  val _version : unit -> unit
  val _vnum : unit -> unit
  val _w : string -> unit
  val _warn_error : string -> unit
  val _warn_help : unit -> unit

  val _dsource : unit -> unit
  val _dparsetree : unit -> unit
  val _dtypedtree : unit -> unit
  val _drawlambda : unit -> unit
  val _dlambda : unit -> unit

  val anonymous : string -> unit
end

module type Compiler_options = sig
  val _k : int -> unit
  val _a : unit -> unit
  val _annot : unit -> unit
  val _binannot : unit -> unit
  val _c : unit -> unit
  val _cc : string -> unit
  val _cclib : string -> unit
  val _ccopt : string -> unit
  val _config : unit -> unit
  val _for_pack : string -> unit
  val _g : unit -> unit
  val _i : unit -> unit
  val _impl : string -> unit
  val _intf : string -> unit
  val _intf_suffix : string -> unit
  val _keep_docs : unit -> unit
  val _no_keep_docs : unit -> unit
  val _keep_locs : unit -> unit
  val _no_keep_locs : unit -> unit
  val _linkall : unit -> unit
  val _noautolink : unit -> unit
  val _o : string -> unit
  val _opaque :  unit -> unit
  val _output_obj : unit -> unit
  val _output_complete_obj : unit -> unit
  val _pack : unit -> unit
  val _pp : string -> unit
  val _principal : unit -> unit
  val _no_principal : unit -> unit
  val _rectypes : unit -> unit
  val _runtime_variant : string -> unit
  val _safe_string : unit -> unit
  val _short_paths : unit -> unit
  val _thread : unit -> unit
  val _v : unit -> unit
  val _verbose : unit -> unit
  val _where : unit -> unit
  val _color : string -> unit

  val _nopervasives : unit -> unit
  val _dtimings : unit -> unit
end
;;

module type Bytecomp_options = sig
  include Common_options
  include Compiler_options
  val _compat_32 : unit -> unit
  val _custom : unit -> unit
  val _no_check_prims : unit -> unit
  val _dllib : string -> unit
  val _dllpath : string -> unit
  val _make_runtime : unit -> unit
  val _vmthread : unit -> unit
  val _use_runtime : string -> unit

  val _dinstr : unit -> unit

  val _use_prims : string -> unit
end;;

module type Bytetop_options = sig
  include Common_options
  val _init : string -> unit
  val _noinit : unit -> unit
  val _noprompt : unit -> unit
  val _nopromptcont : unit -> unit
  val _stdin : unit -> unit

  val _dinstr : unit -> unit
end;;

module type Optcommon_options = sig
  val _compact : unit -> unit
  val _inline : string -> unit
  val _inline_toplevel : string -> unit
  val _inlining_report : unit -> unit
  val _dump_pass : string -> unit
  val _inline_max_depth : string -> unit
  val _rounds : int -> unit
  val _inline_max_unroll : string -> unit
  val _classic_inlining : unit -> unit
  val _inline_call_cost : string -> unit
  val _inline_alloc_cost : string -> unit
  val _inline_prim_cost : string -> unit
  val _inline_branch_cost : string -> unit
  val _inline_indirect_cost : string -> unit
  val _inline_lifting_benefit : string -> unit
  val _unbox_closures : unit -> unit
  val _unbox_closures_factor : int -> unit
  val _inline_branch_factor : string -> unit
  val _remove_unused_arguments : unit -> unit
  val _no_unbox_free_vars_of_closures : unit -> unit
  val _no_unbox_specialised_args : unit -> unit
  val _o2 : unit -> unit
  val _o3 : unit -> unit

  val _clambda_checks : unit -> unit
  val _dflambda : unit -> unit
  val _drawflambda : unit -> unit
  val _dflambda_no_invariants : unit -> unit
  val _dflambda_let : int -> unit
  val _dflambda_verbose : unit -> unit
  val _drawclambda : unit -> unit
  val _dclambda : unit -> unit
  val _dcmm : unit -> unit
  val _dsel : unit -> unit
  val _dcombine : unit -> unit
  val _dcse : unit -> unit
  val _dlive : unit -> unit
  val _dspill : unit -> unit
  val _dsplit : unit -> unit
  val _dinterf : unit -> unit
  val _dprefer : unit -> unit
  val _dalloc : unit -> unit
  val _dreload : unit -> unit
  val _dscheduling :  unit -> unit
  val _dlinear :  unit -> unit
  val _dstartup :  unit -> unit
end;;

module type Optcomp_options = sig
  include Common_options
  include Compiler_options
  include Optcommon_options
  val _no_float_const_prop : unit -> unit
  val _nodynlink : unit -> unit
  val _pp : string -> unit
  val _S : unit -> unit
  val _shared : unit -> unit
end;;

module type Opttop_options = sig
  include Common_options
  include Optcommon_options
  val _init : string -> unit
  val _noinit : unit -> unit
  val _noprompt : unit -> unit
  val _nopromptcont : unit -> unit
  val _S : unit -> unit
  val _stdin : unit -> unit
end;;

module type Ocamldoc_options = sig
  include Common_options
  val _impl : string -> unit
  val _intf : string -> unit
  val _intf_suffix : string -> unit
  val _pp : string -> unit
  val _principal : unit -> unit
  val _rectypes : unit -> unit
  val _safe_string : unit -> unit
  val _short_paths : unit -> unit
  val _thread : unit -> unit
  val _v : unit -> unit
  val _verbose : unit -> unit
  val _vmthread : unit -> unit
end

module type Arg_list = sig
    val list : (string * Arg.spec * string) list
end;;

module Make_bytecomp_options (F : Bytecomp_options) =
struct
  let list = [
    mk_k F._k;
    mk_f F._f;
    mk_p F._p;
    mk_a F._a;
    mk_absname F._absname;
    mk_annot F._annot;
    mk_binannot F._binannot;
    mk_c F._c;
    mk_cc F._cc;
    mk_cclib F._cclib;
    mk_ccopt F._ccopt;
    mk_color F._color;
    mk_compat_32 F._compat_32;
    mk_config F._config;
    mk_custom F._custom;
    mk_dllib F._dllib;
    mk_dllpath F._dllpath;
    mk_dtypes F._annot;
    mk_for_pack_byt F._for_pack;
    mk_g_byt F._g;
    mk_i F._i;
    mk_I F._I;
    mk_impl F._impl;
    mk_intf F._intf;
    mk_intf_suffix F._intf_suffix;
    mk_intf_suffix_2 F._intf_suffix;
    mk_keep_docs F._keep_docs;
    mk_no_keep_docs F._no_keep_docs;
    mk_keep_locs F._keep_locs;
    mk_no_keep_locs F._no_keep_locs;
    mk_labels F._labels;
    mk_linkall F._linkall;
    mk_make_runtime F._make_runtime;
    mk_make_runtime_2 F._make_runtime;
    mk_modern F._labels;
    mk_alias_deps F._alias_deps;
    mk_no_alias_deps F._no_alias_deps;
    mk_app_funct F._app_funct;
    mk_no_app_funct F._no_app_funct;
    mk_no_check_prims F._no_check_prims;
    mk_noassert F._noassert;
    mk_noautolink_byt F._noautolink;
    mk_nolabels F._nolabels;
    mk_nostdlib F._nostdlib;
    mk_o F._o;
    mk_opaque F._opaque;
    mk_open F._open;
    mk_output_obj F._output_obj;
    mk_output_complete_obj F._output_complete_obj;
    mk_pack_byt F._pack;
    mk_pp F._pp;
    mk_ppx F._ppx;
    mk_principal F._principal;
    mk_no_principal F._no_principal;
    mk_rectypes F._rectypes;
    mk_no_rectypes F._no_rectypes;
    mk_runtime_variant F._runtime_variant;
    mk_safe_string F._safe_string;
    mk_short_paths F._short_paths;
    mk_strict_sequence F._strict_sequence;
    mk_no_strict_sequence F._no_strict_sequence;
    mk_strict_formats F._strict_formats;
    mk_no_strict_formats F._no_strict_formats;
    mk_thread F._thread;
    mk_unsafe F._unsafe;
    mk_unsafe_string F._unsafe_string;
    mk_use_runtime F._use_runtime;
    mk_use_runtime_2 F._use_runtime;
    mk_v F._v;
    mk_verbose F._verbose;
    mk_version F._version;
    mk__version F._version;
    mk_vmthread F._vmthread;
    mk_vnum F._vnum;
    mk_w F._w;
    mk_warn_error F._warn_error;
    mk_warn_help F._warn_help;
    mk_where F._where;
    mk__ F.anonymous;

    mk_nopervasives F._nopervasives;
    mk_use_prims F._use_prims;
    mk_dsource F._dsource;
    mk_dparsetree F._dparsetree;
    mk_dtypedtree F._dtypedtree;
    mk_drawlambda F._drawlambda;
    mk_dlambda F._dlambda;
    mk_dinstr F._dinstr;
    mk_dtimings F._dtimings;
  ]
end;;

module Make_bytetop_options (F : Bytetop_options) =
struct
  let list = [
    mk_absname F._absname;
    mk_I F._I;
    mk_init F._init;
    mk_labels F._labels;
    mk_alias_deps F._alias_deps;
    mk_no_alias_deps F._no_alias_deps;
    mk_app_funct F._app_funct;
    mk_no_app_funct F._no_app_funct;
    mk_noassert F._noassert;
    mk_noinit F._noinit;
    mk_nolabels F._nolabels;
    mk_noprompt F._noprompt;
    mk_nopromptcont F._nopromptcont;
    mk_nostdlib F._nostdlib;
    mk_open F._open;
    mk_ppx F._ppx;
    mk_principal F._principal;
    mk_no_principal F._no_principal;
    mk_rectypes F._rectypes;
    mk_no_rectypes F._no_rectypes;
    mk_safe_string F._safe_string;
    mk_short_paths F._short_paths;
    mk_stdin F._stdin;
    mk_strict_sequence F._strict_sequence;
    mk_no_strict_sequence F._no_strict_sequence;
    mk_strict_formats F._strict_formats;
    mk_no_strict_formats F._no_strict_formats;
    mk_unsafe F._unsafe;
    mk_unsafe_string F._unsafe_string;
    mk_version F._version;
    mk__version F._version;
    mk_vnum F._vnum;
    mk_w F._w;
    mk_warn_error F._warn_error;
    mk_warn_help F._warn_help;
    mk__ F.anonymous;

    mk_dsource F._dsource;
    mk_dparsetree F._dparsetree;
    mk_dtypedtree F._dtypedtree;
    mk_drawlambda F._drawlambda;
    mk_dlambda F._dlambda;
    mk_dinstr F._dinstr;
  ]
end;;

module Make_optcomp_options (F : Optcomp_options) =
struct
  let list = [
    mk_k F._k;
    mk_f F._f;
    mk_p F._p;
    mk_a F._a;
    mk_absname F._absname;
    mk_annot F._annot;
    mk_binannot F._binannot;
    mk_inline_branch_factor F._inline_branch_factor;
    mk_c F._c;
    mk_cc F._cc;
    mk_cclib F._cclib;
    mk_ccopt F._ccopt;
    mk_clambda_checks F._clambda_checks;
    mk_classic_inlining F._classic_inlining;
    mk_color F._color;
    mk_compact F._compact;
    mk_config F._config;
    mk_dtypes F._annot;
    mk_for_pack_opt F._for_pack;
    mk_g_opt F._g;
    mk_i F._i;
    mk_I F._I;
    mk_impl F._impl;
    mk_inline F._inline;
    mk_inline_toplevel F._inline_toplevel;
    mk_inline_alloc_cost F._inline_alloc_cost;
    mk_inline_branch_cost F._inline_branch_cost;
    mk_inline_call_cost F._inline_call_cost;
    mk_inline_prim_cost F._inline_prim_cost;
    mk_inline_indirect_cost F._inline_indirect_cost;
    mk_inline_lifting_benefit F._inline_lifting_benefit;
    mk_inlining_report F._inlining_report;
    mk_intf F._intf;
    mk_intf_suffix F._intf_suffix;
    mk_keep_docs F._keep_docs;
    mk_no_keep_docs F._no_keep_docs;
    mk_keep_locs F._keep_locs;
    mk_no_keep_locs F._no_keep_locs;
    mk_labels F._labels;
    mk_linkall F._linkall;
    mk_inline_max_depth F._inline_max_depth;
    mk_alias_deps F._alias_deps;
    mk_no_alias_deps F._no_alias_deps;
    mk_app_funct F._app_funct;
    mk_no_app_funct F._no_app_funct;
    mk_no_float_const_prop F._no_float_const_prop;
    mk_noassert F._noassert;
    mk_noautolink_opt F._noautolink;
    mk_nodynlink F._nodynlink;
    mk_nolabels F._nolabels;
    mk_nostdlib F._nostdlib;
    mk_no_unbox_free_vars_of_closures F._no_unbox_free_vars_of_closures;
    mk_no_unbox_specialised_args F._no_unbox_specialised_args;
    mk_o F._o;
    mk_o2 F._o2;
    mk_o3 F._o3;
    mk_opaque F._opaque;
    mk_open F._open;
    mk_output_obj F._output_obj;
    mk_output_complete_obj F._output_complete_obj;
    mk_p F._p;
    mk_pack_opt F._pack;
    mk_pp F._pp;
    mk_ppx F._ppx;
    mk_principal F._principal;
    mk_no_principal F._no_principal;
    mk_rectypes F._rectypes;
    mk_no_rectypes F._no_rectypes;
    mk_remove_unused_arguments F._remove_unused_arguments;
    mk_rounds F._rounds;
    mk_runtime_variant F._runtime_variant;
    mk_S F._S;
    mk_safe_string F._safe_string;
    mk_shared F._shared;
    mk_short_paths F._short_paths;
    mk_strict_sequence F._strict_sequence;
    mk_no_strict_sequence F._no_strict_sequence;
    mk_strict_formats F._strict_formats;
    mk_no_strict_formats F._no_strict_formats;
    mk_thread F._thread;
    mk_unbox_closures F._unbox_closures;
    mk_unbox_closures_factor F._unbox_closures_factor;
    mk_inline_max_unroll F._inline_max_unroll;
    mk_unsafe F._unsafe;
    mk_unsafe_string F._unsafe_string;
    mk_v F._v;
    mk_verbose F._verbose;
    mk_version F._version;
    mk__version F._version;
    mk_vnum F._vnum;
    mk_w F._w;
    mk_warn_error F._warn_error;
    mk_warn_help F._warn_help;
    mk_where F._where;
    mk__ F.anonymous;

    mk_nopervasives F._nopervasives;
    mk_dsource F._dsource;
    mk_dparsetree F._dparsetree;
    mk_dtypedtree F._dtypedtree;
    mk_drawlambda F._drawlambda;
    mk_dlambda F._dlambda;
    mk_drawclambda F._drawclambda;
    mk_dclambda F._dclambda;
    mk_dflambda F._dflambda;
    mk_drawflambda F._drawflambda;
    mk_dflambda_no_invariants F._dflambda_no_invariants;
    mk_dflambda_let F._dflambda_let;
    mk_dflambda_verbose F._dflambda_verbose;
    mk_dcmm F._dcmm;
    mk_dsel F._dsel;
    mk_dcombine F._dcombine;
    mk_dcse F._dcse;
    mk_dlive F._dlive;
    mk_dspill F._dspill;
    mk_dsplit F._dsplit;
    mk_dinterf F._dinterf;
    mk_dprefer F._dprefer;
    mk_dalloc F._dalloc;
    mk_dreload F._dreload;
    mk_dscheduling F._dscheduling;
    mk_dlinear F._dlinear;
    mk_dstartup F._dstartup;
    mk_dtimings F._dtimings;
    mk_dump_pass F._dump_pass;
  ]
end;;

module Make_opttop_options (F : Opttop_options) = struct
  let list = [
    mk_absname F._absname;
    mk_compact F._compact;
    mk_I F._I;
    mk_init F._init;
    mk_inline F._inline;
    mk_inline_toplevel F._inline_toplevel;
    mk_inlining_report F._inlining_report;
    mk_rounds F._rounds;
    mk_inline_max_unroll F._inline_max_unroll;
    mk_classic_inlining F._classic_inlining;
    mk_inline_call_cost F._inline_call_cost;
    mk_inline_alloc_cost F._inline_alloc_cost;
    mk_inline_prim_cost F._inline_prim_cost;
    mk_inline_branch_cost F._inline_branch_cost;
    mk_inline_indirect_cost F._inline_indirect_cost;
    mk_inline_lifting_benefit F._inline_lifting_benefit;
    mk_inline_branch_factor F._inline_branch_factor;
    mk_labels F._labels;
    mk_alias_deps F._alias_deps;
    mk_no_alias_deps F._no_alias_deps;
    mk_app_funct F._app_funct;
    mk_no_app_funct F._no_app_funct;
    mk_noassert F._noassert;
    mk_noinit F._noinit;
    mk_nolabels F._nolabels;
    mk_noprompt F._noprompt;
    mk_nopromptcont F._nopromptcont;
    mk_nostdlib F._nostdlib;
    mk_no_unbox_free_vars_of_closures F._no_unbox_free_vars_of_closures;
    mk_no_unbox_specialised_args F._no_unbox_specialised_args;
    mk_o2 F._o2;
    mk_o3 F._o3;
    mk_open F._open;
    mk_ppx F._ppx;
    mk_principal F._principal;
    mk_no_principal F._no_principal;
    mk_rectypes F._rectypes;
    mk_no_rectypes F._no_rectypes;
    mk_remove_unused_arguments F._remove_unused_arguments;
    mk_S F._S;
    mk_safe_string F._safe_string;
    mk_short_paths F._short_paths;
    mk_stdin F._stdin;
    mk_strict_sequence F._strict_sequence;
    mk_no_strict_sequence F._no_strict_sequence;
    mk_strict_formats F._strict_formats;
    mk_no_strict_formats F._no_strict_formats;
    mk_unbox_closures F._unbox_closures;
    mk_unbox_closures_factor F._unbox_closures_factor;
    mk_unsafe F._unsafe;
    mk_unsafe_string F._unsafe_string;
    mk_version F._version;
    mk__version F._version;
    mk_vnum F._vnum;
    mk_w F._w;
    mk_warn_error F._warn_error;
    mk_warn_help F._warn_help;
    mk__ F.anonymous;

    mk_dsource F._dsource;
    mk_dparsetree F._dparsetree;
    mk_dtypedtree F._dtypedtree;
    mk_drawlambda F._drawlambda;
    mk_drawclambda F._drawclambda;
    mk_dclambda F._dclambda;
    mk_drawflambda F._drawflambda;
    mk_dflambda F._dflambda;
    mk_dcmm F._dcmm;
    mk_dsel F._dsel;
    mk_dcombine F._dcombine;
    mk_dcse F._dcse;
    mk_dlive F._dlive;
    mk_dspill F._dspill;
    mk_dsplit F._dsplit;
    mk_dinterf F._dinterf;
    mk_dprefer F._dprefer;
    mk_dalloc F._dalloc;
    mk_dreload F._dreload;
    mk_dscheduling F._dscheduling;
    mk_dlinear F._dlinear;
    mk_dstartup F._dstartup;
    mk_dump_pass F._dump_pass;
  ]
end;;

module Make_ocamldoc_options (F : Ocamldoc_options) =
struct
  let list = [
    mk_absname F._absname;
    mk_I F._I;
    mk_impl F._impl;
    mk_intf F._intf;
    mk_intf_suffix F._intf_suffix;
    mk_intf_suffix_2 F._intf_suffix;
    mk_labels F._labels;
    mk_modern F._labels;
    mk_alias_deps F._alias_deps;
    mk_no_alias_deps F._no_alias_deps;
    mk_app_funct F._app_funct;
    mk_no_app_funct F._no_app_funct;
    mk_noassert F._noassert;
    mk_nolabels F._nolabels;
    mk_nostdlib F._nostdlib;
    mk_open F._open;
    mk_pp F._pp;
    mk_ppx F._ppx;
    mk_principal F._principal;
    mk_no_principal F._no_principal;
    mk_rectypes F._rectypes;
    mk_no_rectypes F._no_rectypes;
    mk_safe_string F._safe_string;
    mk_short_paths F._short_paths;
    mk_strict_sequence F._strict_sequence;
    mk_no_strict_sequence F._no_strict_sequence;
    mk_strict_formats F._strict_formats;
    mk_no_strict_formats F._no_strict_formats;
    mk_thread F._thread;
    mk_unsafe_string F._unsafe_string;
    mk_v F._v;
    mk_verbose F._verbose;
    mk_version F._version;
    mk__version F._version;
    mk_vmthread F._vmthread;
    mk_vnum F._vnum;
    mk_w F._w;
    mk__ F.anonymous;
  ]
end;;

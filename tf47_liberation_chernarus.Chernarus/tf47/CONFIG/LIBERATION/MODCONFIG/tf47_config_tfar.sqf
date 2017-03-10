params [["_entryToGet",""]];

if(_entryToGet isEqualTo "")exitWith {[]};
if !(isClass (configFile >> "cfgPatches" >> "cba_main") )exitWith{[]};

private _return = switch tolower _entryToGet do {
  case("lv"):{[]};
  case("hv"):{[]};
  case("av"):{[]};
  case("sv"):{[]};
  case("st"):{[]};
  case("w"):{[]};
  case("m"):{[]};
  case("i"):{[]};
  case("b"):{
    [
      "tf_rt1523g_big_bwmod",
      "tf_rt1523g",
      "tf_rt1523g_big",
      "tf_rt1523g_black",
      "tf_rt1523g_fabric",
      "tf_rt1523g_green",
      "tf_rt1523g_rhs",
      "tf_rt1523g_sage",
      "tf_rt1523g_bwmod"
    ]
  };
  default{[]};
};
_return

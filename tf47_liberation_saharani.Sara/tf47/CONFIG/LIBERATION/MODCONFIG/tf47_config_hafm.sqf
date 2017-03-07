params [["_entryToGet",""]];

if(_entryToGet isEqualTo "")exitWith {[]};
if !(isClass (configFile >> "cfgPatches" >> "cba_main") )exitWith{[]};

private _return = switch tolower _entryToGet do {
  case("lv"):{[]};
  case("hv"):{[]};
  case("av"):{
    [
      ["NH90",0,0,5],
      ["NH90Armed",0,50,5],
      ["NH90Marine",0,0,5],
      ["EC635_BW",0,20,5],
      ["EC635_AT_BW",0,50,5],
      ["EC635_Unarmed_BW",0,50,5],
    ]
  };
  case("sv"):{[]};
  case("st"):{[]};
  case("w"):{[]};
  case("m"):{[]};
  case("i"):{[]};
  case("b"):{[]};
  default{[]};
};
_return

params [["_entryToGet",""],["_patch",""]];

if(_patch isEqualTo "")exitWith {[]};
if(	!(isclass (configfile >> "CfgPatches" >> _patch)	)	)exitWith{[]};

private _return = switch tolower _entryToGet do {
  case("lv"):{[]};
  case("hv"):{[]};
  case("av"):{[]};
  case("sv"):{[]};
  case("st"):{[]};
  case("w"):{[]};
  case("m"):{[]};
  case("i"):{[]};
  case("b"):{[]};
  default{[]};
};
_return

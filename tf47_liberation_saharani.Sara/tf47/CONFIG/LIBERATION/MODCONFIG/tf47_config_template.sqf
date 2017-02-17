params [["_entryToGet",""],["_patch",""]];

if(_patch isEqualTo "")exitWith {[]};
if !(	_patch isEqualTo "cba_main")exitWith{[]};

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

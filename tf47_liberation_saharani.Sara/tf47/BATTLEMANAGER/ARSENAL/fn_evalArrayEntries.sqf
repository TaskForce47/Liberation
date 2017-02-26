params ["_entry","_checkArray"];

_entry params [
  ["_stringA", "", [""] ],
  ["_array", [], [[]] ],
  ["_stringB", "", [""] ]
];

private _isWeapon = count _entry > 2;

if !(_stringA isEqualTo "")then{
  _stringA = if !(_stringA in _checkArray)then{ "" }else{ _stringA };
};

if !(_stringA isEqualTo "")then{
  {
    private _entity = _x;
    _entity = if !(_entity in _checkArray)then{ "" }else{ _entity };
    _array set [_forEachIndex, _entity];
  }forEach _array;
}else{
  _array = if( _isWeapon )then{
     ["","","",""];
  }else{
    []
  };
};
if !(_stringB isEqualTo "")then{
  _stringB = if !(_stringB in _checkArray)then{ "" }else{ _stringB };
};

if (_isWeapon) then{
  _entry = [_stringA,_array,_stringB];
}else{
  _entry = [_stringA,_array];
};

_entry

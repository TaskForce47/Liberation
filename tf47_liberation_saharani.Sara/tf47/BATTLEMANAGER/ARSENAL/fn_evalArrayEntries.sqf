/*

	author: TF47  mindbl4ster

	description:
		remove any item not whitelisted

	parameter:
    0: ARRAY - ["",["","","",""],""]
    1: ARRAY (Optional)

	return
		0: ARRAY

	example
		[_thing,_checklist] call tf47_arsenal_fnc_evalArrayEntries;

*/
#include "tf47_macros.hpp"
params [
  ["_entry", [] ],
  ["_checkArray", [] ]
];

{
  private _subentry = _x;
  if(_subentry isEqualType "")then{
    EVAL(_subentry,_checkArray);
    _entry set [_forEachIndex,_subentry];
  }else{
    _subentry = [_subentry, _checkArray] call tf47_arsenal_fnc_evalArrayEntries;
    _entry set [_forEachIndex,_subentry];
  };
}forEach _entry;

_entry

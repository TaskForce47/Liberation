#include "tf47_macros.hpp"
#define GEARTREE (	(findDisplay 306031) displayCtrl 306033	)
private _selectedItem = tvCurSel GEARTREE;
strace_2("TVSEL:", _selectedItem);
private _gearName = GEARTREE tvText _selectedItem; //<----- does not return expected value ?! (actually NO value at all)
strace_2("TVGEAR:", _gearname);
private _vArsenalList = profileNamespace getVariable [ "bis_fnc_saveInventory_data", [] ];
{
  if(_x isEqualType "")then{
    if(_x isEqualto _gearName)exitWith{
      strace_2("TVIND:", _forEachIndex);
      [_forEachIndex] call tf47_arsenal_fnc_setGearFromUI;
    };
  };
}forEach _vArsenalList;
true

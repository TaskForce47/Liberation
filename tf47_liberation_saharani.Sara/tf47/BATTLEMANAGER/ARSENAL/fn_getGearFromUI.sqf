#define GEARTREE (	(findDisplay 306031) displayCtrl 306033	)
private _selectedItem = tvCurSel 306033;
private _gearName = (	(findDisplay 306031) displayCtrl 306033	) tvData _selectedItem;
systemchat format ["Selected: %1",_gearname];
private _vArsenalList = profileNamespace getVariable [ "bis_fnc_saveInventory_data", [] ];
{
  if(_x isEqualType "")then{
    if(_x isEqualto _gearName)exitWith{
      systemchat format ["Gear found at: %1",_forEachIndex];
      [_forEachIndex] call tf47_arsenal_fnc_setGearFromArray;
    };
  };
}forEach _vArsenalList;

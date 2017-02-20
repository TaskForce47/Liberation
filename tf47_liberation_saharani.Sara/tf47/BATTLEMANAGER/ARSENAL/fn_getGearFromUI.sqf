#define GEARTREE (	(findDisplay 306031) displayCtrl 306033	)
private _selectedItem = tvCurSel GEARTREE;
private _gearName = GEARTREE tvData _selectedItem;
private _vArsenalList = profileNamespace getVariable [ "bis_fnc_saveInventory_data", [] ];
{
  if(_x isEqualType "")then{
    if(_x isEqualto _gearName)exitWith{
      private _gear = _vArsenalList select (_forEachIndex +1);
      [_gear] call tf47_arsenal_fnc_setGearFromArray;
    };
  };
}forEach _vArsenalList;

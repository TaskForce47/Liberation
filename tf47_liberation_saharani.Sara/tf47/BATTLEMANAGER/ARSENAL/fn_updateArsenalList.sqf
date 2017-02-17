//https://community.bistudio.com/wiki/Tree_View_Path
// (	(findDisplay 306031) displayCtrl 306033	)
#define GEARTREE (	(findDisplay 306031) displayCtrl 306033	)
tvClear GEARTREE; //does that actually work ?!

private _customPlayerGear = profileNamespace getVariable [ "bis_fnc_saveInventory_data", [] ];
private _customCategories = profileNamespace getVariable [ "tf47_arsenal_customCategories", [ ["default",""] ] ];
private _tvEntries = [];

//add main entries to tree view

{
    _x params ["_category"];
    private _id = GEARTREE tvAdd [ [], _category];
    _tvEntries pushBack [_category,_id];
    false
}count _customCategories;

//check arsenal loadouts and see if loadout was allready categorized
/*
{
  if ( _x isEqualType "" ) then {
    private _toLookFor = _x;
    private _category = "default";
    {
      _x params ["_subcategory", "_loadout"];
      if (_toLookFor isEqualTo _loadout) exitWith {_category = _subcategory};
    }forEach _customCategories;







  };
  false
}count _customPlayerGear;
*/
{
  if ( _x isEqualType "" ) then {
    GEARTREE tvAdd [ [0], _x];
  };
}forEach _customPlayerGear;

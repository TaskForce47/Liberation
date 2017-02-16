//https://community.bistudio.com/wiki/Tree_View_Path
private _customPlayerGear = profileNamespace getVariable [ "bis_fnc_saveInventory_data", [] ];
private _customCategories = profileNamespace getVariable [ "tf47_arsenal_customCategories", [ ["default",""] ] ];
{
  if(_x isEqualType "")then{
    private _toLookFor = _x;
    private _category = "default";
    {
      _x params ["_subcategory", "_loadout"];
      if _toLookFor isEqualTo _loadout exitWith {_category = _subcategory};
    }forEach _customCategories;
  };
  false
}count _customPlayerGear;

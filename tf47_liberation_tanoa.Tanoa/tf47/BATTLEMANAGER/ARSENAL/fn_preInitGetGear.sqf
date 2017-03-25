#include "tf47_macros.hpp"

private _vArsenalList = profileNamespace getVariable [ "bis_fnc_saveInventory_data", [] ];
private _filteredPlayerGear = [];
private _checkArray = [];

private _cargo = player getvariable ["bis_addVirtualWeaponCargo_cargo",[]];
{
  private _item = _x;
  {
    _checkArray pushBack (toLower _x);
    STRACE_1(_x);
  }forEach _item;
}forEach _cargo;

{
  if (_x isEqualType [] )then{

    _x params [  ["_vaGear", [], [[]] ]  ];
    _vaGear params [
      ["_uniFormA",   [], [[]] ],
      ["_vestA",      [], [[]] ],
      ["_backpackA",  [], [[]] ],
      ["_head",     ""],
      ["_goggles",  ""],
      ["_binoc",    ""],
      ["_primA",      [], [[]] ],
      ["_secA",       [], [[]] ],
      ["_launcherA",  [], [[]] ],
      ["_itemsA",     [], [[]] ]
    ];

    /*  uniform */
    _uniformA = [_uniformA,_checkArray] call tf47_arsenal_fnc_evalArrayEntries;

    /*  vest  */
    _vestA = [_vestA,_checkArray] call tf47_arsenal_fnc_evalArrayEntries;

    /*  backpack  */
    _backpackA = [_backpackA,_checkArray] call tf47_arsenal_fnc_evalArrayEntries;

    /*  other  */
    if !(_head isEqualTo "")then { _head = EVAL(_head ,_checkArray) };
    if !(_goggles isEqualTo "")then{_goggles= EVAL(_goggles,_checkArray) };
    if !(_binoc isEqualTo "")then{ _binoc = EVAL(_binoc,_checkArray) };

    _primA = [_primA,_checkArray] call tf47_arsenal_fnc_evalArrayEntries;

    _secA = [_secA,_checkArray] call tf47_arsenal_fnc_evalArrayEntries;

    _launcherA = [_launcherA,_checkArray] call tf47_arsenal_fnc_evalArrayEntries;

    {
      _x = EVAL(_x,_checkArray);
      _itemsA set [_forEachIndex, _x];
    }forEach _itemsA;

    _vaGear = [_uniFormA,_vestA,_backpackA,_head,_goggles,_binoc,_primA,_secA,_launcherA,_itemsA];
    _x set [_forEachIndex, _vaGear];
  };
}forEach _vArsenalList;

profileNameSpace setVariable ["tf47_arsenal_filteredGear",_vArsenalList];
saveProfileNamespace;

#define ISSTRING(ARG) ( ARG isEqualType "" )
#define ISARRAY(ARG) ( ARG isEqualType [] )
#define EVAL(ARG,LIST) ARG = if !(ARG in LIST)then{ "" }else{ ARG }

private _vArsenalList = profileNamespace getVariable [ "bis_fnc_saveInventory_data", [] ];
private _filteredPlayerGear = [];
private _checkArray = [];

private _cargo = player getvariable ["bis_addVirtualWeaponCargo_cargo",[]];
{
  private _item = _x;
  {
    _checkArray pushBack _x;
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
    if !(_head isEqualTo "")then { EVAL(_head,_checkArray) };
    if !(_goggles isEqualTo "")then{ EVAL(_goggles,_checkArray) };
    if !(_binoc isEqualTo "")then{ EVAL(_binoc,_checkArray) };

    _primA = [_primA,_checkArray] call tf47_arsenal_fnc_evalArrayEntries;

    _secA = [_secA,_checkArray] call tf47_arsenal_fnc_evalArrayEntries;

    _launcherA = [_launcherA,_checkArray] call tf47_arsenal_fnc_evalArrayEntries;

    {
      EVAL(_x,_checkArray);
      _itemsA set [_forEachIndex, _x];
    }forEach _itemsA;

    _vaGear = [_uniFormA,_vestA,_backpackA,_head,_goggles,_binoc,_primA,_secA,_launcherA,_itemsA];
    _x set [_forEachIndex, _vaGear];
  }forEach _vArsenalList;
};
profileNameSpace setVariable ["tf47_arsenal_filteredGear",_vArsenalList];
saveProfileNamespace;

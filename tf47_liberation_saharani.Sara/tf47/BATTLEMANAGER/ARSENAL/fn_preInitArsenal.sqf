/*
 * Author: mindbl4ster
 * check wether va arsenal loadouts have items not used or are prohibited
 *
 * Arguments:
 * nothing
 *
 * Return Value:
 * nothing
 *
 * Example:
 *  [] call tf47_arsenal_fnc_preInitArsenal;
 *
 * Public: yes
*/
#define ISSTRING(ARG) ( ARG isEqualType "" )
#define ISARRAY(ARG) ( ARG isEqualType [] )
#define EVAL(ARG,LIST) ARG = if !(ARG in LIST)then{ "" }else{ ARG }

private _pathToConfigs = "tf47\config\liberation\modconfig\";
tf47_arsenal_modconfig_rhs_usaf = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_rhs_usaf.sqf");
tf47_arsenal_modconfig_s4 = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_s4Gear.sqf");
tf47_arsenal_modconfig_milGear = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_milGear.sqf");
tf47_arsenal_modconfig_niarms = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_niarms.sqf");
tf47_arsenal_modconfig_bwa3 = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_bwa3.sqf");
tf47_arsenal_modconfig_3cb = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_3cb_baf.sqf");
tf47_arsenal_modconfig_ace3 = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_ace3.sqf");

private _modListToUse =[];
{
  if !(isNil _x) then {_modListToUse pushBack _x; };
} forEach [
  "tf47_arsenal_modconfig_rhs_usaf",
  "tf47_arsenal_modconfig_s4",
  "tf47_arsenal_modconfig_milGear",
  "tf47_arsenal_modconfig_niarms",
  "tf47_arsenal_modconfig_bwa3",
  //"tf47_arsenal_modconfig_3cb",
  "tf47_arsenal_modconfig_ace3"
];

private _weapons = [];
private _magazines = [];
{
  {
    if( isClass (configFile >> "cfgWeapons" >> _x) ) then {
      _weapons pushBack _x;
      private _mags = getArray (configfile >> "cfgweapons" >> _x >> "magazines" );
      { if !( _x in _magazines )then{ _magazines pushBack _x; }; }forEach _mags;
    };
  }forEach ( ["w"] call (call compile _x) );
}forEach _modListToUse;

private _items = [];
{
  {
    if( isClass (configFile >> "cfgWeapons" >> _x) ) then {
      _items pushBack _x;
    };
    false
  }count ( ["i"] call (call compile _x) );
  false
}count _modListToUse;

private _backpacks = [];
{
  {
    if( isClass (configFile >> "CfgVehicles" >> _x) ) then {
      _backpacks pushBack _x;
    };
    false
  }count ( ["b"] call (call compile _x) );
  false
}count _modListToUse;

private _cargo = [_items,_weapons,_magazines,_backpacks];
player setvariable ["bis_addVirtualWeaponCargo_cargo",_cargo];

//*************************************************************************************************************************//
//*************************************************************************************************************************//
// does not work as intended .......
/*
[
  "TF47_GER_"TF47_Z",
  [
    ["Gen3_aor1",[]],
    ["cpc_communications_coy",[]],
    ["fatpack_coy",[]],
    "",
    "",
    "Binocular",
    ["",["","","",""],""],
    ["",["","","",""],""],
    ["",["","","",""],""],
    ["ItemMap","ItemCompass","tf_microdagr","tf_anprc148jem_1","ItemGPS"],
    ["AfricanHead_03","ACE_NoVoice",""]
  ]
]
*/
private _vArsenalList = profileNamespace getVariable [ "bis_fnc_saveInventory_data", [] ];
private _filteredPlayerGear = [];
private _checkArray = _items + _weapons + _magazines + _backpacks;

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

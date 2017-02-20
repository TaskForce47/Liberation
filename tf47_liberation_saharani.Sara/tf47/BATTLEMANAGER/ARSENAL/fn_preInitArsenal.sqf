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
/*

['Open',[nil,player,player]] spawn BIS_fnc_arsenal;
*/
private _pathToConfigs = "tf47\config\liberation\modconfig\";
tf47_arsenal_modconfig_rhs_usaf = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_rhs_usaf.sqf");
tf47_arsenal_modconfig_s4 = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_s4Gear.sqf");
tf47_arsenal_modconfig_milGear = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_milGear.sqf");
tf47_arsenal_modconfig_niarms = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_niarms.sqf");
tf47_arsenal_modconfig_bwa3 = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_bwa3.sqf");
tf47_arsenal_modconfig_3cb = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_3cb_baf.sqf");

private _modListToUse =[];
{
  if !(isNil _x) then {_modListToUse pushBack _x; };
} forEach [
  "call tf47_arsenal_modconfig_rhs_usaf",
  "call tf47_arsenal_modconfig_s4",
  "call tf47_arsenal_modconfig_milGear",
  "call tf47_arsenal_modconfig_niarms",
  "call tf47_arsenal_modconfig_bwa3",
  "call tf47_arsenal_modconfig_3cb"
];

private _weapons = [];
private _magazines = [];
{
  {
    diag_log _x;
    if( isClass (configFile >> "cfgWeapons" >> _x) ) then {
      _weapons pushBack _x;
      diag_log _x;
      private _mags = getArray (configfile >> "cfgweapons" >> _x >> "magazines" );
      { if !( _x in _magazines )then{ _magazines pushBack _x; }; }forEach _mags;
    };
    false
  }count ( ["w"] call (compile _x) );
}forEach _modListToUse;

private _items = [];
{
  {
    if( isClass (configFile >> "cfgWeapons" >> _x) ) then {
      _items pushBack _x;
    };
    false
  }count ( ["i"] call (compile _x) );
  false
}count _modListToUse;

private _backpacks = [];
{
  {
    if( isClass (configFile >> "cfgWeapons" >> _x) ) then {
      _items pushBack _x;
    };
    false
  }count ( ["b"] call (compile _x) );
  false
}count _modListToUse;

private _cargo = [_items,_weapons,_magazines,_backpacks];
player setvariable ["bis_addVirtualWeaponCargo_cargo",_cargo];

//*************************************************************************************************************************//
//*************************************************************************************************************************//
/*
private _vArsenalList = profileNamespace getVariable [ "bis_fnc_saveInventory_data", [] ];
private _filteredPlayerGear = [];
private _checkArray = _items + _weapons + _magazines + _backpacks;

private _max = (count _vArsenalList)-1;
if(_max > 0 )then{

  for "_i" from 1 to _max step 2 do {
    private _vArsenalEntry = _vArsenalList select _i;
    for "_o" from 0 to 9 do {
      //check subentires for blacklisted items
      private _subEntry = _vArsenalEntry  select _o;
      if (_subEntry isEqualType "") then {
        if !(_subEntry in _checkArray)then{ _vArsenalEntry set [_o,""] };
      }else{
        if( _subEntry isEqualType [] )then{
        for "_p" from 0 to ( (count _subEntry) - 1) do {
          private _subsubEntry = _subEntry select _p;
        };
      };
    };
  };
};
/*
"TF47_GER_G3_BASE",
[
	["BWA3_Uniform2_Fleck",
    ["ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_EarPlugs","ACE_Flashlight_MX991","ACE_MapTools","ACE_morphine","ACE_morphine","ACE_morphine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_personalAidKit","ACE_tourniquet","ACE_tourniquet"]],
	[
    "BWA3_Vest_Rifleman1_Fleck",
    ["BWA3_DM51A1"]
  ],
	["tf_rt1523g_bwmod",
    ["rhsusf_ANPVS_15","BWA3_MICH_Fleck"]
  ],
	"BWA3_Booniehat_Fleck",
	"UK3CB_BAF_G_Tactical_Black",
	"Binocular",
	["hlc_rifle_g3sg1",["","","",""],"hlc_20rnd_762x51_b_G3"],
	["",["","","",""],""],
	["",["","","",""],""],
	["ItemMap","ItemCompass","ACE_Altimeter","ItemGPS"],
	["AfricanHead_03","ACE_NoVoice",""]
]
*/

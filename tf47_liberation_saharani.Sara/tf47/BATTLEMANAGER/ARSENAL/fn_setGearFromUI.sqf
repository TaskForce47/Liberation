/*
[
	["BWA3_Uniform2_Fleck",
    ["ACE_fieldDressing"]
  ],
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
params [ ["_index",-1, [0] ] ];

if(_index < 0)exitWith{};
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

private _entry = (profileNameSpace getVariable ["tf47_arsenal_filteredGear", [] ]) select _index;
_entry params ["_uniFormA","_vestA","_backpackA","_head","_goggles","_binoc","_primA","_secA","_launcherA","_itemsA"];

_uniformA params ["_uniform","_itemsInUniform"];
if !(_uniform isEqualTo "")then{
  player adduniForm _uniform;
  {
    if !(_x isEqualTo "")then{player addItemToUniform _x;};
  }forEach _itemsInUniform;
};

_vestA params ["_vest","_itemsInVest"];
if !(_vest isEqualTo "")then{
  player addVest _vest;
  {
    if !(_x isEqualTo "")then{player addItemToVest _x;};
  }forEach _itemsInVest;
};

_backpackA params ["_backPack","_itemsInBackpack"];
if !(_backpackA isEqualTo "")then{
  player addBackpack _backPack;
  {
    if !(_x isEqualTo "")then{player addItemToBackpack _x;};
  }forEach _itemsInBackpack;
};

if !(_head isEqualTo "")then { player addHeadgear _head};
if !(_goggles isEqualTo "")then{player addgoggles _goggles};
if !(_binoc isEqualTo "")then{player addWeapon _binoc};

_primA params ["_prim","_primAttachments","_primMag"];
if !(_prim isEqualTo "")then{
  if !(_primMag isEqualTo "")then{  player addmagazine _primMag; };
  player addWeapon _prim;
  {
    if !(_x isEqualTo "")then{ player addPrimaryWeaponItem _x;};
  }forEach _primAttachments;
};

_secA params ["_sec","_secAttachments","_secMag"];
if !(_sec isEqualTo "")then{
  if !(_secMag isEqualTo "")then{  player addmagazine _secMag; };
  player addWeapon _sec;
  {
    if !(_x isEqualTo "")then{ player addHandgunItem  _x;};
  }forEach _secAttachments;
};

_launcherA params ["_launcher","_launcherAttach","_launcherMag"];
if !(_launcher isEqualTo "")then{
  if !(_launcherMag isEqualTo "")then{  player addmagazine _launcherMag; };
  player addWeapon _launcher;
  {
    if !(_x isEqualTo "")then{ player addSecondaryWeaponItem _x;};
  }forEach _launcherAttach;
};

{
  if !(_x isEqualTo "") then { player linkItem _x};
}forEach _itemsA;

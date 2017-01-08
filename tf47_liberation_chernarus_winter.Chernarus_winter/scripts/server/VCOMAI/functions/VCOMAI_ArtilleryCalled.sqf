
//Hint "LAUNCH!";
//AI will use artillery/mortars when possible. This script makes artillery AI fire at a certain position
//First hash 6/14/2014
//SYSTEmchat "CALLED ARTY!";
_Unit = _this select 0;
_Enemy = _this select 1;

{
	if (isNull _x) then {ArtilleryArray = ArtilleryArray - [_x];};
} foreach ArtilleryArray;

//Hint format ["%1",ArtilleryArray];

_Indsupport = [];
_Bluforsupport = [];
_Opforsupport = [];
_Chosen = [];
_ArtilleryUnits = [];

if (side _Unit isEqualTo TF47_helper_opposingFaction) then 
{
	{
		if (side _x isEqualTo TF47_helper_opposingFaction) then {_Bluforsupport = _Bluforsupport + [(vehicle _x)];};
	} foreach ArtilleryArray;
	_Chosen = _Bluforsupport;
};

if (side _Unit isEqualTo TF47_helper_playerFaction ) then 
{
	{
		if (side _x isEqualTo TF47_helper_playerFaction ) then {_Opforsupport = _Opforsupport + [(vehicle _x)];};
	} foreach ArtilleryArray;
	_Chosen = _Opforsupport;
};

if (side _Unit isEqualTo Resistance) then 
{
	{
		if (side _x isEqualTo Resistance) then {_Indsupport = _Indsupport + [(vehicle _x)];};
	} foreach ArtilleryArray;
	_Chosen = _Indsupport;
};

//systemchat format ["_Chosen: %1",_Chosen];
if ((count _Chosen) <= 0) exitWith {};

//player sidechat format ["ARTY CALLED: %1",(vehicle _Unit)];
_ReturnedSupport = [_Chosen,(vehicle _Unit)] call VCOMAI_ClosestObject;
if (isNil "_ReturnedSupport") exitWith {};

if !(_ReturnedSupport in ArtilleryArray) exitWith {};
//player sidechat format ["ARTY _ReturnedSupport: %1",_ReturnedSupport];

_ArtilleryGroup = group _ReturnedSupport;
_ArtilleryGroupActual = [];
{
	if (group _x isEqualTo _ArtilleryGroup) then
	{
		_ArtilleryGroupActual pushback _x;
	};

} foreach _Chosen;


////player sidechat format ["ARTY _ArtilleryGroup: %1",_ArtilleryGroup];

_ArtilleryGroupUnits = units _ArtilleryGroup;
//player sidechat format ["ARTY _ArtilleryGroupUnits: %1",_ArtilleryGroupUnits];


//player sidechat format ["ARTY _ArtilleryGroupActual: %1",_ArtilleryGroupActual];
_AmmoArray = getArtilleryAmmo _ArtilleryGroupActual;
//player sidechat format ["ARTY _AmmoArray: %1",_AmmoArray];
if (isNil "_AmmoArray") exitWith {  };

_RandomAmmoArray = selectRandom _AmmoArray;



if (isNil "_RandomAmmoArray") exitWith {};

private _allowedAmmo = [ "32Rnd_155mm_Mo_shells", "12Rnd_230mm_rockets", "RHS_mag_m1_he_12", "8Rnd_82mm_Mo_shells", "rhs_mag_HE_2a33", "rhs_mag_3of69m_2", "rhs_mag_3vs25m_10", "rhs_mag_3vo18_10", "rhs_mag_of462", "rhs_mag_40Rnd_122mm_rockets", "32Rnd_155mm_Mo_shells", "2Rnd_155mm_Mo_guided", "6Rnd_155mm_Mo_smoke", "2Rnd_155mm_Mo_LG", "RHS_mag_m1_he_12", "rhs_mag_m60a2_smoke_4", "8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Flare_white", "rhs_mag_3of56_10", "rhs_mag_d462_2", "rhs_mag_s463_2", "rhs_mag_3of69m_2", "rhs_mag_HE_2a33" ];

if (daytime > 20  || daytime < 6) then { _allowedAmmo = [ "32Rnd_155mm_Mo_shells", "12Rnd_230mm_rockets", "RHS_mag_m1_he_12", "8Rnd_82mm_Mo_shells", "rhs_mag_HE_2a33", "rhs_mag_3of69m_2", "rhs_mag_3vs25m_10", "rhs_mag_3vo18_10", "rhs_mag_of462", "rhs_mag_40Rnd_122mm_rockets", "32Rnd_155mm_Mo_shells", "2Rnd_155mm_Mo_guided", "6Rnd_155mm_Mo_smoke", "2Rnd_155mm_Mo_LG", "RHS_mag_m1_he_12", "rhs_mag_m60a2_smoke_4", "8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Flare_white", "rhs_mag_3of56_10", "rhs_mag_d462_2", "rhs_mag_s463_2", "rhs_mag_3of69m_2", "rhs_mag_HE_2a33", "rhs_mag_m314_ilum_4", "rhs_mag_ILLUM_2a33" ]; };
if (!(_RandomAmmoArray in _allowedAmmo)) exitWith {};
//player sidechat format ["ARTY _RandomAmmoArray: %1",_RandomAmmoArray];
_ContinueFiring = (getPos _Enemy) inRangeOfArtillery [_ArtilleryGroupActual,_RandomAmmoArray];
//player sidechat format ["_ContinueFiring _ContinueFiring: %1",_ContinueFiring];
if !(_ContinueFiring) exitWith {};
//Hint format ["_ArtilleryGroupActual : %1",_ArtilleryGroupActual];


{
	_target = _Enemy;
	_dist = random (5 + (random 150));
	_dir = random 360;
	_pos = getpos _target;
	_positions = [(_pos select 0) + (sin _dir) * _dist, (_pos select 1) + (cos _dir) * _dist, 0];

	sleep (random 3);
	_x doArtilleryFire [_positions,_RandomAmmoArray,(floor(random 4))];
	//_x commandArtilleryFire [(getPos _Enemy),_RandomAmmoArray,(floor(random 4))];
	if (VCOM_AIDEBUG isEqualTo 1) then
	{
		[_x,"I am firing my ARTY >:D!!!",120,20000] remoteExec ["3DText",0];
	};	
	
} foreach _ArtilleryGroupActual;

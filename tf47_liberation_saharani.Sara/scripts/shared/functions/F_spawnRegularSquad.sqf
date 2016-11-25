// diag_log format [ "Spawning regular squad at %1", time ];

params [ "_sector", "_squadies_to_spawn" ];
private [ "_sectorpos", "_spawnpos", "_grp", "_unitidx", "_corrected_amount" ];

_sectorpos = [ getMarkerPos _sector, random 100, random 360 ] call BIS_fnc_relPos;

_spawnpos = zeropos;
while { _spawnpos distance zeropos < 1000 } do {
	_spawnpos = ( [ _sectorpos, random 50, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [5, 100, "B_Heli_Light_01_F"];
	if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
};

_corrected_amount = round ( (count _squadies_to_spawn) * ([] call F_adaptiveOpforFactor) );
_side = TF47_helper_opposingFaction;
/*
if ((_squadies_to_spawn select 0) in militia_squad) then {
	_side = independent;
} else {
	_side = TF47_helper_opposingFaction;	
};
*/
_grp = createGroup _side;
{
	if ( ( count units _grp ) < _corrected_amount) then {
		_unit = _grp createUnit [_x, _spawnpos, [], 0, "NONE"];
		_unit linkItem "rhsusf_ANPVS_15";
	};
} foreach _squadies_to_spawn;

// diag_log format [ "Done Spawning regular squad at %1", time ];
_grp
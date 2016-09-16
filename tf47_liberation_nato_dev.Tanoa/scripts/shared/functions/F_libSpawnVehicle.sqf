params [
	"_sectorpos",
	"_classname",
	[ "_precise_position", false ],
	[ "_disable_abandon", false ],
	[ "_random_rotate", true ]
];

// diag_log format [ "Spawning vehicle %1 at %2", _classname , time ];

private _newvehicle = objNull;
private _spawnpos = zeropos;

if ( _precise_position ) then {
	_spawnpos = [] + _sectorpos;
} else {
	while { _spawnpos distance zeropos < 1000 } do {
		_spawnpos = ( _sectorpos getPos [50 + random 100, random 360]) findEmptyPosition [10, 100, "B_Heli_Transport_01_F"];
		if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
	};
};


_newvehicle = objNull;
if ( _classname isKindOf "AIR" ) then {
	_newvehicle = createVehicle [_classname, [(_spawnpos select 0), (_spawnpos select 1), 200], [], 50, "FLY"];
	_newvehicle flyInHeightASL [550, 200, 100];
} else {
	_newvehicle = createVehicle [_classname, _spawnpos, [], 0, "NONE"];
};
_newvehicle allowdamage false;

clearWeaponCargoGlobal _newvehicle;
clearMagazineCargoGlobal _newvehicle;
clearItemCargoGlobal _newvehicle;
clearBackpackCargoGlobal _newvehicle;

if ( _classname in militia_vehicles ) then {
	[ _newvehicle ] call F_libSpawnMilitiaCrew;
} else {
	createVehicleCrew _newvehicle;
	_grp = [TF47_helper_opposingFaction, (group ((crew _newvehicle) select 0)) ] call TF47_helper_swapSide;
};
if (count (crew _newvehicle) == 1 ) then {
	_freeCargoPositions = _newvehicle emptyPositions "cargo";
	if (_freeCargoPositions > 2) then {
		_transportgroup = group (driver _newvehicle);
		for "_i" from 1 to ((_freeCargoPositions)min(8)) do {
			_class = selectRandom ([opfor_engineer + opfor_sharpshooter + opfor_officer + opfor_aa + opfor_at + opfor_rpg + opfor_medic + opfor_machinegunner + opfor_marksman + opfor_team_leader + opfor_rifleman + opfor_grenadier]);
			_unit = _transportgroup createUnit [_class, (getPos _newvehicle), [], 1, "NONE"];
			_unit moveinCargo _newvehicle;
			_unit assignAsCargo  _newvehicle;
		};
		_grp = [TF47_helper_opposingFaction, _transportgroup ] call TF47_helper_swapSide;
	};
};


if ( _random_rotate ) then {
	_newvehicle setdir (random 360);
};
_newvehicle setVectorUp surfaceNormal position _newvehicle;
_newvehicle allowCrewInImmobile true;
_newvehicle allowdamage true;
_newvehicle setdamage 0;

// diag_log format [ "Done Spawning vehicle %1 at %2", _classname , time ];

_newvehicle
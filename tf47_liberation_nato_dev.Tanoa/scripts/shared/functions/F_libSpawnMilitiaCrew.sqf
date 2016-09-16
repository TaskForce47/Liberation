params [ "_vehicle" ];
private [ "_grp", "_vehcrew" ];

// diag_log format [ "Spawning militia crew at %1", time ];

_grp = group driver _vehicle;

_grp = createGroup independent;
_vehcrew = [];

if ((_vehicle emptyPositions "Driver") > 0) then { 
	_unit = _grp createUnit [( selectRandom militia_squad ), getpos _vehicle, [], 1, "NONE"];
	_unit moveinDriver _vehicle;
};
if ((_vehicle emptyPositions "Gunner") > 0) then { 
	_unit = _grp createUnit [( selectRandom militia_squad ), getpos _vehicle, [], 1, "NONE"];
	_unit moveinGunner _vehicle;
};
if ((_vehicle emptyPositions "Commander") > 0) then { 
	_unit = _grp createUnit [( selectRandom militia_squad ), getpos _vehicle, [], 1, "NONE"];
	_unit moveinCommander _vehicle;
};

_freeCargoPositions = _vehicle emptyPositions "cargo";
if (_freeCargoPositions > 3) then {
	for "_i" from 1 to ((_freeCargoPositions)min(8)) do {
		_unit = _grp createUnit [( selectRandom militia_squad ), (getPos _newvehicle), [], 1, "NONE"];
		_unit moveinCargo _newvehicle;
		_unit assignAsCargo  _newvehicle;
	};
};

_grp = [TF47_helper_opposingFaction, _grp ] call TF47_helper_swapSide;
// diag_log format [ "Done Spawning militia crew at %1", time ];
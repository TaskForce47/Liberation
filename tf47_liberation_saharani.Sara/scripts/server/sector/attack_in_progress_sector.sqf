params [ "_sector" ];
private [ "_attacktime", "_ownership", "_grp", "_squad_type" ];
if (!(_sector in SectorunderAttack))exitWith {};
private _idx = SectorunderAttack pushBackUnique _sector;
publicVariable "SectorunderAttack";
sleep 5;

_ownership = [ markerpos _sector ] call F_sectorOwnership;
if ( _ownership !=TF47_helper_opposingFaction) exitWith {};
_grp = creategroup TF47_helper_playerFaction;
_squad_type = blufor_squad_inf_light;
if ( _sector in sectors_military ) then {
	_squad_type = blufor_squad_inf;
};



sleep 60;

_ownership = [ markerpos _sector ] call F_sectorOwnership;
if ( _ownership == TF47_helper_playerFaction ) exitWith {
	if ( GRLIB_blufor_defenders ) then {
		{
			if ( alive _x ) then { deleteVehicle _x };
		} foreach units _grp;
	};
};

if ( GRLIB_blufor_defenders && (count (allUnits select {((getmarkerPos _sector) distance2D _x < 500)}) < 10) ) then {
	
	{ _x createUnit [ markerpos _sector, _grp,'']; } foreach _squad_type;
};

sleep 3;
_grp setBehaviour "COMBAT";

[ [ _sector, 1 ] , "remote_call_sector" ] call BIS_fnc_MP;
_attacktime = GRLIB_vulnerability_timer;

while { _attacktime > 0 && ( _ownership ==TF47_helper_opposingFaction|| _ownership == RESISTANCE ) } do {
	_ownership = [markerpos _sector] call F_sectorOwnership;
	_attacktime = _attacktime - 1;
	sleep 1;
};

waitUntil {
	sleep 1;
	[markerpos _sector] call F_sectorOwnership != RESISTANCE;
};

if ( GRLIB_endgame == 0 ) then {
	if ( _attacktime <= 1 && ( [markerpos _sector] call F_sectorOwnership ==TF47_helper_opposingFaction) ) then {
		blufor_sectors = blufor_sectors - [ _sector ];
		publicVariable "blufor_sectors";
		[ [ _sector, 2 ] , "remote_call_sector" ] call BIS_fnc_MP;
		reset_battlegroups_ai = true;
		trigger_server_save = true;
		[] call recalculate_caps;
		stats_sectors_lost = stats_sectors_lost + 1;
	} else {
		[ [ _sector, 3 ] , "remote_call_sector" ] call BIS_fnc_MP;
		{ [_x] spawn prisonner_ai; } foreach ( [ (markerpos _sector) nearEntities [ "Man", GRLIB_capture_size * 0.8 ], { side group _x ==TF47_helper_opposingFaction} ] call BIS_fnc_conditionalSelect );
	};
};

SectorunderAttack deleteAt _idx;
publicVariable "SectorunderAttack";

sleep 60;

if ( GRLIB_blufor_defenders ) then {
	{
		deleteVehicle _x;
	} foreach units _grp;
};
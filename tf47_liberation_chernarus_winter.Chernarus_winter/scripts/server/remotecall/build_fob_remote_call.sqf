if (!isServer) exitWith {};

params [ "_new_fob", "_create_fob_building" ];

if ( _create_fob_building ) then {
	private _fob_pos = [ (_new_fob select 0) + 15, (_new_fob select 1) + 2, 0 ];
	private _fob_building = FOB_typename createVehicle _fob_pos;
	_fob_building setpos _fob_pos;
	_fob_building setVectorUp [0,0,1];
};

private _newRespawn = [ TF47_helper_playerFaction, _new_fob , (format ["FOB %1", ( military_alphabet select (count GRLIB_all_fobs))])  ] call BIS_fnc_addRespawnPosition;
(_new_fob nearestObject "Land_Cargo_HQ_V1_F") setVariable ["TF47_FOBArray", _newRespawn, true];

GRLIB_all_fobs pushbackUnique _new_fob;
publicVariable "GRLIB_all_fobs";

trigger_server_save = true;

sleep 3;
[ [ _new_fob, 0 ] , "remote_call_fob" ] call BIS_fnc_MP;

stats_fobs_built = stats_fobs_built + 1;
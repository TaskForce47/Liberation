params [ "_thispos" ];
private [ "_attacktime", "_ownership", "_grp" ];
if (!(_thispos in SectorunderAttack))exitWith {};
private _idx = SectorunderAttack pushBackUnique _thispos;

sleep 5;

_ownership = [ _thispos ] call F_sectorOwnership;
if ( _ownership != TF47_helper_opposingFaction ) exitWith {};

[ [ _thispos , 1 ] , "remote_call_fob" ] call BIS_fnc_MP;
_attacktime = GRLIB_vulnerability_timer;	//20 min

_fob_building =  (_thispos nearestObject "Land_Cargo_HQ_V1_F") getVariable "TF47_FOBArray";
if (!(isNil "_fob_building")) then {
	_fob_building call BIS_fnc_removeRespawnPosition;
};

while { _attacktime > 0 && ( _ownership == TF47_helper_opposingFaction || _ownership == RESISTANCE ) } do {
	_ownership = [ _thispos ] call F_sectorOwnership;
	_attacktime = _attacktime - 1;
	sleep 1;
};

waitUntil {
	sleep 1;
	[ _thispos ] call F_sectorOwnership != RESISTANCE;
};

if ( GRLIB_endgame == 0 ) then {

	// fob lose should only happen if fob is abandoned
	if ( _attacktime <= 1 && ( [ _thispos ] call F_sectorOwnership == TF47_helper_opposingFaction ) ) then {
		[ [ _thispos , 2 ] , "remote_call_fob" ] call BIS_fnc_MP;	//only notifications
		sleep 3;
		
		//=======================================//
		reset_battlegroups_ai = true;
		[_thispos] call destroy_fob;
		trigger_server_save = true;
		[] call recalculate_caps;
		stats_fobs_lost = stats_fobs_lost + 1;
		//======================================//
		
		
	} else {
		//======================================//
		//	make some prisoners					//
		[ [ _thispos , 3 ] , "remote_call_fob" ] call BIS_fnc_MP; //only notifications
		{ [_x] spawn prisonner_ai; } foreach ( [ _thispos nearEntities [ "Man", GRLIB_capture_size * 0.8], { side group _x == TF47_helper_opposingFaction } ] call BIS_fnc_conditionalSelect );
		(_thispos nearestObject "Land_Cargo_HQ_V1_F") setVariable ["tf47_fobUnderAttack",false, true];
		private _fobarray = [ TF47_helper_playerFaction, _thispos, (format ["FOB %1", ([ _x ] call F_getFobName)]) ] call BIS_fnc_addRespawnPosition;
		(_thispos nearestObject "Land_Cargo_HQ_V1_F") setVariable ["tf47_fobarray", _fobarray, true];
							
	};
	
};
SectorunderAttack deleteAt _idx;
publicVariable "SectorunderAttack";
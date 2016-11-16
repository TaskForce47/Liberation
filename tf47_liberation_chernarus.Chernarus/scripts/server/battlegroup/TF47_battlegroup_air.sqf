/*
	Parameter:
	

*/

private _target =	objNull;
private _cas	=	false;
private _cap	=	false;

{
	if (!(isNull _target)) exitWith {};
	private _veh    =   (vehicle _x);
	if((_veh emptyPositions "cargo")<6)then{
    	if (( armor_weight >= 50 ) && ( _veh isKindOf "Tank")) then {
    		_target = _x; _cas	=	true;
    	};
    	
    	if (( air_weight >= 50 ) && (_veh isKindOf "Air")) then {
    		_target = _x; _cap	=	true;
    	};
    };	
} foreach (allPlayers - entities "HeadlessClient_F");

if (!(isNull _target)) then {
	private _target_pos = [99999, getpos _target ] call F_getNearestSector;
	
	if (_target_pos != "" ) then {
		
		if(	_cap	)then{	[_target_pos,3] spawn TF47_battlegroup_combatAirPatrol;	"[ INFO ] TF47 Battlegroup: Look out for the evil minions!" remoteExec ["diag_log",0];};
		if(	_cas	)then{	[_target_pos,3] spawn TF47_battlegroup_closeairsupport;	"[ INFO ] TF47 Battlegroup: Look out for the evil minions!" remoteExec ["diag_log",0];};
		if(	_cap	)then{	[_target_pos,3] spawn TF47_battlegroup_combatAirPatrol;	"[ INFO ] TF47 Battlegroup: Look out for the evil minions!" remoteExec ["diag_log",0];};
		if(	_cas	)then{	[_target_pos,3] spawn TF47_battlegroup_closeairsupport;	"[ INFO ] TF47 Battlegroup: Look out for the evil minions!" remoteExec ["diag_log",0];};
		
	};
};
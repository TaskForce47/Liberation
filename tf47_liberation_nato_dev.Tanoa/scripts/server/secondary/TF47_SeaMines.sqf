private _seaminemoored = "UnderwaterMine";
private _seaminebottom = "UnderwaterMineAB";
private _locs = ["TF47_underwaterside_0","TF47_underwaterside_1","TF47_underwaterside_2","TF47_underwaterside_3","TF47_underwaterside_4","TF47_underwaterside_5","TF47_underwaterside_6","TF47_underwaterside_7","TF47_underwaterside_8","TF47_underwaterside_9","TF47_underwaterside_10"];

private _locpos = getMarkerPos selectRandom _locs; 
if (isNil "TF47_Missionarray") then {TF47_Missionarray = [];};
_index = TF47_Missionarray pushback [ _locpos, { }, "Clear Minefield", "<br /> The opposing force has mined an canal from which we get a some Supplys and our guys come at the Island.<br /> Clear the Minefield and eliminate all Enemys. <br /> (ACE Disarm)", "", "res\secondary\defuse_seamines.jpg"];
publicVariable "TF47_Missionarray";
//___________________________________________ Notification ___________________________________________//

["TF47_TaskAssigned",	[("Clear Minefield")] 	] remoteExec ["BIS_fnc_showNotification", TF47_helper_playerFaction, false];

//___________________________________________ Notification ___________________________________________//

private _markerstr = createMarker [(format ["Minefieldmarker_%1_%2", _locpos, Servertime]), _locpos];
_markerstr setMarkerShape "RECTANGLE";
_markerstr setMarkerSize [350,350];
_markerstr setMarkerBrush "DiagGrid";
_markerstr setMarkerColor "colorOPFOR";

private _divers = [];
private _mines = [];
for "_i" from 1 to 3 do {
	_group = createGroup TF47_helper_opposingFaction;
	for "_o" from 1 to ((ceil ((count AllPlayers) / 1.5))max(3))min(7) do {
		
		_unit = _group createUnit [ (selectRandom OpferDiver), _locpos getPos [(random 50), (random 360)], [], 20, "NONE"];
		_divers pushback _unit;
	};
	
	for "_j" from 0 to 5 do {
		_wppos = _locpos getPos [(random 120), (random 360)];
		_wp1 = _group addWaypoint [ ASLToAGL ([_wppos select 0, _wppos select 1, -4]) , 2];
	};
	_wp2 = _group addWaypoint [ (getpos leader _group), 2];
	_wp2 setWaypointType "CYCLE";
};

for "_i" from 1 to (6 + round (random 8)) do {
	private _seamine = createMine  [ _seaminemoored, ( _locpos getPos [10 + random 80, random 359]), [], 3];
	_seamine setPosASL [(getPos _seamine) select 0, (getPos _seamine) select 1, (0.3 - (random 3)) - 47];
	_mines pushback _seamine;
	_seamine setVariable ["TF47_DONOTCLEANUP", true, true];
	TF47_helper_opposingFaction revealMine _seamine;
	TF47_helper_playerFaction revealMine _seamine;
};

private _boat = createVehicle [(selectRandom OpforBoat), (_locpos getPos [600, random 360]), [], 0, "NONE"];
_boat setpos ( ASLToATL  [(getPos _boat) select 0, (getPos _boat) select 1, 2]);
createVehicleCrew _boat;
_boatmcboatfacegroup = group (crew _boat select 0);
_wparr = ["wpseamarker_1", "wpseamarker_2", "wpseamarker_3", "wpseamarker_4", "wpseamarker_5", "wpseamarker_6", "wpseamarker_7", "wpseamarker_8", "wpseamarker_9", "wpseamarker_10", "wpseamarker_11", "wpseamarker_12", "wpseamarker_13", "wpseamarker_14", "wpseamarker_15", "wpseamarker_16", "wpseamarker_17"];
for "_w" from 0 to 4 do {
	_wp = _boatmcboatfacegroup addWaypoint [getMarkerPos (selectRandom _wparr), 50];
	_wp setWaypointSpeed  "FULL";
	_wp setWaypointTimeout [60, 90, 180];
};
_wpcycle = _boatmcboatfacegroup addWaypoint [getMarkerPos (selectRandom _wparr), 50];
_wpcycle setWaypointType "CYCLE";
_boatmcboatfacegroup setCurrentWaypoint [_boatmcboatfacegroup, 0];

waitUntil { sleep 10;  (({ alive _x } count _divers ) <= 2) && ({ (!(mineActive _x)) || (alive _x)} count _mines == 0) };

combat_readiness = combat_readiness * 0.8;
resources_ammo = resources_ammo + 100;
publicVariable "resources_ammo";
sleep 1;
if (isServer) then {
	TF47_respawnTickets = TF47_respawnTickets + 3;
	resources_infantry = [TF47_helper_playerFaction, 3] call BIS_fnc_respawnTickets; 
	publicVariable "TF47_respawnTickets";
	publicVariable "resources_infantry";
};


trigger_server_save = true;
sleep 3;
TF47_Missionarray deleteAt _index;
publicVariable "TF47_Missionarray";
deleteMarker _markerstr;
if (isMultiplayer) then {sleep 1200;} else { sleep 20; };

{
	deleteVehicle _x;
} foreach _mines;

{
	deleteVehicle _x;
} foreach _divers;
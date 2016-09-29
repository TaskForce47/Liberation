TF47_side_Artiactive	=	true;

if (isNil "MyPlacesAA") then {
	MyPlacesAA = selectBestPlaces [[9981.85,9991.62,0], 10000, "((2 + 2* meadow) - (1 * forest - 0 * hills - houses))", 250, 30]; 
};
if (count MyPlacesAA == 0) then {
	MyPlacesAA = selectBestPlaces [[9981.85,9991.62,0], 10000, "((2 + 2* meadow) - (1 * forest - 0 * hills - houses))", 250, 30]; 
};
private _currdistance = 99999;
private _accdistance = 99999;
private _location = (selectRandom MyPlacesAA) select 0;
_targetsec = selectRandom sectors_opfor;
{
	
	_normal = surfaceNormal (_x select 0);
	_accdistance = (_x select 0) distance (getMarkerPos _targetsec);
	if ( ((((_normal select 0) > -0.15) && ((_normal select 0) <  0.15)) && (((_normal select 0) > -0.15) && ((_normal select 0) <  0.15))) ) then {
		if ( ((((_normal select 1) > -0.15) && ((_normal select 1) <  0.15)) && (((_normal select 1) > -0.15) && ((_normal select 1) <  0.15))) ) then {
			if ( !([ 2000, (_x select 0) ] call F_getNearestSector in blufor_sectors) ) then {
				if (_accdistance < _currdistance) then {
					_currdistance = _accdistance;
					_location = _x;
				};
			};
		} else {
			MyPlacesAA deleteAt _forEachIndex;
		};
	} else {
		MyPlacesAA deleteAt _forEachIndex;
	};
} foreach MyPlacesAA;

MyPlacesAA deleteAt ( MyPlacesAA find _location );
private _havetobuild = selectRandom 
[
	[
		[ (selectRandom OpferArtyArr), [0.7, -7.52, -0.05], 180.54 ],
		[ (selectRandom OpforStaticVehicles), [-12.2, -2.93, 0.02], 272.25 ],
		[ "Land_Trench_01_grass_F", [-5.02, -7.93, 1.7], 269.44 ],
		[ "Land_Trench_01_grass_F", [5.36, 8.56, 1.7], 90.38 ],
		[ "Land_Trench_01_grass_F", [6.22, -8, 1.7], 87.28 ],
		[ "Land_Trench_01_grass_F", [-5.74, 9.01, 1.7], 268.76 ],
		[ "Land_BagFence_01_long_green_F", [-9.03, -7.54, 0], 359.68 ],
		[ "Land_Trench_01_grass_F", [-4.8, -12.02, 1.7], 179.15 ],
		[ "Land_Cargo_Patrol_V4_F", [14.49, 1.48, 0], 272.36 ],
		[ "Land_Trench_01_grass_F", [6.38, -12.16, 1.7], 179.15 ],
		[ "Land_TrenchFrame_01_F", [-7.39, -12.09, 1.56], 268.98 ],
		[ "Land_BagFence_01_long_green_F", [-11.64, 8, 0], 311.74 ],
		[ "Land_TrenchFrame_01_F", [-0.77, -14.34, 1.56], 179.15 ],
		[ "Land_TrenchFrame_01_F", [2.6, -14.34, 1.56], 179.15 ],
		[ "Land_Trench_01_grass_F", [5.3, 13.21, 1.7], 0 ],
		[ "Land_BagFence_01_long_green_F", [-13.74, 5.74, 0], 312.58 ],
		[ "Land_TrenchFrame_01_F", [8.72, -12.12, 1.56], 90.55 ],
		[ "Land_Trench_01_grass_F", [-5.88, 13.51, 1.7], 0 ],
		[ "Land_BagFence_01_long_green_F", [14.42, -4.3, 0], 312.58 ],
		[ "Land_TrenchFrame_01_F", [7.84, 13.31, 1.56], 92.22 ],
		[ "Land_TrenchFrame_01_F", [1.3, 15.59, 1.56], 0 ],
		[ "Land_TrenchFrame_01_F", [-2.07, 15.64, 1.56], 0 ],
		[ "Land_TrenchFrame_01_F", [-8.37, 13.51, 1.56], 271.35 ],
		[ "Land_BagBunker_01_small_green_F", [-16.46, 1.57, 0], 91.72 ],
		[ "Land_BagFence_01_long_green_F", [-15.78, -2.71, 0], 89.41 ],
		[ "Land_BagFence_01_long_green_F", [14.53, 7.37, 0], 45.37 ],
		[ "Land_BagFence_01_long_green_F", [16.52, -2.03, 0], 311.74 ],
		[ "Land_BagFence_01_long_green_F", [16.66, 5.19, 0], 45.37 ],
		[ "Land_BagFence_01_long_green_F", [17.63, 1.52, 0], 90.89 ],
		[ (selectRandom OpforStaticAP), [-14.09, 1.77, -0.01], 269.78 ]
	],[
		[ (selectRandom OpferArtyArr), [-15.92, 2.69, 0.09], 270.28 ],
		[ "Land_HBarrier_01_line_5_green_F", [-8.65, 2.98, 0], 91.65 ],
		[ "Land_BagFence_01_long_green_F", [-0.09, -12.01, 0], 271.14 ],
		[ "Land_Cargo_HQ_V4_F", [11.43, -6.2, 0], 0 ],
		[ "Land_BagFence_01_long_green_F", [-0.09, -15.14, 0], 271.14 ],
		[ "Land_Cargo_House_V4_F", [16.83, 4.06, 0], 91.87 ],
		[ "Land_BagFence_01_long_green_F", [-0.18, -18.24, 0], 271.14 ],
		[ "Land_Cargo_House_V4_F", [16.9, 10.86, 0.13], 91.87 ],
		[ "Land_Cargo_House_V4_F", [-15.69, -12.94, 0], 270.08 ],
		[ "Land_BagFence_01_long_green_F", [-0.16, -21.31, 0], 271.14 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.33, 3.03, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.5, -2.8, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.54, -2.97, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.72, 2.85, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.28, 8.8, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-11.28, 20.26, 0], 88.49 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.53, -8.59, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.52, -8.77, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.77, 8.62, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-11.82, -20.4, 0], 88.12 ],
		[ "Land_HBarrier_01_line_5_green_F", [12.19, 20.28, 0], 272.08 ],
		[ "Land_HBarrier_01_line_5_green_F", [2.35, -23.77, 0], 181.01 ],
		[ "Land_Cargo_Patrol_V4_F", [-17.39, 19.06, 0], 92.51 ],
		[ "Land_HBarrier_01_line_5_green_F", [-7.62, 23.83, 0], 0.02 ],
		[ "Land_HBarrier_01_line_5_green_F", [7.96, -23.87, 0], 181.01 ],
		[ "Land_Cargo_Patrol_V4_F", [-16.02, -20.88, 0], 0.39 ],
		[ "Land_HBarrier_01_line_5_green_F", [8.15, 24.11, 0], 0.02 ],
		[ "Land_Cargo_Patrol_V4_F", [16.84, 20.41, 0], 180.38 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.16, 14.69, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.55, -14.32, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.5, -14.5, 0], 90 ],
		[ "Land_Cargo_Patrol_V4_F", [18.09, -19.79, 0], 272.51 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.89, 14.51, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-13.39, 23.88, 0], 0.02 ],
		[ "Land_HBarrier_01_line_5_green_F", [13.73, -24.02, 0], 181.01 ],
		[ "Land_HBarrier_01_line_5_green_F", [-14.01, -24, 0], 181.01 ],
		[ "Land_HBarrier_01_line_5_green_F", [13.88, 24.09, 0], 0.02 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.13, 20.48, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.43, -20.35, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.62, -20.17, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.92, 20.3, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-19.28, 24, 0], 0.02 ],
		[ "Land_HBarrier_01_line_5_green_F", [-19.86, -23.82, 0], 181.01 ],
		[ "Land_HBarrier_01_line_5_green_F", [19.73, 24.01, 0], 0.02 ],
		[ "Land_HBarrier_01_line_5_green_F", [19.61, -24.25, 0], 181.01 ],
		[ (selectRandom OpforStaticAP), [-16.99, 17.71, 4.31], 271.42 ],
		[ (selectRandom OpforStaticAP), [15.74, 19.92, 4.31], 3.57 ],
		[ (selectRandom OpforStaticAP), [-15.51, -20.75, 4.31], 178.43 ],
		[ (selectRandom OpforStaticAP), [17.71, -19.14, 4.31], 96.03 ]
	]
];



private _unitarr = [];
private _didbuild = [];
private _locpos = _location select 0;
private _defensegroup =  createGroup TF47_helper_opposingFaction;
{
	private _type = (_x select 0);
	private _pos = (_x select 1);
	private _endpos = [	
		((_locpos select 0) + (_pos select 0)), 
		((_locpos select 1) + (_pos select 1)), 
		(_pos select 2)
	];
	
	private _building = createVehicle [ _type, _endpos , [], 0, "NONE"];
	_building allowDamage false;
	_didbuild pushback _building;
	_building setDir (_x select 2);
	_building setPos _endpos;
	_building setVectorUp surfaceNormal position _building;
	
	if (_building emptyPositions "Driver" != 0) then {
		_building lock 3;
		_commander = _defensegroup createUnit [ (selectRandom OpforCrew), _locpos, [], 1, "NONE"];
		_commander setDir (random 360);
		_commander assignAsCommander _building;
		_commander moveinCommander _building;
		_unitarr pushback _commander;
	};

	if (_building emptyPositions "Commander" != 0) then {
		_commander = _defensegroup createUnit [ (selectRandom OpforCrew), _locpos, [], 1, "NONE"];
		_commander setDir (random 360);
		_commander assignAsCommander _building;
		_commander moveinCommander _building;
		_unitarr pushback _commander;
	};
	if (_building emptyPositions  "GUNNER" != 0) then {
		_gunner = _defensegroup createUnit [ (selectRandom OpforCrew), _locpos, [], 1, "NONE"];
		_gunner assignAsGunner _building;
		_gunner setDir (random 360);
		_gunner moveinGunner _building;
		_unitarr pushback _gunner;
		_building setVehicleAmmo 1;
	}  else {
	    if ( isOnRoad (getpos _building)) then {
	        deletevehicle _building;
	        private _barr = "RoadBarrier_F" createVehicle _endpos;
	        private _road = roadAt _endpos;
	        _barr setDir (getDir _road) + 90;
	    };
	};
	_building setVectorUp surfaceNormal position _building;
	_building setDamage 0;
	_building setCaptive false;
	_building allowDamage true;
} foreach _havetobuild;


private _artillerytypeName = _havetobuild select 0 select 0;
private _text = getText (configFile >> "CfgVehicles" >> _artillerytypeName >> "displayName");
private _description = format ["The opposing Force has build up a Artillery side with an %1 at %2. It will provide firesupport for any conflict in Range.", _text, mapGridPosition _locpos];

private _index = TF47_Missionarray pushback [ (_location select 0), { }, "Destroy Artillery Side", _description, "", "res\secondary\destroy_artillery.jpg"];
publicVariable "TF47_Missionarray";

//___________________________________________ Notification ___________________________________________//

["TF47_TaskAssigned",	[("Destroy Artillery Side")]	] remoteExec ["BIS_fnc_showNotification", TF47_helper_playerFaction, false];

//___________________________________________ Notification ___________________________________________//


for "_i" from 0 to (round (random 2)) do {
	_next_box = createVehicle [ammobox_o_typename, [((_locpos select 0) - ((random 20) + (random 40))) , ((_locpos select 1) - ((random 20) + (random 40))), 0], [], 0, "NONE"];
	_next_box enableRopeAttach true;
	[ [_next_box, 200 ] , "F_setMass" ] call BIS_fnc_MP;
	  
};



Waituntil {sleep 10; ([ _locpos ] call F_sectorOwnership != independent) || ({alive _x} count (units _defensegroup) == 0) };
if ({alive _x} count (units _defensegroup) != 0) then {

	private _patrol = 1;
	private _garnison = 6;
	private _playercount = (count (allPlayers - entities "HeadlessClient_F"));
	switch (true) do {
		case( _playercount <= 4): {
			_patrol = 2;
			_garnison = 8;
		};
		case( (_playercount >= 6) && (_playercount <= 7)): {
			_patrol = 2;
			_garnison = 10;
		};
		case( (_playercount >= 8) && (_playercount <= 11)): {
			_patrol = 3;
			_garnison = 10;
		};
		case( (_playercount >= 12) && (_playercount <= 16)): {
			_patrol = 4;
			_garnison = 12;
		};
		case( (_playercount >= 17)): {
			_patrol = 4;
			_garnison = 16;
		};
		default{
			_patrol = 2;
			_garnison = 8;
		};
	};

	for "_i" from 1 to _patrol do {
		private _group = createGroup TF47_helper_opposingFaction;
		for "_o" from 1 to 4 do {
			_unit = _group createUnit [ (selectRandom [opfor_sentry, opfor_rifleman, opfor_grenadier, opfor_marksman, opfor_machinegunner, opfor_heavygunner, opfor_rpg, opfor_rpg, opfor_at, opfor_aa,  opfor_engineer]), _locpos, [], 1, "NONE"];
			_didbuild pushback _unit;
			_unitarr pushback _unit;
		};
		[_group, (getPos (leader _group)), (100 + (random 300)), 7, "MOVE", "SAFE", "RED", "LIMITED", "STAG COLUMN", "this spawn CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
	};
	_buildingpositions = [];

	{

		_Arr =  _x buildingpos -1;
		if (count _Arr > 0) then {
			_buildingpositions pushback _x;
		};
			
	} foreach _didbuild;

	for "_i" from 1 to _garnison do {
		private _group = createGroup TF47_helper_opposingFaction;
		_unit = _group createUnit [ (selectRandom [opfor_sentry, opfor_rifleman, opfor_grenadier, opfor_marksman, opfor_machinegunner, opfor_heavygunner, opfor_rpg, opfor_rpg, opfor_at, opfor_aa,  opfor_engineer]), _locpos, [], 1, "NONE"];
		_didbuild pushback _unit;
		if (count _buildingpositions > 0 ) then {
			_rndbuildingpos = (selectRandom _buildingpositions);
			_buildingpositions deleteAt (_buildingpositions find _rndbuildingpos);
			_unit setDir (random 360);
			_wphold1 = _group addWaypoint [(leader _group), 0];
			_wphold1 setWaypointType "HOLD";
			_unitarr pushback _unit;
		} else {
			_wphold1 = _group addWaypoint [(leader _group), 0];
			_wphold1 setWaypointType "LOITER";
			_unitarr pushback _unit;
		};
	};
};

waitUntil { sleep 10;  ( { alive _x } count _unitarr ) <= 1 };
["TF47_TaskSucceeded",	[("Destroy Artillery Side")]] remoteExec ["BIS_fnc_showNotification", TF47_helper_playerFaction, false];
combat_readiness = (combat_readiness - 5 - (round 5));
sleep 3;
TF47_Missionarray deleteAt _index;
publicVariable "TF47_Missionarray";
publicVariableServer "combat_readiness";
if (isMultiplayer) then {sleep 1200;} else { sleep 20;};

{
	deleteVehicle _x;
} foreach _didbuild;

{
	deleteVehicle _x;
} foreach _unitarr;
trigger_server_save = true;
TF47_side_Artiactive = false;
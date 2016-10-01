private [ "_spawnsector", "_grp", "_usable_sectors", "_spawntype", "_civnumber", "_vehdriver", "_spawnpos", "_civveh", "_sectors_patrol", "_patrol_startpos", "_waypoint", "_grpspeed", "_sectors_patrol_random", "_sectorcount", "_nextsector", "_nearestroad" ];

_civveh = objNull;

sleep (150 + (random 150));
_spawnsector = "";

if ( isNil "active_sectors" ) then { active_sectors = [] };

while { GRLIB_endgame == 0 } do {

	_spawnsector = "";
	_usable_sectors = [];
	{
		if ( ( ( [ getmarkerpos _x , 1000 ,TF47_helper_opposingFaction] call F_getUnitsCount ) == 0 ) && ( count ( [ getmarkerpos _x , 3500 ] call F_getNearbyPlayers ) > 0 ) ) then {
			_usable_sectors pushback _x;
		}

	} foreach ((sectors_bigtown + sectors_capture + sectors_factory) - (active_sectors));

	if ( count _usable_sectors > 0 ) then {
		_spawnsector = selectRandom _usable_sectors;

		_grp = createGroup CIVILIAN;
		if ( random 100 < 33) then {
			_civnumber = 1 + (ceil (random 2));
			for "_i" from 1 to (1 + (ceil (random 2))) do {
				_civilian = _grp createUnit [( selectRandom civilians ), (markerpos _spawnsector), [], 0, "NONE"];
			};
			_grpspeed = "LIMITED";
		} else {

			_nearestroad = objNull;
			while { isNull _nearestroad } do {
				_nearestroad = [ [  (getmarkerpos _spawnsector), random(100), random(360)  ] call BIS_fnc_relPos, 200, [] ] call BIS_fnc_nearestRoad;
				sleep 1;
			};

			_spawnpos = getpos _nearestroad;

			_civ = _grp createUnit [( selectRandom civilians), _spawnpos, [], 0, "NONE"];
			_civveh = ( selectRandom civilian_vehicles) createVehicle _spawnpos;
			_civveh setpos _spawnpos;
			_civveh addEventHandler ["HandleDamage", { private [ "_damage" ]; if (( side (_this select 3) !=TF47_helper_opposingFaction) && ( side (_this select 3) != TF47_helper_playerFaction )) then { _damage = 0 } else { _damage = _this select 2 }; _damage } ];
			_civ moveInDriver _civveh;
			_civ disableAI "FSM";
			_civ disableAI "AUTOCOMBAT";
			_grpspeed = "LIMITED";

		};

		{
			_x addEventHandler   [
				"HandleDamage", 
				{ 
					private [ "_damage" ]; 
					if (( side (_this select 3) !=TF47_helper_opposingFaction) && ( side (_this select 3) != TF47_helper_playerFaction )) then { 
						_damage = 0;
					} else { 
						_damage = _this select 2;
						if ( side (_this select 3) == TF47_helper_playerFaction ) then {
							combat_readiness = combat_readiness + (2 + (ceil (random 2))); publicVariable "combat_readiness";
						};
					}; 
					_damage 
				} 
			];
		} foreach (units _grp);

		_sectors_patrol = [];
		_patrol_startpos = getpos (leader _grp);
		{
			if ( (_patrol_startpos distance (markerpos _x) < 5000 ) && ( count ( [ getmarkerpos _x , 4000 ] call F_getNearbyPlayers ) > 0 ) ) then {
				_sectors_patrol pushback _x;
			};
		} foreach (sectors_bigtown + sectors_capture + sectors_factory);

		_sectors_patrol_random = [];
		_sectorcount = count _sectors_patrol;
		while { count _sectors_patrol_random < _sectorcount } do {
			_nextsector = selectRandom _sectors_patrol;
			_sectors_patrol_random pushback _nextsector;
			_sectors_patrol = _sectors_patrol - [_nextsector];

		};

		while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
		{_x doFollow leader _grp} foreach units _grp;

		{
			_nearestroad = [ [  getmarkerpos (_x), random(100), random(360)  ] call BIS_fnc_relPos, 200, [] ] call BIS_fnc_nearestRoad;
			if ( isNull _nearestroad ) then {
				_waypoint = _grp addWaypoint [ markerpos _x, 100 ];
			} else {
				_waypoint = _grp addWaypoint [ getpos _nearestroad, 0 ];
			};
			_waypoint setWaypointType "MOVE";
			_waypoint setWaypointSpeed _grpspeed;
			_waypoint setWaypointBehaviour "SAFE";
			_waypoint setWaypointCompletionRadius 100;
		} foreach _sectors_patrol_random;

		_waypoint = _grp addWaypoint [_patrol_startpos , 100];
		_waypoint setWaypointType "CYCLE";

		_ID = [] call F_lessLoadedHC;
		if ( _ID != -1 ) then {
			_grp setGroupOwner _ID;
		};

		

		waitUntil {
			sleep (30 + (random 30));
			( ( ( { alive _x } count ( units _grp ) ) == 0 ) || ( count ( [ getpos leader _grp , 4000 ] call F_getNearbyPlayers ) == 0 ) )
		};

		if ( count (units _grp) > 0 ) then {
			if ( count ( [ getpos leader _grp , 4000 ] call F_getNearbyPlayers ) == 0 ) then {

				if ( !(isNull _civveh) ) then {
					 if ( { ( alive _x ) && (side group _x ==TF47_helper_opposingFaction) } count (crew _civveh) == 0 ) then {
						deleteVehicle _civveh
					};
				};

				{ deletevehicle _x } foreach units _grp;
			};
		};
	};
	sleep 150 + (random (150));
};
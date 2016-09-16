params [ "_targetsector" ];
private _targetpos = getMarkerPos _targetsector;
if ((_targetpos inArea "noBattlegroup1") ||(_targetpos inArea "noBattlegroup2") ||(_targetpos inArea "noBattlegroup3") ||(_targetpos inArea "noBattlegroup4")) exitWith {};
private _spawnsector = ((sectors_allSectors - blufor_sectors) - sectors_tower) select { ((getMarkerPos _x) distance2D _targetpos < 4000) && (((getMarkerPos _x) distance2D _targetpos) > 2000) && (_x != _targetsector)};
if (count _spawnsector == 0) exitWith {};
private _accstart = getmarkerPos (_spawnsector select 0);

for "_i" from 1 to 2 do {
	private _vehicletype = selectRandom opfor_vehicles;
	if (!(_vehicletype isKindOf "AIR")) then {
		_nearestRoad = [_accstart, 1000] call BIS_fnc_nearestRoad;
		_newvehicle = createVehicle [ _vehicletype, _accstart , [], 0, "NONE"];
		if (!isNull _nearestRoad) then {
			_newvehicle setPos ((getPos _nearestRoad) findEmptyPosition [0, 100, _vehicletype]);
		};
		
		createVehicleCrew _newvehicle;
		_newvehicle addEventHandler ["HandleDamage", { private [ "_damage" ]; if (( side (_this select 3) !=TF47_helper_opposingFaction) && ( side (_this select 3) != TF47_helper_playerFaction )) then { _damage = 0 } else { _damage = _this select 2 }; _damage } ];
		_newvehicle allowCrewInImmobile true;
		_newvehicle lock 3;

		private _group = group ((crew _newvehicle) select 0);

		sleep 0.1;
		if (isNil "_group") exitWith { deleteVehicle _newvehicle; };
		{_x doFollow leader _group} foreach units _group;
		sleep 0.2;
		{deleteWaypoint _x } foreach waypoints _group;
		private _waypoint = _group addWaypoint [ (getPos ([(getPos _newvehicle), 1000] call BIS_fnc_nearestRoad)) , 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointSpeed "LIMITED";
		_waypoint setWaypointBehaviour "AWARE";
		_waypoint setWaypointCompletionRadius 4;

		sleep 1;
		if (surfaceIsWater (getWPPos _waypoint) || (str (getWPPos _waypoint) == str [0,0,0])) then { deleteWaypoint _waypoint};

		private _waypoint = _group addWaypoint [ (getPos ([_targetpos, 1000] call BIS_fnc_nearestRoad)) , 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointSpeed "NORMAL";
		_waypoint setWaypointBehaviour "AWARE";
		_waypoint setWaypointCompletionRadius 150;
		private _waypoint = _group addWaypoint [ (getPos ([_targetpos, 1000] call BIS_fnc_nearestRoad)) , 0];
		_waypoint setWaypointType "SAD";
		_waypoint setWaypointSpeed "NORMAL";
		_waypoint setWaypointBehaviour "AWARE";
		_waypoint setWaypointCompletionRadius 150;

	/**********************************************************************************************************************************/
		if(	(_newvehicle emptyPositions "cargo") >= 4)then{
			private _cargogroup = createGroup (side leader _group);
			for "_u" from 1 to ((_newvehicle emptyPositions "cargo")min(8+ (round (random 4)))) do {
				_unit = _cargogroup createUnit [(selectRandom [opfor_sentry, opfor_rifleman, opfor_grenadier, opfor_squad_leader, opfor_team_leader, opfor_marksman, opfor_machinegunner, opfor_heavygunner, opfor_medic, opfor_rpg, opfor_at, opfor_aa,opfor_aa,opfor_aa,opfor_aa, opfor_sharpshooter]), _accstart,  [], 0, "NONE"];
				sleep 0.5;
				if (daytime > 20 || daytime < 5) then {
					_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
				};
				_unit linkItem "rhsusf_ANPVS_15";
			};

			{ _x moveInCargo _newvehicle } foreach (units _cargogroup);

			{deleteWaypoint _x } foreach waypoints _cargogroup;
			{_x doFollow leader _cargogroup} foreach units _cargogroup;
			_cargogroup setCurrentWaypoint ((waypoints _cargogroup) select 0);
			_group setCurrentWaypoint ((waypoints _group) select 0);
			[
				{
					(!((_this select 3)in(active_Sectors)))
				}, 
				{ 
					deleteVehicle (_this select 0);
					{ deletevehicle _x; } foreach (units (_this select 1));
					{ deletevehicle _x; } foreach (units (_this select 2));
				}, 
				[_newvehicle, _group, _cargogroup, _targetsector]
			] call CBA_fnc_waitUntilAndExecute;
		} else {
			[
				{
					(!((_this select 2)in(active_Sectors)))
				}, 
				{ 
					deleteVehicle (_this select 0);
					{ deletevehicle _x; } foreach (units (_this select 1));
				}, 
				[_newvehicle, _group, _targetsector]
			] call CBA_fnc_waitUntilAndExecute;
		};
		sleep 1; 
		_group setCurrentWaypoint ((waypoints _group) select 0);
		{ _x linkItem "rhsusf_ANPVS_15";} foreach crew _newvehicle;
	};
};
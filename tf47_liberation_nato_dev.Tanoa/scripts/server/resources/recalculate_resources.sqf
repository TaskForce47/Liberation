waitUntil { !isNil "save_is_loaded" };


[
	{
		[] call recalculate_caps;

		_new_manpower_used = 0;
		_new_fuel_used = 0;

		{
			if ( ( side group _x == TF47_helper_playerFaction ) && ( !isPlayer _x ) ) then {
				if ( ( _x distance lhd > 450 ) && ( _x distance ( getmarkerpos "respawn_west") > 100 ) && ( alive _x )) then {
					_unit = _x;
					{
						if ( ( _x select 0 ) == typeof _unit ) then {
							_new_manpower_used = _new_manpower_used + (_x select 1);
							_new_fuel_used = _new_fuel_used + (_x select 3);
						};
					} foreach infantry_units;
				};
			};
		} foreach allUnits;

		{
			if ( ( _x distance2D (getMarkerPos "base_chimera") > 500 ) && ( alive _x )) then {
				if (_x getVariable ["TF47_umme", false]  ) then {} else {
    				_unit = _x;
    				{
    					if ( ( _x select 0 ) == typeof _unit ) then {
    						_new_manpower_used = _new_manpower_used + (_x select 1);
    						_new_fuel_used = _new_fuel_used + (_x select 3);
    					};
    				} foreach ( buildings + light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles );
                };
			};
		} foreach vehicles;

		resources_infantry = [EAST,0] call BIS_fnc_respawnTickets; // show them how many respawns there are left;
		resources_fuel = _new_fuel_used;
	},
	0.5,
	[]
] call CBA_fnc_addPerFrameHandler;
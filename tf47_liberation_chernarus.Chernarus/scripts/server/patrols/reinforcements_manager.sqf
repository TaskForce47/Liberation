if ( combat_readiness >= 30 ) then {
	params [ "_targetsector" ];
	_init_units_count = ( ([ getmarkerpos _targetsector , GRLIB_capture_size ,TF47_helper_opposingFaction] call F_getUnitsCount) );

	if ( !(_targetsector in sectors_bigtown)) then {
		while { (_init_units_count * 0.75) <=  ( [ getmarkerpos _targetsector , GRLIB_capture_size ,TF47_helper_opposingFaction] call F_getUnitsCount ) } do {
			sleep 5;
		};
	};
	if ( _targetsector in active_sectors ) then {
		_nearestower = [markerpos _targetsector, TF47_helper_opposingFaction, GRLIB_radiotower_size * 1.4] call F_getNearestTower;
		if ( _nearestower != "" ) then {
			_reinforcements_time = ((((((markerpos _nearestower) distance (markerpos _targetsector)) / 1000) ^ 1.66 ) * 120) / ((GRLIB_difficulty_modifier * ((GRLIB_csat_aggressivity)min( 3 )))))min(120);
			if (_targetsector in sectors_bigtown) then {
				_reinforcements_time = _reinforcements_time * 0.35;
			};
			Waituntil { sleep 1; count (allPlayers select { ((TF47_helper_opposingFaction knowsAbout _x) > 0) && ( _x distance2D (getMarkerPos _targetsector) < 1400) }) > 2  };
			_current_timer = time;
			waitUntil { sleep 0.3; (_current_timer + _reinforcements_time < time) || (_targetsector in blufor_sectors) || (_nearestower in blufor_sectors) };

			sleep 15;

			if ( (_targetsector in active_sectors) && !(_targetsector in blufor_sectors) && !(_nearestower in blufor_sectors) && (!([] call F_isBigtownActive) || _targetsector in sectors_bigtown)  ) then {
			
				reinforcements_sector_under_attack = _targetsector;
				reinforcements_set = true;
				[ [ "lib_reinforcements" , [ markertext  _targetsector ] ] , "bis_fnc_shownotification" ] call BIS_fnc_MP;
				
				
				/************************************************************************************************/
				private _randomValue		=	ceil random 2;
				private _reinforcementWaves	=	floor (combat_readiness/30);
				private _reinforcementType	=	"none";
				
				switch(_randomValue)do{
					case(1):{_reinforcementType	=	"ground";};
					case(2):{_reinforcementType	=	"airCav";};
					default{_reinforcementType	=	"ground";};			
				};
				
				if(_reinforcementType	==	"airCav")then{
					if(	( daytime > 18.40 || daytime < 5.5 ) )then{
						_reinforcementType	=	"airborne";
					};
				};
				
				if(_reinforcementWaves >0)then{
				
					for "_wave" from 1 to _reinforcementWaves do{
					
						switch(_reinforcementType)do{
						
							case("ground"):{	[ _targetsector ] spawn TF47_fnc_sendGroundsupport;	};
							case("airCav"):{	[ _targetsector ] spawn send_paratroopers;			};
							case("airborne"):{	[ _targetsector ] spawn TF47_battlegroup_spawnDropship;	};
						
						
						};
						sleep 15;
					};

				};
							
				stats_reinforcements_called = stats_reinforcements_called + 1;
				/************************************************************************************************/
	
			};
		};
	};
};
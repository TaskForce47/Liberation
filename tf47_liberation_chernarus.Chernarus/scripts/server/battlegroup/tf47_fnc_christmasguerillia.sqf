/*

	author: mindbl4ster

	description:

		init random guerillia group to reconquer blufor sectors

	parameter:

		nothing

	return:

		nothing

	example

		na

	notes

		na

*/
#define SVAR(GRP) GRP setVariable ["TF47_BATTLEGROUP_GUERILLIA",true]

private _possibleSectors	=	[];
{
	private _sector	=	_x;
	private _state 	=	true;
	private _pos = getMarkerPos _sector;
	{
		if ( ( _pos distance2D _x ) < 2000 )then{
			_state = false;
		};
	}forEach allPlayers;

	{
		if ( ( _pos distance2D _x ) < 2000 )then{
			_state = false;
		};
	}forEach GRLIB_all_fobs;

	if( _state )then{ _possibleSectors pushBack _sector};
}forEach blufor_sectors;

if( _possibleSectors isEqualTo [] )exitWith{};
private _attackSector = getMarkerPos (selectRandom _possibleSectors);
private _unitsToSpawn = GRLIB_battlegroup_cap - ( [] call F_opforCap );
if( _unitsToSpawn < 10 ) exitWith {};
if( _unitsToSpawn > 36 )then {_unitsToSpawn = 36};
private _squadComposition	= [];
if( isClass (configfile >> "CfgPatches" >> "Chernarus_winter") )then{
	if(	isClass (configfile >> "CfgPatches" >> "RUP_Dinosaurs")	)then{
		date params ["_year","_month","_day","",""];
		if( (_month == 12) && (_day == 24) )then{
			while { _unitsToSpawn >0 }do{
				for "_i" from 1 to 12 do{
					_squadComposition pushBack ( selectRandom ["raptor2_w","raptoraif2_w","raptoraim2_w"] );
				};
				private _grp = createGroup TF47_helper_opposingFaction;
				{
					_grp createUnit [_x, _attackSector, [],50,"NONE"];
					_unitsToSpawn = _unitsToSpawn -1;
				}forEach _squadComposition;
				SVAR(_grp);
				private _ID = [] call F_lessLoadedHC;
				if ( _ID != -1 ) then {
					_grp setGroupOwner _ID;
					[_grp,_attackSector,400] remoteExec ["CBA_fnc_taskPatrol",_ID];
				}else{
					[_grp,_attackSector,400] call CBA_fnc_taskPatrol;
				};
			};
		};
	};
	if(	isClass (configfile >> "CfgPatches" >> "xmas_character") && ( _squadComposition isEqualTo [] ) )then{
		_squadComposition	= [] call F_getAdaptiveSquadComp;
		while{_unitsToSpawn > 0}do{
			private _grp = createGroup TF47_helper_opposingFaction;
			{
				if(_unitsToSpawn <= 0)exitWith{};
				private _unit = _grp createUnit [_x, _attackSector, [],50,"NONE"];
				private _items	=	uniformItems _unit;
				removeUniform _unit;
				_unit addUniform "xmas_santa_ind_uniform";
				_unit  addItemToUniform _items;
				_unitsToSpawn = _unitsToSpawn -1;
			}forEach _squadComposition;
			SVAR(_grp);
			private _ID = [] call F_lessLoadedHC;
			if ( _ID != -1 ) then {
				_grp setGroupOwner _ID;

				[_grp,_attackSector,400] remoteExec ["CBA_fnc_taskPatrol",_ID];
			}else{
				[_grp,_attackSector,400] call CBA_fnc_taskPatrol;
			};
		};
	};
}else{
	_squadComposition	= [] call F_getAdaptiveSquadComp;
	while{_unitsToSpawn > 0}do{
		private _grp = createGroup TF47_helper_opposingFaction;
		{
			if(_unitsToSpawn <= 0)exitWith{};
			_grp createUnit [_x, _attackSector, [],50,"NONE"];
			_unitsToSpawn = _unitsToSpawn -1;
		}forEach _squadComposition;
		SVAR(_grp);
		private _ID = [] call F_lessLoadedHC;
		if ( _ID != -1 ) then {
			_grp setGroupOwner _ID;
			[_grp,_attackSector,400] remoteExec ["CBA_fnc_taskPatrol",_ID];
		}else{
			[_grp,_attackSector,400] call CBA_fnc_taskPatrol;
		};
	};
	if(random 3 > 2)then{
		private _classname = if(combat_readiness < 40)then{selectRandom opfor_vehicles_low_intensity}else{selectRandom opfor_vehicles};
		private _veh = createVehicle [_classname, _attackSector, [], 100, "NONE"];
		createVehicleCrew _veh;
		SVAR((group ((crew _veh) select 0)));
		[(group ((crew _veh) select 0)),_attackSector,400] call CBA_fnc_taskPatrol;
	};
};

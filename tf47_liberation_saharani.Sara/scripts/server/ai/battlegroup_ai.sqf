params	[
	["_grp",grpNull],
	["_infantry",false],
	["_type","AIR"]
];
if(_grp	==	grpNull)exitWith{
//some debug information
};

if (isNil "reset_battlegroups_ai" ) then { reset_battlegroups_ai = false };

PRIVATE _objectivepos = ([getpos (leader _grp), _type] call F_getNearestBluforObjective) select 0;

[ [ _objectivepos ] , "remote_call_incoming" ] call BIS_fnc_MP;

while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};

[_grp, _objectivepos, 500] call CBA_fnc_taskAttack;
				
PRIVATE _sleep 	=	5;
[
	{
		IF(( count units _grp != 0 ) && ( GRLIB_endgame == 0 ))THEN{
		
			// give the group a new objective and warn the players
			IF(	reset_battlegroups_ai	)THEN{
			
				reset_battlegroups_ai = false;
				PRIVATE _objectivepos = ([getpos (leader _grp), _type] call F_getNearestBluforObjective) select 0;
				[ [ _objectivepos ] , "remote_call_incoming" ] call BIS_fnc_MP;
				while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
				[_grp, _objectivepos, 500] call CBA_fnc_taskAttack;
			
			};

		}ELSE{
			
			reset_battlegroups_ai = false;
			[_this select 1] call CBA_fnc_removePerFrameHandler;
		
		};
	},
	_sleep,
	[]
] call CBA_fnc_addPerFrameHandler;
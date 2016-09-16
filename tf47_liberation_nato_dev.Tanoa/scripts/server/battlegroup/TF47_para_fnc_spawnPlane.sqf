params [
	["_poi",[]],					// pos
	["_start",[]],
	["_ende",[]],
	["_debug",false]
];


/*******************************************************/

if(count _poi	==	0)exitWith{

	diag_log "[ FAIL ] TF47 PARA FNC SPAWNPLANE: No location for paradrop given, exiting function!";
	false;
	
};

if(count _start	== 0)then{
	//replace parameterstartpoint with system air spawnpoint
	_start = getMarkerPos (	( [ sectors_airspawn , [ _poi ] , { (markerpos _x) distance _input0 }, "ASCEND"] call BIS_fnc_sortBy ) select 0);
	
};

if(count _ende == 0)then{

	// replace despawnpoint with system air spawnpoint furthest away
	_ende = getMarkerPos (	( [ sectors_airspawn , [ _poi ] , { (markerpos _x) distance _input0 }, "DESCEND"] call BIS_fnc_sortBy ) select 0);

};

private _nearestOpforPoint	=	[];
private _distance	=	1000000;
private _min		= 	1000;
private _bullseye	=	+_poi;
{
	private _temp	=	(markerPos _x) distance _poi;
	if(	(_temp < _distance) && (_distance > _min)	)then{_distance = _temp; _nearestOpforPoint	=	(markerPos _x);};

}forEach sectors_opfor;
_poi	=	_nearestOpforPoint;


/*******************************************************/
/*		saftyfeature
/*******************************************************/
private _dir 	=	-(_start getDir	_poi);
private _safety	=	count entities "RHS_C130J";
//modify height for proper air spawn
_start	set	[0,	(	(_start select 0)+sin(_dir)*(_safety*200) )];
_start	set	[1,	(	(_start select 1)+cos(_dir)*(_safety*200) )];	
_start	set	[2,	600];	

/*******************************************************/
/*		spawn plane
/*******************************************************/
private _air	=	createVehicle ["RHS_Mi8mt_Cargo_vdv" ,_start, [],0,"FLY"];
_air setPos _start;
createVehicleCrew	_air;
_air setVectorDir [sin(_dir),cos(_dir),0];
_air setVelocity [-sin(_dir)*50, -cos(_dir)*50,5]; // armalogic
_air engineOn true;
private _grp	=	group ((crew _air) select 0 );
_grp addvehicle _air;
_grp setCombatMode "BLUE";
{
	_x setvariable ["NOAI",true];
	_x disableAi "AUTOCOMBAT";
}forEach units _grp;
_air	flyInHeightASL	[500,500,500];

/*******************************************************/
/*		add waypoints for plane
/*******************************************************/
while {count (waypoints _grp) > 0} do {    deleteWaypoint ((waypoints _grp	) select 0);  };  

private _wp = _grp addwaypoint [[(_poi select 0)+sin(_dir)*(_safety*200), (_poi select 1)+cos(_dir)*(_safety*200)],0,0,""];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 500;
_wp setWaypointSpeed "FULL";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointCombatMode "BLUE";

_wp = _grp addwaypoint [[(_ende select 0)+sin(_dir)*(_safety*200), (_ende select 1)+cos(_dir)*(_safety*200)],0,1,""];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 500;
_wp setWaypointSpeed "FULL";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointCombatMode "BLUE";

_wp = _grp addwaypoint [[(_ende select 0)+sin(_dir)*(_safety*200), (_ende select 1)+cos(_dir)*(_safety*200)],0,2,""];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 500;
_wp setWaypointSpeed "FULL";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointCombatMode "BLUE";

_grp setCurrentWaypoint [_grp,0];

if(_debug)then{
	{
		_str	=	format ["mib_locationOfInterest_nr_%1",_x];
		_mkr		=	createMarkerLocal [_str, _x];
		_mkr	setMarkerShapelocal "ICON";
		_mkr	setMarkerTypeLocal "hd_dot";
		_mkr 	setMarkerAlphaLocal 0.3;
		_mkr 	setMarkerTextlocal format ["%1", _x];
		_mkr	setMarkerTextLocal	format ["Airdrop_%1",_forEachIndex];
	}forEach [_poi,_start,_ende];
	_air spawn {
			
		_str	=	format ["mib_air_nr_%1",_this];
		_mkr	=	createMarkerLocal [_str, getpos _this];
		_mkr	setMarkerShapelocal "ICON";
		_mkr	setMarkerTypeLocal "hd_dot";
		_mkr 	setMarkerAlphaLocal 1;

		while{alive _this}do{

			_mkr setMarkerTextLocal format ["Höhe: %1",ceil ((getPos _this) select 2)];
			_mkr setMarkerPoslocal (getpos _this);
			sleep 0.5;
			
		};
		deleteMarker _mkr;
	};
};

/*******************************************************/
/*		spawn inf to drop out of cargo
/*******************************************************/
private _cargo	=	[];
private _unitsToDrop	=	[];

for "_i" from 0 to 1 do{

	private _grpInf	=	createGroup TF47_helper_opposingFaction;
	private _sqComp =  [] call F_getAdaptiveSquadComp;
	private _sqSize	=	(count _sqComp) -1;

	{
		
		private _unit =	_grpInf createUnit [	_x, [0,0,100000],	[],	1000, "NONE"	];
		_unit enableSimulationGlobal false;
		_unitsToDrop	pushBack	_unit;
		sleep 0.25;
	}forEach _sqComp;
	_cargo pushBack _grpInf;
	
	while {count (waypoints _grpInf) > 0} do {    deleteWaypoint ((waypoints _grpInf	) select 0);  }; 
	if ( local _grpInf ) then {
		_headless_client = [] call F_lessLoadedHC;
		if ( !isNull _headless_client ) then {
			_grpInf setGroupOwner ( owner _headless_client );
		};
	};
	
};

{
	_x leaveVehicle _air;
	_x addwaypoint [_bullseye,0,0,""];
	[_x,0] setWaypointBehaviour "COMBAT";
	[_x,0] setWaypointType "SAD";
	_x setVariable ["TF47_battlegroup_isBattlegroup",true];
	_x setCombatMode "RED";
	
}forEach _cargo;

waituntil{ ((_air	distance2D _poi) <250) || !(alive _air)};

if(!alive _air)exitWith{

	{deleteVehicle _x;}forEach _unitsToDrop;
	
};
private _distancePlane = 100;
{

	TF47_helper_paratrooperJumpInit	pushBackUnique	_x;
	(getPos _air) params ["_dx","_dy","_dz"];
	(vectorDir _air) params ["_dirX","_dirY","_dirZ"];
	private _pos = [
				_dx	-(_dirX*_distancePlane) +1*((-1)^_forEachIndex)*_dirX*10,
				_dy	-(_dirY*_distancePlane) -1*((-1)^_forEachIndex)*_dirY*10,
				_dz 
			];
	_x enableSimulationGlobal true;
	
	if(_debug)then{
		_str	=	format ["mib_locationOfdropout_nr_%1",_forEachIndex];
		_mkr		=	createMarkerLocal [_str, _pos];
		_mkr	setMarkerShapelocal "ICON";
		_mkr	setMarkerTypeLocal "hd_dot";
		_mkr 	setMarkerAlphaLocal 0.3;
		_mkr 	setMarkerTextlocal format ["%1", _x];
		_mkr	setMarkerTextLocal	format ["%1",_forEachIndex];
	
	};
	_x setpos _pos;
	_x setVelocity [0,0,0]; 
	sleep 0.1;
	
}forEach _unitsToDrop;

_grp	=	group ((crew _air) select 0 );
_grp setCurrentWaypoint [_grp,1];
deleteWaypoint [_grp,0];

waituntil{ ((_air	distance2D _ende) < 350) || !(alive _air)};

if(alive _air)then{	
	{deleteVehicle _x}foreach([_air]+(crew _air));
};

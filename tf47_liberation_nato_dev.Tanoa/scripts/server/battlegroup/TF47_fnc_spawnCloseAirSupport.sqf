/*
	Parameter:
	0:	ARRAY	-	Position
	1:	NUMBER	-	cycles between start and end 
*/
params [ 
	["_input",[],[[],""]],
	["_sweeps",1]
];
private _bullseye = [];
if (	_input isequalType ""	)then{	_bullseye = getMarkerPos _input;	};

if(	count _bullseye != 3 && !(_bullseye isEqualTo [0,0,0]) )exitWith{

	diag_log "[ FAIL ] TF47 FNC COMBATAIRPATROL: No bullseye given, exiting function!";
	false;

};

private ["_planes_number","_plane_type","_grp","_air_spawnpos","_air","_ende"];

_air_spawnpos = markerPos (	( [ sectors_airspawn , [ _bullseye ] , { (markerpos _x) distance _input0 }, "ASCEND"] call BIS_fnc_sortBy ) select 0);
_ende = markerPos(	( [ sectors_airspawn , [ _bullseye ] , { (markerpos _x) distance _input0 }, "DESCEND"] call BIS_fnc_sortBy ) select 0);

_air_spawnpos = 
[
	(((_air_spawnpos select 0) + 500) - random 1000),
	(((_air_spawnpos select 1) + 500) - random 1000),
	1000
];

_plane_type = "RHS_Su25SM_vvsc";

if(isclass (configfile >> "CfgPatches" >> "JS_JC_SU35"))then{_plane_type	=	"js_jc_su35";};
_air = createVehicle [_plane_type, _air_spawnpos, [], 0, "NONE"];
createVehicleCrew _air;
/**************************************************************************************************/
if(_plane_type isEqualTo "js_jc_su35")then{
	_air removeWeapon "js_w_su35_r73Laucher"; 
	_air removeWeapon "js_w_su35_r77Laucher"; 
	_air removeWeapon "js_w_su35_kh29Launcher";
	_air removeWeapon "js_w_su35_s8Laucher";
	_air removeWeapon "js_w_su35_kab500lLaucher";
	_air removeWeapon "js_w_su35_fueltank_holder";

	_air removeMagazines "js_m_su35_r73_x1"; 
	_air removeMagazines "js_m_su35_r77_x1";
	_air removeMagazines "js_m_su35_kh29_x1";
	_air removeMagazines "js_m_su35_S8_rocket_x1";
	_air removeMagazines "js_m_su35_S8_rocketpod_x1";
	_air removeMagazines "js_m_su35_S8_rocketpod_x2";
	_air removeMagazines "js_m_su35_kab500l_x1";
	_air removeMagazines "js_m_su35_wing_tank_x1";
	_air removeMagazines "js_m_su35_buddypod_x1";
	_air removeMagazines "js_m_su35_empty";
	_air removeMagazines "js_m_su35_fake_empty";

	private _cap	=	["js_m_su35_r73_x1", "js_m_su35_r73_x1", "js_m_su35_r77_x1", "js_m_su35_r77_x1", "js_m_su35_S8_rocketpod_x2", "js_m_su35_S8_rocketpod_x2", "js_m_su35_kh29_x1", "js_m_su35_kh29_x1", "js_m_su35_S8_rocketpod_x1", "js_m_su35_S8_rocketpod_x1", "js_m_su35_kh29_x1", "js_m_su35_kh29_x1"];
	{_air addmagazine _x}forEach _cap;
	_air setObjectTextureGlobal [0, "\js_jc_su35\data\Su35_hull_SKY_co.paa"];      
	_air setObjectTextureGlobal [1, "\js_jc_su35\data\Su35_misc_sky_co.paa"];
	_air animate ["paint_scheme_switch",0.25];
};
/**************************************************************************************************/

_air = createVehicle [_plane_type, _air_spawnpos, [], 0, "NONE"];
createVehicleCrew _air;

private _dir 	=	-(_air_spawnpos getDir	_bullseye);
_air setVectorDir [sin(_dir),cos(_dir),0];
_air setVelocity [-sin(_dir)*50, -cos(_dir)*50,0]; // armalogic

_grp	=	group ((crew _air) select 0);
//{_x setvariable ["NOAI",true];}forEach units _grp;
_air flyInHeightASL [500, 500, 400];

sleep 0.5;
while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};

for "_i" from 0 to _sweeps do {

	_grp addwaypoint [_bullseye,0,_i,""];
	[_grp,_i] setWaypointBehaviour "COMBAT";
	[_grp,_i] setWaypointType "MOVE";

	_grp addwaypoint [_ende,0,(_i +1),""];
	[_grp,(_i +1)] setWaypointBehaviour "COMBAT";
	[_grp,(_i +1)] setWaypointType "MOVE";
	
	_grp addwaypoint [_air_spawnpos,0,(_i +2),""];
	[_grp,(_i +2)] setWaypointBehaviour "COMBAT";
	[_grp,(_i +2)] setWaypointType "MOVE";
	
};


[ "TF47_planeIncoming"] call BIS_fnc_showNotification;

waitUntil{!(alive _air) || (armor_weight < 50)};
sleep 300;
if(alive _air)then{
	{deleteVehicle _x}foreach([_air]+(crew _air))
};
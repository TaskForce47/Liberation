GRLIB_removefobboxes = false;

waitUntil { !isNil "build_confirmed" };
waitUntil { !isNil "one_synchro_done" };
waitUntil { one_synchro_done };
TF47_ADDACTIONS_SAVE	=	[
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1
];
if(isnil "tf47_mission_arsenalControl")then{tf47_mission_arsenalControl = true};

[
{
	TF47_ADDACTIONS_SAVE params [
		"_idact_build",
		"_idact_arsenal",
		"_idact_buildfob",
		"_idact_redeploy",
		"_idact_tutorial",
		"_idact_squad",
		"_idact_commander",
		"_idact_repackage",
		"_idact_halo",
		"_idact_secondary"
	];
	private _distfob = 100;
	private _distarsenal = 5;
	private _distbuildfob = 10;
	private _distspawn	=	10;
	private _distredeploy = 25;
	private _nearfob =	[] call F_getNearestFob;
	private _fobdistance = 9999;
	private _alive	=	alive player && vehicle player == player;	
	private _p2fobD	=	player distance (getMarkerPos "respawn_west");
	if ( count _nearfob == 3 ) then {
		_fobdistance = player distance _nearfob;
	};

	//_neararsenal 	= [];
	_nearfobbox 	= (getpos player) nearEntities [[ FOB_truck_typename, FOB_box_typename ] , _distbuildfob ];
	//_nearspawn 		= [];

	if ( GRLIB_removefobboxes ) then {
		GRLIB_removefobboxes = false;
		if ( count _nearfobbox > 0 ) then {
			deletevehicle (_nearfobbox select 0);
		};
	};

	if ( (_fobdistance < _distredeploy ||   _p2fobD < 200) &&  _alive  ) then {
		if ( _idact_tutorial == -1 ) then {
			_idact_tutorial = player addAction ["<t color='#80FF80'>" + localize "STR_TUTO_ACTION" + "</t>","howtoplay = 1","",-740,false,true,"",""];
		};
	} else {
		if ( _idact_tutorial != -1 ) then {
			player removeAction _idact_tutorial;
			_idact_tutorial = -1;
		};
	};


	if ( (_fobdistance < _distredeploy ||   _p2fobD < 200) &&  _alive  && tf47_mission_arsenalControl) then {
		if (_idact_arsenal == -1) then {
			_idact_arsenal = player addAction ["<t color='#FFFF00'>" + localize "STR_ARSENAL_ACTION" + "</t> <img size='2' image='res\ui_arsenal.paa'/>",
			"[_this select 1] execVM 'scripts\client\actions\open_arsenal.sqf'",
			"",-980,true,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_arsenal != -1 ) then {
			player removeAction _idact_arsenal;
			_idact_arsenal = -1;
		};
	};

	if ( 	((_fobdistance < _distfob) || ( _p2fobD<_distfob)) &&  _alive  	&& 			(TF47_PERMISSION_BUILDER || TF47_PERMISSION_JTFC || [] call F_isAdmin )		) then {
		if ( _idact_build == -1 ) then {
			_idact_build = player addAction ["<t color='#FFFF00'>" + localize "STR_BUILD_ACTION" + "</t> <img size='2' image='res\ui_build.paa'/>","scripts\client\build\open_build_menu.sqf","",-985,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_build != -1 ) then {
			player removeAction _idact_build;
			_idact_build = -1;
		};
	};

	if ( count _nearfobbox != 0 &&  _alive  && !(surfaceIsWater getpos player) && (_p2fobD > 1000) &&  (TF47_PERMISSION_BUILDER || TF47_PERMISSION_JTFC || [] call F_isAdmin) )then {
		if ( _idact_buildfob == -1 ) then {
			_idact_buildfob = player addAction ["<t color='#FFFF00'>" + localize "STR_FOB_ACTION" + "</t> <img size='2' image='res\ui_deployfob.paa'/>","scripts\client\build\do_build_fob.sqf","",-990,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_buildfob != -1 ) then {
			player removeAction _idact_buildfob;
			_idact_buildfob = -1;
		};
	};

	if ( (leader group player == player) && (count units group player > 1) &&  _alive ) then {
		if ( _idact_squad == -1 ) then {
			_idact_squad = player addAction ["<t color='#80FF80'>" + localize "STR_SQUAD_MANAGEMENT_ACTION" + "</t> <img size='2' image='\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa'/>","scripts\client\ui\squad_management.sqf","",-760,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_squad != -1 ) then {
			player removeAction _idact_squad;
			_idact_squad = -1;
		};
	};
	/*
	if ( (( TF47_PERMISSION_JTFC )) || ([] call F_isAdmin)) &&  _alive  && GRLIB_permissions_param ) then {
		if ( _idact_commander == -1 ) then {
			_idact_commander = player addAction ["<t color='#FF8000'>" + localize "STR_COMMANDER_ACTION" + "</t> <img size='2' image='\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa'/>","scripts\client\commander\open_permissions.sqf","",-995,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_commander != -1 ) then {
			player removeAction _idact_commander;
			_idact_commander = -1;
		};
	};
	*/
	if (  (_fobdistance < _distredeploy)  && ( _alive ) && (TF47_PERMISSION_JTFC || [] call F_isAdmin)  ) then {
		if ( _idact_repackage == -1 ) then {
			_idact_repackage = player addAction ["<t color='#FFFF00'>" + localize "STR_FOB_REPACKAGE" + "</t> <img size='2' image='res\ui_deployfob.paa'/>","scripts\client\actions\do_repackage_fob.sqf","",-991,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_repackage != -1 ) then {
			player removeAction _idact_repackage;
			_idact_repackage = -1;
		};
	};

	if (alive player)then {
		if ( _idact_secondary == -1 ) then {
			_idact_secondary = player addAction ["<t color='#FFFF00'>" + localize "STR_SECONDARY_OBJECTIVES" + "</t>","scripts\client\ui\secondary_ui.sqf","",-993,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_secondary != -1 ) then {
			player removeAction _idact_secondary;
			_idact_secondary = -1;
		};
	};
	TF47_ADDACTIONS_SAVE =[ 
		_idact_build,
		_idact_arsenal,
		_idact_buildfob,
		_idact_redeploy,
		_idact_tutorial,
		_idact_squad,
		_idact_commander,
		_idact_repackage,
		_idact_halo,
		_idact_secondary
	];
},
1,
[]
] call CBA_fnc_addPerFrameHandler;
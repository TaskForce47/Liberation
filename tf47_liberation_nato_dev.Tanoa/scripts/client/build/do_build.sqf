private [ "_maxdist", "_truepos", "_built_object_remote", "_pos", "_grp", "_classname", "_idx", "_unitrank", "_posfob", "_ghost_spot", "_vehicle", "_dist", "_actualdir", "_near_objects", "_near_objects_25", "_debug_colisions" ];

build_confirmed = 0;
_maxdist = GRLIB_fob_range;
_truepos = [];
_debug_colisions = false;

GRLIB_preview_spheres = [];
while { count GRLIB_preview_spheres < 36 } do {
	GRLIB_preview_spheres pushback ( "Sign_Sphere100cm_F" createVehicleLocal [ 0, 0, 0 ] );
};

{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;

if (isNil "manned") then { manned = false };
if (isNil "gridmode" ) then { gridmode = 0 };
if (isNil "repeatbuild" ) then { repeatbuild = false };
if (isNil "build_rotation" ) then { build_rotation = 0 };

waitUntil { sleep 0.2; !isNil "dobuild" };

while { true } do {
	waitUntil { sleep 0.2; dobuild != 0 };

	build_confirmed = 1;
	build_invalid = 0;
	_classname = "";
	if ( buildtype == 99 ) then {
		GRLIB_removefobboxes = true;
		_classname = FOB_typename;
	} else {
		_classname = ((build_lists select buildtype) select buildindex) select 0;
		_price = ((build_lists select buildtype) select buildindex) select 2;
		[ [ _price, _classname, buildtype ] , "build_remote_call" ] call BIS_fnc_MP;
	};

	if(buildtype == 1) then {
		_pos = [(getpos player select 0) + 1,(getpos player select 1) + 1, 0];
		_grp = group player;
		if ( manned ) then {
			_grp = createGroup TF47_helper_playerFaction;
		};
		_classname createUnit [_pos, _grp,"", 0.5, "private"];
		build_confirmed = 0;

	} else {
		if ( buildtype == 8 ) then {
			_pos = [(getpos player select 0) + 1,(getpos player select 1) + 1, 0];
			_grp = createGroup TF47_helper_playerFaction;
			_grp setGroupId [format ["%1 %2",squads_names select buildindex, groupId _grp]];
			_idx = 0;
			{
				_unitrank = "private";
				if(_idx == 0) then { _unitrank = "sergeant"; };
				if(_idx == 1) then { _unitrank = "corporal"; };
				_x createUnit [_pos, _grp,"", 0.5, _unitrank];
				_idx = _idx + 1;

			} foreach _classname;
			_grp setBehaviour "AWARE";
			[_grp,(getpos leader _grp)] call BIS_fnc_taskDefend;
			build_confirmed = 0;
		} else {
			_posfob = getpos player;
			if (buildtype != 99) then {
				_posfob = [] call F_getNearestFob;
			};

			_idactcancel = -1;
			_idactsnap = -1;
			_idactplacebis = -1;
			if (buildtype != 99 ) then {
				_idactcancel = player addAction ["<t color='#B0FF00'>" + localize "STR_CANCEL" + "</t> <img size='2' image='res\ui_cancel.paa'/>","scripts\client\build\build_cancel.sqf","",-725,false,true,"","build_confirmed == 1"];
			};
			if (buildtype == 6 ) then {
				_idactplacebis = player addAction ["<t color='#B0FF00'>" + localize "STR_PLACEMENT_BIS" + "</t> <img size='2' image='res\ui_confirm.paa'/>","scripts\client\build\build_place_bis.sqf","",-785,false,false,"","build_invalid == 0 && build_confirmed == 1"];
			};
			if (buildtype == 6 || buildtype == 99) then {
				_idactsnap = player addAction ["<t color='#B0FF00'>" + localize "STR_GRID" + "</t>","scripts\client\build\do_grid.sqf","",-735,false,false,"","build_confirmed == 1"];
			};
			_idactrotate = player addAction ["<t color='#B0FF00'>" + localize "STR_ROTATION" + "</t> <img size='2' image='res\ui_rotation.paa'/>","scripts\client\build\build_rotate.sqf","",-750,false,false,"","build_confirmed == 1"];
			_idactplace = player addAction ["<t color='#B0FF00'>" + localize "STR_PLACEMENT" + "</t> <img size='2' image='res\ui_confirm.paa'/>","scripts\client\build\build_place.sqf","",-775,false,true,"","build_invalid == 0 && build_confirmed == 1"];
			if (_classname in ["Land_HelipadCircle_F", "Land_HelipadCivil_F", "Land_HelipadEmpty_F", "Land_HelipadRescue_F", "Land_HelipadSquare_F", "Land_JumpTarget_F", "Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V3_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V2_F"]) then {
				hintC "Please be sure where to place this building. You can't remove it.";
			};
			_ghost_spot = (getmarkerpos "ghost_spot") findEmptyPosition [0,100];

			_vehicle = _classname createVehicleLocal _ghost_spot;
			_vehicle allowdamage false;
			_vehicle setVehicleLock "LOCKED";
			_vehicle enableSimulationGlobal false;

			_dist = 0.6 * (sizeOf _classname);
			if (_dist < 3.5) then { _dist = 3.5 };
			_dist = _dist + 0.5;

			for [{_i=0}, {_i<5}, {_i=_i+1}] do {
				_vehicle setObjectTextureGlobal [_i, '#(rgb,8,8,3)color(0,1,0,0.8)'];
			};

			{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;

			while { build_confirmed == 1 && alive player } do {
				_truedir = 90 - (getdir player);
				_truepos = [((getpos player) select 0) + (_dist * (cos _truedir)), ((getpos player) select 1) + (_dist * (sin _truedir)),0];
				_actualdir = ((getdir player) + build_rotation);
				if ( _classname == "Land_Cargo_Patrol_V1_F" || _classname == "Land_PortableLight_single_F" ) then { _actualdir = _actualdir + 180 };
				if ( _classname == FOB_typename ) then { _actualdir = _actualdir + 270 };

				while { _actualdir > 360 } do { _actualdir = _actualdir - 360 };
				while { _actualdir < 0 } do { _actualdir = _actualdir + 360 };
				if ( ((buildtype == 6) || (buildtype == 99)) && ((gridmode % 2) == 1) ) then {
					if ( _actualdir >= 22.5 && _actualdir <= 67.5 ) then { _actualdir = 45 };
					if ( _actualdir >= 67.5 && _actualdir <= 112.5 ) then { _actualdir = 90 };
					if ( _actualdir >= 112.5 && _actualdir <= 157.5 ) then { _actualdir = 135 };
					if ( _actualdir >= 157.5 && _actualdir <= 202.5 ) then { _actualdir = 180 };
					if ( _actualdir >= 202.5 && _actualdir <= 247.5 ) then { _actualdir = 225 };
					if ( _actualdir >= 247.5 && _actualdir <= 292.5 ) then { _actualdir = 270 };
					if ( _actualdir >= 292.5 && _actualdir <= 337.5 ) then { _actualdir = 315 };
					if ( _actualdir <= 22.5 || _actualdir >= 337.5 ) then { _actualdir = 0 };
				};

				_sphere_idx = 0;
				{
					_x setpos ( [ _truepos, _dist, _sphere_idx * 10 ] call BIS_fnc_relPos );
					_sphere_idx = _sphere_idx + 1;
				} foreach GRLIB_preview_spheres;

				_vehicle setdir _actualdir;

				_near_objects = (_truepos nearobjects ["AllVehicles", _dist]) ;
				_near_objects = _near_objects + (_truepos nearobjects [FOB_box_typename, _dist]);
				_near_objects = _near_objects + (_truepos nearobjects [Arsenal_typename, _dist]);

				_near_objects_25 = (_truepos nearobjects ["AllVehicles", 50]) ;
				_near_objects_25 = _near_objects_25 + (_truepos nearobjects [FOB_box_typename, 50]);
				_near_objects_25 = _near_objects_25 + (_truepos nearobjects [Arsenal_typename, 50]);

				if(	buildtype != 6 ) then {
					_near_objects = _near_objects + (_truepos nearobjects ["Static", _dist]);
					_near_objects_25 = _near_objects_25 + (_truepos nearobjects ["Static", 50]);
				};

				private _remove_objects = [];
				{
					if ((_x isKindOf "Animal") || ((typeof _x) in GRLIB_ignore_colisions_when_building) || (_x == player) || (_x == _vehicle )) then {
						_remove_objects pushback _x;
					};
				} foreach _near_objects;

				private _remove_objects_25 = [];
				{
					if ((_x isKindOf "Animal") || ((typeof _x) in GRLIB_ignore_colisions_when_building) || (_x == player) || (_x == _vehicle ))  then {
						_remove_objects_25 pushback _x;
					};
				} foreach _near_objects_25;

				_near_objects = _near_objects - _remove_objects;
				_near_objects_25 = _near_objects_25 - _remove_objects_25;

				if ( count _near_objects == 0 ) then {
					{
						_dist22 = 0.6 * (sizeOf (typeof _x));
						if ( _dist22 < 1 ) then { _dist22 = 1 };
						if (_truepos distance _x < _dist22) then {
							_near_objects pushback _x;
						};
					} foreach _near_objects_25;
				};

				if ( count _near_objects != 0 ) then {
					GRLIB_conflicting_objects = _near_objects;
				} else {
					GRLIB_conflicting_objects = [];
				};

				if (count _near_objects == 0 && ((_truepos distance _posfob) < _maxdist) && (  ((!surfaceIsWater _truepos) && (!surfaceIsWater getpos player)) || (_classname in boats_names) ) ) then {

					if ( ((buildtype == 6) || (buildtype == 99)) && ((gridmode % 2) == 1) ) then {
						_vehicle setpos [round (_truepos select 0),round (_truepos select 1), _truepos select 2];
					} else {
						_vehicle setpos _truepos;
					};
					if ( buildtype == 6 || buildtype == 99 ) then {
						_vehicle setVectorUp [0,0,1];
					} else {
						_vehicle setVectorUp surfaceNormal position _vehicle;
					};
					if(build_invalid == 1) then {
						GRLIB_ui_notif = "";
						{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;
					};
					build_invalid = 0;

				} else {
					if ( build_invalid == 0 ) then {
						{ _x setObjectTexture [0, "#(rgb,8,8,3)color(1,0,0,1)"]; } foreach GRLIB_preview_spheres;
					};
					_vehicle setpos _ghost_spot;
					build_invalid = 1;
					if(count _near_objects > 0) then {
						GRLIB_ui_notif = format [localize "STR_PLACEMENT_IMPOSSIBLE",count _near_objects, round _dist];

						if (_debug_colisions) then {
							private [ "_objs_classnames" ];
							_objs_classnames = [];
							{ _objs_classnames pushback (typeof _x) } foreach _near_objects;
							hint format [ "Colisions : %1", _objs_classnames ];
						};
					};
					if( ((surfaceIsWater _truepos) || (surfaceIsWater getpos player)) && !(_classname in boats_names)) then {
						GRLIB_ui_notif = localize "STR_BUILD_ERROR_WATER";
					};
					if((_truepos distance _posfob) > _maxdist) then {
						GRLIB_ui_notif = format [localize "STR_BUILD_ERROR_DISTANCE",_maxdist];
					};

				};
				sleep 0.05;
			};

			GRLIB_ui_notif = "";

			{ _x setpos [ 0,0,0 ] } foreach GRLIB_preview_spheres;

			if ( !alive player || build_confirmed == 3 ) then {
				deleteVehicle _vehicle;
				[ [ ((build_lists select buildtype) select buildindex) select 2 ] , "cancel_build_remote_call" ] call BIS_fnc_MP;
			};

			if ( build_confirmed == 2 ) then {
				_vehpos = getpos _vehicle;
				_vehdir = getdir _vehicle;
				deleteVehicle _vehicle;
				sleep 0.1;
				_vehicle = _classname createVehicle _truepos;
				(format ["[INFORMATION] %1 ( %2 ) build %3 at %4 at %5", name player, getPlayerUID player, _classname,  mapGridPosition (getPos player), daytime]) remoteExec ["diag_log", 2, false];
				

				if (_classname isKindOf "AllVehicles") then {
					if (_classname isKindOf "AIR") then {
						_EHkilledIdx2 = _vehicle addEventHandler ["Hit", {  (format ["[INFORMATION] Vehicle: %1 ( %2 )  was hit by %3 ( %4 ) . instigator = %5", (_this select 0), typeOf (_this select 0), (_this select 1),typeOf (_this select 1),  (_this select 3), typeOf (vehicle (_this select 3)) ]) remoteExec ["diag_log", 2, false]; }]; 
					};
					_EHkilledIdx1 = _vehicle addEventHandler ["killed", { (format ["[INFORMATION] Vehicle: %1 ( %2 ) was killed by %3 ( %4 ) . instigator = %5 ( %6 ) ", (_this select 0),  typeOf (_this select 0), (_this select 1),typeOf (_this select 1), (_this select 2), typeOf (_this select 2)]) remoteExec ["diag_log", 2, false]; }];
				};
				
				if (_classname == "TargetBootcampHuman_F") then {
					_vehicle setVariable ["rscattributetargetpopupdelay", 10, true];
					_vehicle setvariable ["rscattributetargettexture_textureindex", 2];
				};

				_vehicle allowDamage false;
				_vehicle setdir _vehdir;
				_vehicle setpos _truepos;
				// Assign all MedicVehicles and Faacilitys the ACEE Attribute's
				if (_classname in ["Land_Medevac_HQ_V1_F","O_T_Truck_03_medical_ghex_F","Land_Medevac_house_V1_F","B_Truck_01_medical_F","B_T_Truck_01_medical_F"]) then {
					_vehicle setVariable ["ace_medical_ismedicalfacility", true, true];
					_vehicle setVariable ["Ace_medical_medicClass", 1, true];
				};
				/*
					Automated detection of Supply Vehicles added. No more need for Classname Array's if, mods are build properly 
					( most likly all Mods exept for RHS...)
				*/
				private _isTruck = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "textSingular") == "truck";
				if (_isTruck) then {
					private _Ammocap = getNumber (configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "transportAmmo") > 0;
					private _Fuelcap = getNumber (configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "transportFuel") > 0;
					private _Repaircap = getNumber (configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "transportRepair") > 0;
					/*
						As far as I know, does'nt interfere with the e.g. getRepairCargo. Just with the e.g. transportAmmo.
						But if this changes both Values, we have to deal with some sort of ACE/RHS compatibility. If RHS does something strange and
						ACE does't initialize RHS Vehicles, this should do the trick. and if ACE does we should be on the save side.

						EDIT: This is def. experimental. Not tested in any Way,  as I'm currently unable to do so.
					*/
					switch (true) do {
						case(_Fuelcap):{
							// No Idea if 500 Liters is an good Value. Might need some adjusting.
							[_vehicle] call ace_refuel_fnc_reset;
							[_vehicle, 500] call ace_refuel_fnc_setFuel;
							_vehicle setFuelCargo 0;
						};
						case(getFuelCargo _vehicle isEqualType 0):{
							// No Idea if 500 Liters is an good Value. Might need some adjusting.
							[_vehicle] call ace_refuel_fnc_reset;
							[_vehicle, 500] call ace_refuel_fnc_setFuel;
							_vehicle setFuelCargo 0;
						};
						case(_Repaircap):{
							//ToDo: Find out possible Value's for RepairVehicles from ACE.
							_vehicle setVariable ["ACE_isRepairVehicle", 1, true];
							_vehicle setRepairCargo 0;
							// _x getVariable ["ACE_isRepairFacility",1, true];
						};
						case(getRepairCargo _vehicle isEqualType 0):{ 
							_vehicle setRepairCargo 0;
							_vehicle setVariable ["ACE_isRepairVehicle", 1, true];
						};
						case(_Ammocap):{ 
							//[_vehicle, false] call ace_rearm_fnc_disable;
							[_vehicle, 1000] call ace_rearm_fnc_setSupplyCount;
							_vehicle setAmmoCargo 0;
						};
						case( getAmmoCargo _vehicle isEqualType 0 ):{ 
							//[_vehicle, false] call ace_rearm_fnc_disable;
							[_vehicle, 1000] call ace_rearm_fnc_setSupplyCount;	
							_vehicle setAmmoCargo 0;
						};
					};
				};

				clearWeaponCargoGlobal _vehicle;
				clearMagazineCargoGlobal _vehicle;
				clearItemCargoGlobal _vehicle;
				clearBackpackCargoGlobal _vehicle;
				if ( buildtype == 6 || buildtype == 99 ) then {
					_vehicle setVectorUp [0,0,1];
				} else {
					_vehicle setVectorUp surfaceNormal position _vehicle;
				};
				if ( (_classname in uavs) || manned ) then {
					[ _vehicle ] call F_forceBluforCrew;
				};

				if ( _classname == FOB_box_typename ) then {
					_vehicle enableRopeAttach true;
					[ [_vehicle, 2000 ] , "F_setMass" ] call BIS_fnc_MP;
				};

				sleep 0.3;
				_vehicle allowDamage true;
				_vehicle setDamage 0;

				if(buildtype == 99) then {
					_vehicle addEventHandler ["HandleDamage", { 0 }];
				};

				if(buildtype != 6) then {
					
					

				};
			};

			if ( _idactcancel != -1 ) then {
				player removeAction _idactcancel;
			};
			if ( _idactsnap != -1 ) then {
				player removeAction _idactsnap;
			};
			if ( _idactplacebis != -1 ) then {
				player removeAction _idactplacebis;
			};
			player removeAction _idactrotate;
			player removeAction _idactplace;

			if(buildtype == 99) then {
				_new_fob = getpos player;
				[ [ _new_fob, false ] , "build_fob_remote_call" ] call BIS_fnc_MP;	// call to server
				
				buildtype = 1;
			};

			build_confirmed = 0;
		};
	};

	if ( repeatbuild ) then {
		dobuild = 1;
		repeatbuild = false;
	} else {
		dobuild = 0;
	};
	manned = false;
};
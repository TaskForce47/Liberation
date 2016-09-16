_debug = true;
if (!(_debug)) exitWith { };

_iconed_groups = [];
_ticks = 0;

setGroupIconsSelectable true;
/*
handle1 = addMissionEventHandler ["GroupIconClick",
	{
		
	    _group = _this select 1;
	
		(format ["Units: %1. vehicle: %2", count units _group,  getText (configFile >> "CfgVehicles" >> (typeOf (vehicle (leader _group))) >> "displayName") ]) remoteExec ["Systemchat"]; 
	}
];
*/
while {true} do {
	setGroupIconsVisible [true,true];
	if (isNil "_iconed_groups") then {_iconed_groups = [];};
	if (isNil "_ticks") then {_ticks = 0;};
	{
		if ((_x != group player)) then {
			if ( !(_x in _iconed_groups) && (count units _x > 0)) then {
				clearGroupIcons _x;
				_localgroup = _x;
				
				_groupicon = "b_inf";
				if (side _localgroup == TF47_helper_opposingFaction) then {
					_grouptype = [_localgroup] call F_getGroupType;
					switch (_grouptype) do {
						case "infantry": { _groupicon = "b_inf"; };
						case "light": { _groupicon = "b_motor_inf"; };
						case "heavy": { _groupicon = "b_armor"; };
						case "Helicopter": { _groupicon = "b_air"; };
						case "Plane": { _groupicon = "b_plane"; };
						case "static": { _groupicon = "b_mortar"; };
						case "uav": { _groupicon = "b_uav";  };
						default { _groupicon = "b_inf"; };
					};
				} else {
					if (side _localgroup == TF47_helper_playerFaction ) then {
						_grouptype = [_localgroup] call F_getGroupType;
						switch (_grouptype) do {
							_grouptype = [_localgroup] call F_getGroupType;
							case "infantry": { _groupicon = "o_inf"; };
							case "light": { _groupicon = "o_motor_inf"; };
							case "heavy": { _groupicon = "o_armor"; };
							case "Helicopter": { _groupicon = "o_air"; };
							case "Plane": { _groupicon = "o_plane"; };
							case "static": { _groupicon = "o_mortar"; };
							case "uav": { _groupicon = "o_uav";  };
							default { _groupicon = "o_inf"; };
						};
					};
					if (side _localgroup == resistance) then {
						_grouptype = [_localgroup] call F_getGroupType;
						switch (_grouptype) do {
							_grouptype = [_localgroup] call F_getGroupType;
							case "infantry": { _groupicon = "n_inf"; };
							case "light": { _groupicon = "n_motor_inf"; };
							case "heavy": { _groupicon = "n_armor"; };
							case "Helicopter": { _groupicon = "n_air"; };
							case "Plane": { _groupicon = "n_plane"; };
							case "static": { _groupicon = "n_mortar"; };
							case "uav": { _groupicon = "n_uav";  };
							default { _groupicon = "n_inf"; };
						};
					};
				};
				

				_localgroup addGroupIcon [ _groupicon, [ 0,0 ] ];

				if ( true) then {
					_groupiconsize = "group_0";
					_groupsize = (count (units _localgroup));
					if ( _groupsize >= 2 ) then { _groupiconsize = "group_1" };
					if ( _groupsize >= 6 ) then { _groupiconsize = "group_2" };
					if ( _groupsize >= 10 ) then { _groupiconsize = "group_3" };

					_localgroup addGroupIcon [ _groupiconsize, [ 0,0 ] ];
				};

				_iconed_groups pushback _x;
			};
		};
	} foreach allGroups;

	{
		_color = [0,0,1,1];
		switch(side leader _x)do{
			case(WEST):{
				_color = [0,0,1,1];
			};
			case(EAST):{
				_color = [1,0,0,1];
			};
			case(civilian):{
				_color = [0.4,0,0.4,1];
			};
			case(resistance):{
				_color = [0,0.4,0,1];
			};
		};
		_x setGroupIconParams [_color,"",1,true];
	} foreach _iconed_groups;

	_ticks = _ticks + 1;
	if ( _ticks >= 15 ) then {
		_ticks = 0;
		_iconed_groups = [];
	};
	sleep 10;
};


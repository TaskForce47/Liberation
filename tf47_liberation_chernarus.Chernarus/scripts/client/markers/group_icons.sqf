private [ "_iconed_groups", "_ticks", "_localgroup", "_grouptype", "_groupicon" ];

_iconed_groups = [];
_ticks = 0;

setGroupIconsVisible [true,false];



[
	{
		if (isNil "_iconed_groups") then {_iconed_groups = [];};
		{
			if ((_x != group player) && ((side _x == TF47_helper_playerFaction ))) then {
				if ( (_x in _iconed_groups) && (
					(count units _x == 0) ||  (side _x == TF47_helper_playerFaction && (((leader _x) distance (getmarkerpos "respawn_west") < 100) || ((leader _x) distance lhd < 500))))) then {
					clearGroupIcons _x;
					_iconed_groups = _iconed_groups - [_x];
				};

				if ( !(_x in _iconed_groups) && (
					(count units _x > 0) &&  (side _x == TF47_helper_playerFaction && (((leader _x) distance (getmarkerpos "respawn_west") > 100) && ((leader _x) distance lhd > 500))))) then {
					clearGroupIcons _x;
					_localgroup = _x;
					_grouptype = [_localgroup] call F_getGroupType;
					_groupicon = "";
					switch (_grouptype) do {
						case "infantry": { _groupicon = "b_inf" };
						case "light": { _groupicon = "b_motor_inf" };
						case "heavy": { _groupicon = "b_armor" };
						case "air": { _groupicon = "b_air" };
						case "support": { _groupicon = "b_maint" };
						case "static": { _groupicon = "b_mortar" };
						case "uav": { _groupicon = "b_uav" };
						default {  };
					};

					_localgroup addGroupIcon [ _groupicon, [ 0,0 ] ];

					if ( side _localgroup == TF47_helper_playerFaction ) then {
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
			_color = [];
			if ( isplayer leader _x ) then {
				_color = [0.8,0.8,0,1];
			} else {
				_color = [0,0.3,0.8,1];
			};
			_x setGroupIconParams [_color,"",1,true];
		} foreach _iconed_groups;

		_ticks = _ticks + 1;
		if ( _ticks >= 15 ) then {
			_ticks = 0;
			_iconed_groups = [];
		};
	},
	5,
	[]
] call CBA_fnc_addPerFrameHandler;

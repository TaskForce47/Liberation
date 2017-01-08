[
	{
		{
			private _nextveh = _x;
			if ( alive _nextveh && ( typeOf _nextveh ) in all_hostile_classnames ) then {
				if ( _nextveh getVariable [ "GRLIB_captured", 0 ] == 0 ) then {
					{
						if ( alive _x ) then {
							if ( side group _x == TF47_helper_playerFaction ) exitWith {
								_nextveh setVariable [ "GRLIB_captured", 1, true ];
							};
						};
					} foreach (crew _x);
				};
			};
			if ((typeOf _x) in ["Land_Medevac_HQ_V1_F","Land_Medevac_house_V1_F","B_Truck_01_medical_F","B_T_Truck_01_medical_F"]) then {
				if ((typeof _nextunit) in ["Land_Medevac_HQ_V1_F","Land_Medevac_house_V1_F"]) then {
					_nextunit setVariable ["ace_medical_ismedicalfacility", true, true];
					_nextunit setVariable ["Ace_medical_medicClass", 1, true];
				};
			};
		} foreach vehicles;
	},
	5,
	[]
] call CBA_fnc_addPerFrameHandler;

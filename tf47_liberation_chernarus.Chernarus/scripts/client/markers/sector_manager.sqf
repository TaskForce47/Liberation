private ["_marker", "_nextbase", "_nextvehicle", "_cfg", "_nextmarker" ];

waitUntil { !isNil "sectors_allSectors" };
waitUntil { !isNil "save_is_loaded" };
waitUntil { !isNil "blufor_sectors" };

TF47_vehicle_unlock_markers = [];
_cfg = configFile >> "cfgVehicles";

{
	_nextvehicle = _x select 0;
	_nextbase = _x select 1;
	_marker = createMarkerLocal [format ["vehicleunlockmarker%1",_nextbase], [ markerpos _nextbase select 0, (markerpos _nextbase select 1) + 125]];
	_marker setMarkerTextLocal ( getText (_cfg >> _nextvehicle >> "displayName") );
	_marker setMarkerColorLocal "ColorOPFOR";
	_marker setMarkerTypeLocal "mil_pickup";
	TF47_vehicle_unlock_markers pushback [ _marker, _nextbase ];
	_marker setMarkerAlpha 0.6;
} foreach GRLIB_vehicle_to_military_base_links;


TF47_Sector_count = -1;

uiSleep 1;


[
	{
		if (isNil "TF47_Sector_count") then { TF47_Sector_count = -1; };
		{ _x setMarkerColorLocal "ColorOPFOR";  _x setMarkerAlpha 0.7; } foreach (sectors_allSectors - blufor_sectors);
		{ _x setMarkerColorLocal "ColorBLUFOR"; _x setMarkerAlpha 0.7; } foreach blufor_sectors;

		{
			_nextmarker = _x;
			(_nextmarker select 0) setMarkerColorLocal "ColorOPFOR";
			{
				if ( _x == (_nextmarker select 1) ) exitWith { (_nextmarker select 0) setMarkerColorLocal "ColorBLUFOR"; };
			} foreach blufor_sectors;
		} foreach TF47_vehicle_unlock_markers;
		TF47_Sector_count = count blufor_sectors;
	},
	3,
	[]
] call CBA_fnc_addPerFrameHandler;

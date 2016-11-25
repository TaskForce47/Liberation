private [ "_markers", "_marker", "_idx"];

TF47_FOB_Marker = [];

waitUntil { !isNil "GRLIB_all_fobs" };

uiSleep 3;

[
	{
		if ( count TF47_FOB_Marker != count GRLIB_all_fobs ) then {
		
			{ deleteMarkerLocal _x } foreach TF47_FOB_Marker;
			
			TF47_FOB_Marker = [];
			
			if(	(count GRLIB_all_fobs) > 0 )then{
			
				for "_idx" from 0 to (count GRLIB_all_fobs) do{
					_marker = createMarkerLocal [format ["fobmarker%1",_idx], markers_reset];
					_marker setMarkerTypeLocal "b_hq";
					_marker setMarkerSizeLocal [ 1.5, 1.5 ];
					_marker setMarkerPosLocal (GRLIB_all_fobs select _idx);
					_marker setMarkerTextLocal format ["FOB %1",military_alphabet select _idx];
					_marker setMarkerColorLocal "ColorYellow";
					TF47_FOB_Marker pushback _marker;
				};
				
			};
			
		};
	},
	7,
	[]
] call CBA_fnc_addPerFrameHandler;

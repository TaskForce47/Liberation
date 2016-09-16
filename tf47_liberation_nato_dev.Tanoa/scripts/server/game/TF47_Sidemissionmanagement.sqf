Waituntil {(time > 180) || (!isMultiplayer)};

TF47_side_AAAactive = false;
TF47_side_Artiactive = false;

private _sleep = 300;
if (isMultiplayer)then{
	_sleep = 500;
};
TF47_FobMissionisActive = false;
TF47_SARisActive = false;
TF47_ConvoyHijackisActive = false;
TF47_FobSeaMineisActive = false;
Waituntil {sleep 10; count GRLIB_all_fobs > 0};

[
	{
		if(	([] call F_opforCap < GRLIB_battlegroup_cap) )then{
		
			private  _val = round (random 2);
			private _activeSides	= count TF47_Missionarray;
			if(4 > (TF47_helper_battlegroupSlumber + _activeSides)	)then{
				if(!TF47_side_Artiactive && !TF47_side_AAAactive)then{
					IF(_val	==	0) then {
						if (!TF47_side_Artiactive ) then {
							[]spawn TF47_spawnSideMissionARTY;
						};
					} else {
						if ( !TF47_side_AAAactive ) then {
							[]spawn TF47_spawnSideMissionAAA;
						};
					};
				};

				_allPlayercount = count (allPlayers - entities "HeadlessClient_F");
				if (!isMultiplayer) then { _allPlayercount = 99; };
				
				switch(ceil (random 3))do{
					case(1):{
						if ( (resources_intel > 10) && (!(TF47_FobMissionisActive)) &&  (count TF47_Missionarray < 2)) then {
							[]spawn fob_hunting;
							resources_intel = resources_intel -10;
						};
					};
					case(2):{
						if ( (resources_intel > 10) && (!(TF47_ConvoyHijackisActive))  && (count TF47_Missionarray < 2) && _allPlayercount > 8) then {
							[]spawn convoy_hijack;
							
						};
					};
					case(3):{
						if ( (resources_intel > 10) && (!(TF47_SARisActive))  && (count TF47_Missionarray < 2) && _allPlayercount > 10) then {
							[]spawn search_and_rescue;
							resources_intel = resources_intel -10;
						};
					};
					/*
					case(4):{
						if ( (resources_intel > 15) && (!(TF47_FobSeaMineisActive))  && (count TF47_Missionarray < 4)) then {
							[]spawn TF47_SeaMines;
							resources_intel = resources_intel -15;
						};
					};
					*/
				};				
			};
		};
	},
	_sleep,
	[]
] call CBA_fnc_addPerFrameHandler;
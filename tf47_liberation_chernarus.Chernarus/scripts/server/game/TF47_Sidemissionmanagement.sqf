MyPlacesAA = selectBestPlaces [[9981.85,9991.62,0], 10000, "((2 + 2* meadow) - (1 * forest - 0 * hills ))", 250, 30];

Waituntil {(time > 600) || (!isMultiplayer)};
Waituntil {sleep 30; count GRLIB_all_fobs > 0};

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

[
	{
		if(	([] call F_opforCap < GRLIB_battlegroup_cap) )then{

			private  _val = round (random 2);
			private _activeSides	= count TF47_Missionarray;
			if(4 > (TF47_helper_battlegroupSlumber + _activeSides)	)then{

				_allPlayercount = count (allPlayers - entities "HeadlessClient_F");
				if (!isMultiplayer) then { _allPlayercount = 99; };

				if(!TF47_side_Artiactive && !TF47_side_AAAactive)then{
					IF(true) then {
						if (!TF47_side_Artiactive && _allPlayercount > 15) then {
							[]spawn TF47_spawnSideMissionARTY;
						};
					} else {
						if ( !TF47_side_AAAactive ) then {
							[]spawn TF47_spawnSideMissionAAA;
						};
					};
				};

				switch(ceil (random 3))do{
					case(1):{
						if ( (resources_intel > 10) && (!(TF47_FobMissionisActive)) &&  (count TF47_Missionarray < 2)) then {
							[]spawn fob_hunting;
							resources_intel = resources_intel -10;
						};
					};
					case(2):{
						if ( (resources_intel > 10) && (!(TF47_ConvoyHijackisActive))  && (count TF47_Missionarray < 2) && _allPlayercount > 15) then {
							[]spawn convoy_hijack;

						};
					};
					case(3):{
						if ( (resources_intel > 10) && (!(TF47_SARisActive))  && (count TF47_Missionarray < 2) && _allPlayercount > 15) then {
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

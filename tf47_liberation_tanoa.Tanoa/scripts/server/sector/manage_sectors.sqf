active_sectors = [];

waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "sectors_allSectors" };
waitUntil { !isNil "tf47_mission_sectorlimit"};

while { GRLIB_endgame == 0 } do {

	{
		private [ "_nextsector", "_corrected_sector_size", "_opforcount" ];
		_nextsector = _x;
		_opforcount =  [] call F_opforCap;
		if ( _opforcount < GRLIB_sector_cap ) then {
			if (
				( [ getmarkerpos _nextsector , [ _opforcount ] call F_getCorrectedSectorRange , TF47_helper_playerFaction ] call F_getUnitsCount > 0 ) &&
				!( _nextsector in active_sectors ) &&
				( _nextsector in tf47_mission_sectorlimit)
			) then {
				_ID = [] call F_lessLoadedHC;
				if ( _ID == -1 ) then {
					[ _nextsector ] spawn manage_one_sector;
				} else {
					[ _nextsector ] remoteExec ["manage_one_sector",_ID];
					//[ [ _nextsector ] , "manage_one_sector", _ID ] call BIS_fnc_MP;
				};
				if ( _nextsector in sectors_military ) then {
					[ _nextsector ] call manage_ammoboxes;
				};
			};
		};
		sleep 0.25;
	} foreach ( sectors_allSectors - blufor_sectors );
	// diag_log format [ "Full sector scan at %1, active sectors: %2", time, active_sectors ];
	sleep 1;
};

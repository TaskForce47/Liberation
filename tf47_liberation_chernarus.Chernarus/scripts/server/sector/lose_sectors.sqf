waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "blufor_sectors" };
sleep 5;

attack_in_progress = false;
if (isNil "SectorunderAttack") then {SectorunderAttack = [];};
while {true} do {
	{
		_ownership = [ (markerpos _x ), GRLIB_capture_size + 200] call F_sectorOwnership;
		if ( (_ownership == TF47_helper_opposingFaction)&& !(_x in SectorunderAttack) ) then {
			[ _x ] spawn attack_in_progress_sector;
		};
	} foreach blufor_sectors;
	{
		_ownership = [ _x, 450] call F_sectorOwnership;
		if ( (_ownership == TF47_helper_opposingFaction) && !(_x in SectorunderAttack) ) then {
			[ _x] spawn attack_in_progress_fob; 
		};
	
	} foreach GRLIB_all_fobs;
	sleep 5;
};
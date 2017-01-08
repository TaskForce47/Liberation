
_combat_triggers = [0,20,40,50,65,80,95];
if ( GRLIB_unitcap < 0.9 ) then { _combat_triggers = [20,45,90]; };
if ( GRLIB_unitcap > 1.3 ) then { _combat_triggers = [15,25,40,65,75,85,95]; };

_combat_triggers_infantry = [15,35,45,60,70,85];
if ( GRLIB_unitcap < 0.9 ) then { _combat_triggers_infantry = [15,40,80]; };
if ( GRLIB_unitcap > 1.3 ) then { _combat_triggers_infantry = [10,20,35,55,70,80,90]; };

sleep 5;

waitUntil { sleep 3; !isNil "blufor_sectors" };
waitUntil { sleep 3; count blufor_sectors > 3 };
waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "combat_readiness" };
{
	[
		{	combat_readiness >= ((_this select 0) / GRLIB_difficulty_modifier) && ([] call F_opforCap > GRLIB_patrol_cap)	}, 
		{	[(_this select 0), (_this select 1)]call manage_one_patrol;	}, 
		[_x, false]
	] call CBA_fnc_waitUntilAndExecute;
} foreach _combat_triggers;

{
	[
		{	combat_readiness >= ((_this select 0) / GRLIB_difficulty_modifier) && ([] call F_opforCap > GRLIB_patrol_cap)	}, 
		{	[(_this select 0), (_this select 1)]call manage_one_patrol;	}, 
		[_x, true]
	] call CBA_fnc_waitUntilAndExecute;
} foreach _combat_triggers_infantry;
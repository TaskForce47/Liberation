disableSerialization;
[
	[] call bis_fnc_displayMission,
	[getPos player select 0, getPos player select 1],
	TF47_Missionarray,
	[],
	[],
	[],
	1,
	false,
	2,
	true,
	"Mission overview",
	true
] call BIS_fnc_StrategicMapOpen;


if(isclass (configfile >> "CfgPatches" >> "task_force_radio")	)then{

	// Call TFAR settings
	tf_radio_channel_name = "Radio Communication - Public I";
	tf_radio_channel_password = "India65";
	tf_freq_west_lr = 31;
	TFAR_defaultFrequencies_lr_west = 31;
	tf_freq_west = 31;
	// TFAR-Basic settings (will override userconfig settings)
	tf_no_auto_long_range_radio = true;
	tf_give_personal_radio_to_regular_soldier = true;
	tf_same_sw_frequencies_for_side = true;
	tf_same_lr_frequencies_for_side = true;
	TF_defaultWestRiflemanRadio = "tf_anprc152";
	
	
	if(isDedicated)exitWith{};
	
	{GRLIB_arsenal_backpacks pushBack _x}forEach [
	"tf_rt1523g_big_bwmod",
		"tf_rt1523g",
		"tf_rt1523g_big",
		"tf_rt1523g_black",
		"tf_rt1523g_fabric",
		"tf_rt1523g_green",
		"tf_rt1523g_rhs",
		"tf_rt1523g_sage",
		"tf_rt1523g_bwmod"
	];

};

if(isclass (configfile >> "CfgPatches" >> "acre_main")	)then{

	[true, true] call acre_api_fnc_setupMission;
	[true] call acre_api_fnc_setFullDuplex;
	[false] call acre_api_fnc_setInterference;
	[true] call acre_api_fnc_setRevealToAI;
	[true] call ACRE_api_fnc_ignoreAntennaDirection;
	
	["ACRE_PRC148", "default", "example1"] call acre_api_fnc_copyPreset;
	["ACRE_PRC152", "default", "example1"] call acre_api_fnc_copyPreset;
	["ACRE_PRC117F", "default", "example1"] call acre_api_fnc_copyPreset;

	["ACRE_PRC152", "example1", 1, "description", "PLTNET 1"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "example1", 2, "description", "PLTNET 2"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "example1", 3, "description", "PLTNET 3"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "example1", 4, "description", "COY"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "example1", 5, "description", "CAS"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "example1", 6, "description", "FIRES"] call acre_api_fnc_setPresetChannelField;

	["ACRE_PRC148", "example1", 1, "label", "PLTNET 1"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC148", "example1", 2, "label", "PLTNET 2"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC148", "example1", 3, "label", "PLTNET 3"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC148", "example1", 4, "label", "COY"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC148", "example1", 5, "label", "CAS"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC148", "example1", 6, "label", "FIRES"] call acre_api_fnc_setPresetChannelField;

	["ACRE_PRC117F", "example1", 1, "name", "PLTNET 1"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "example1", 2, "name", "PLTNET 2"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "example1", 3, "name", "PLTNET 3"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "example1", 4, "name", "COY"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "example1", 5, "name", "CAS"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "example1", 6, "name", "FIRES"] call acre_api_fnc_setPresetChannelField;
	
	if(isDedicated)exitWith{};
	
	{GRLIB_arsenal_items pushBack _x}forEach [
		"ACRE_PRC343",
		"ACRE_PRC148",
		"ACRE_PRC152",
		"ACRE_PRC77",
		"ACRE_PRC117F"
	];

};
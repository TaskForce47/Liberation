//if(	!(isclass (configfile >> "CfgPatches" >> "BWA3_Flag")	)	)exitWith{"BWA3 not initialized!" remoteExec ["systemchat",0]};
huron_typename = "CUP_B_CH53E_GER";
FOB_truck_typename = "CUP_B_LAV25_HQ_USMC";
{light_vehicles_extension	pushBack _x}forEach [
	["CUP_B_Dingo_GER_Wdl",0,50,2],
	["CUP_B_Dingo_GER_Des",0,50,2],
	["CUP_B_M113_USA",0,50,5],
	["CUP_B_M113_Med_USA",0,50,5],
	["CUP_B_M163_USA",0,75,5],
	["CUP_B_RG31_M2_USMC",0,50,5],
	["CUP_B_RG31_M2_OD_USMC",0,50,5],
	["CUP_B_RG31_M2_GC_USMC",0,50,5],
	["CUP_B_RG31_M2_GC_USMC",0,50,5],
	["CUP_B_RHIB_USMC",0,0,2],
	["CUP_B_RHIB2Turret_USMC",0,30,2],
	["CUP_B_HMMWV_Unarmed_USMC",0,0,2],
	["CUP_B_HMMWV_M2_USMC",0,20,2],
	["CUP_B_HMMWV_TOW_USMC",0,50,2],
	["CUP_B_HMMWV_M1114_USMC",0,20,2],
	["CUP_B_HMMWV_Avenger_USMC",0,50,2],
	["CUP_B_HMMWV_Ambulance_USMC",0,50,2],
	["CUP_B_HMMWV_SOV_USA",0,0,2],
	["CUP_B_HMMWV_Crows_M2_USA",0,50,2]
];

{heavy_vehicles_extension	pushBack _x}forEach [
	["CUP_B_LAV25_USMC",0,50,10],
	["CUP_B_M1126_ICV_M2_Desert",0,50,5],
	["CUP_B_M1126_ICV_M2_Desert_Slat",0,50,5],
	["CUP_B_M1126_ICV_M2_Woodland",0,50,5],
	["CUP_B_M1126_ICV_M2_Woodland_Slat",0,50,5],
	["CUP_B_M1130_CV_M2_Desert",0,50,5],
	["CUP_B_M1130_CV_M2_Desert_Slat",0,50,5],
	["CUP_B_M1130_CV_M2_Woodland",0,50,5],
	["CUP_B_M1130_CV_M2_Woodland_Slat",0,50,5],
	["CUP_B_M1128_MGS_Desert",0,50,5],
	["CUP_B_M1128_MGS_Desert_Slat",0,50,5],
	["CUP_B_M1128_MGS_Woodland",0,50,5],
	["CUP_B_M1128_MGS_Woodland_Slat",0,50,5],
	["CUP_B_M1133_MEV_Desert",0,50,5],
	["CUP_B_M1133_MEV_Desert_Slat",0,50,5],
	["CUP_B_M1133_MEV_Woodland",0,50,5],
	["CUP_B_M1133_MEV_Woodland_Slat",0,50,5],
	["CUP_B_AAV_USMC",0,50,5],
	["CUP_B_M2Bradley_USA_D",0,50,10],
	["CUP_B_M2Bradley_USA_W",0,50,10],
	["CUP_B_M6LineBacker_USA_D",0,50,10],
	["CUP_B_M6LineBacker_USA_W",0,50,10],
	["CUP_B_M2A3Bradley_USA_D",0,75,10],
	["CUP_B_M2A3Bradley_USA_W",0,75,10],
	["CUP_B_M270_HE_USMC",0,1500,15],
	["CUP_B_M270_DPICM_USMC",0,1500,15],
	["CUP_B_M1A1_Woodland_US_Army",0,100,15],
	["CUP_B_M1A1_DES_US_Army",0,100,15],
	["CUP_B_M1A2_TUSK_MG_US_Army",0,130,15],
	["CUP_B_M1A2_TUSK_MG_DES_US_Army",0,130,15]
];
{air_vehicles_extension pushBack _x}forEach [
	["CUP_B_C130J_USMC",0,0,15],
	["CUP_B_C130J_Cargo_USMC",0,0,15],
	["CUP_B_F35B_AA_USMC",0,200,15],
	["CUP_B_F35B_CAS_USMC",0,200,15],
	["CUP_B_F35B_LGB_USMC",0,200,15],
	["CUP_B_A10_CAS_USA",0,200,15],
	["CUP_B_A10_AT_USA",0,200,15],
	["CUP_B_AV8B_CAP_USMC",0,200,15],
	["CUP_B_AV8B_MK82_USMC",0,200,15],
	["CUP_B_AV8B_GBU12_USMC",0,200,15],
	["CUP_B_UH60M_US",0,0,10],
	["CUP_B_UH60L_US",0,0,10],
	["CUP_B_UH60M_FFV_US",0,0,10],
	["CUP_B_UH60L_FFV_US",0,0,10],
	["CUP_B_AH6J_Escort_USA",0,0,10],
	["CUP_B_AH6J_AT_USA",0,50,10],
	["CUP_B_AH6J_MP_USA",0,50,10],
	["CUP_B_AH1Z_USMC",0,200,10],
	["CUP_B_AH1Z_AT_USMC",0,200,10],
	["CUP_B_AH1Z_Escort_USMC",0,200,10],
	["CUP_B_AH64D_AT_USA",0,200,10],
	["CUP_B_AH64D_ES_USA",0,200,10],
	["CUP_B_AH64D_MR_USA",0,200,10],
	["CUP_B_CH47F_USA",0,0,10],
	["CUP_B_CH47F_VIV_USA",0,0,10],
	["CUP_B_MH60S_USMC",0,0,10],
	["CUP_B_MH60S_FFV_USMC",0,0,10],
	["CUP_B_MV22_USMC",0,0,10],
	["CUP_B_MV22_VIV_USMC",0,0,10],
	["CUP_B_CH53E_GER",0,0,10],
	["CUP_B_CH53E_VIV_GER",0,0,10],
	["CUP_B_C47_USA",0,0,10],
	["CUP_B_AC47_Spooky_USA",0,0,10],
	["CUP_B_UH1Y_MEV_USMC",0,0,10],
	["CUP_B_UH1Y_GUNSHIP_USMC",0,50,10]
];

{support_vehicles_extension  pushBack _x}forEach [
	["CUP_B_MTVR_Ammo_USA",0,100,5],
	["CUP_B_MTVR_Refuel_USA",0,50,10],
	["CUP_B_MTVR_Repair_USA",0,100,5]
];
{static_vehicles_extension  pushBack _x}forEach [
	["CUP_B_M2StaticMG_USMC",0,20,0],
	["CUP_B_M2StaticMG_MiniTripod_USMC",0,20,0],
	["CUP_B_TOW_TriPod_USMC",0,50,0]
];

if(isDedicated)exitWith{};

{GRLIB_arsenal_weapons pushBack _x}forEach [

];

{GRLIB_arsenal_magazines pushBack _x}forEach [];

{GRLIB_arsenal_items pushBack _x}forEach [

];

{GRLIB_arsenal_backpacks pushBack _x}forEach [

];
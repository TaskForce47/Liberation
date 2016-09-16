// This file allows you to add content to the mission without conflict issues after each update of the original classnames.sqf
// If you want more modifications to be supported by this file, lets discuss it on the forums.



// *** SUPPORT STUFF ***

// Setting a value here will overwrite the original value found from the mission. Do that if youre doing a total conversion.
// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just dont try.
FOB_typename = "Land_Cargo_HQ_V1_F"; 									// Default "Land_Cargo_HQ_V1_F";
FOB_box_typename = "B_Slingload_01_Cargo_F";							// Default "B_Slingload_01_Cargo_F";
FOB_truck_typename = "rhs_gaz66_r142_vmf";								// Default "B_Truck_01_box_F";
Arsenal_typename = "B_supplyCrate_F";									// Default "B_supplyCrate_F";
huron_typename = "RHS_Mi8mt_Cargo_vdv";									// Default "B_Heli_Transport_03_unarmed_F";
ammobox_b_typename = "Box_NATO_AmmoVeh_F";								// Default "Box_NATO_AmmoVeh_F";
ammobox_o_typename = "Box_East_AmmoVeh_F";								// Default "Box_East_AmmoVeh_F";
opfor_ammobox_transport = "B_Truck_01_ammo_F";							// Default "O_Truck_03_transport_F";
commander_classname = "rhs_vdv_officer";								// Default "B_officer_F"
crewman_classname = "rhs_vdv_armoredcrew";								// Default "B_crew_F";
pilot_classname = "rhs_pilot";											// Default "B_Helipilot_F";





// *** FRIENDLIES ***

// Each array below represents one page of the build menu
// Format : [ "classname", manpower, ammo, fuel ]
// Example : [ "B_APC_Tracked_01_AA_F", 0, 40, 15 ],

// If overwrite is set to true, then the extension list will entirely replace the original list defined in classnames.sqf. Otherwise it will be appended to it.
// Useful for total conversions to RHS and such, without having to alter the original file.
infantry_units_overwrite = false;
infantry_units_extension = [
	["rhs_vdv_rifleman", 1,0,0],
    ["rhs_vdv_sergeant", 2,0,0],
    ["rhs_vdv_arifleman", 3,0,0],
    ["rhs_vdv_efreitor", 4,0,0],
    ["rhs_vdv_machinegunner_assistant",	5,0,0],
    ["rhs_vdv_recon_rifleman_scout_akm",4,0,0],
    ["rhs_vdv_recon_medic", 4,0,0],
    ["rhs_vdv_recon_marksman_asval", 5,0,0],
    ["rhs_vdv_marksman", 8,0,0],
    ["rhs_vdv_aa", 5,5,0],
    ["rhs_vdv_at", 5,5,0],
    ["rhs_vdv_crew", 1,0,0],
    ["rhs_pilot", 1,0,0]
];

light_vehicles_overwrite = true;
light_vehicles_extension = [
    ["rhs_uaz_vmf",0,0,2],
    ["rhs_tigr_vmf",0,0,5],
    ["rhs_tigr_m_vmf",0,0,5],
    ["rhs_tigr_sts_vmf",0,45,5],
    ["RHS_Ural_VMF_01",0,0,7],
    ["rhs_pts_vmf",0,0,7],
    ["RHS_Ural_Open_VDV_01",0,0,7],
    ["rhsgref_BRDM2UM_vmf",0,0,10],
    ["rhsgref_BRDM2_HQ_vmf",0,10,10],
    ["rhsgref_BRDM2_ATGM_vmf", 0,150,10],
    ["rhsgref_BRDM2_vmf",0,50,10],
    ["B_Boat_Transport_01_F", 0,0,3],
    ["ACE_Wheel",0,2,0]
];

heavy_vehicles_overwrite = true;
heavy_vehicles_extension = [
    ["rhs_bmd1pk", 0,50,15],
	["rhs_btr80a_vmf",0,60,15],
    ["rhs_bmd2m", 0,60,15],
    ["rhs_bmp2_vdv", 0,100,15],
    ["rhs_bmp2k_vdv", 0,100,15],
    ["rhs_bmd2m", 0,115,15],
    ["rhs_bmd1r", 0,200,15],
    ["rhs_bmd4ma_vdv", 0,230,20],
    ["rhs_prp3_vdv", 0,200,15],
    ["rhs_t72ba_tv", 0,230,35],
    ["rhs_t80um", 0,330,35],
    ["rhs_t90a_tv", 0,350,35],
    ["rhs_zsu234_aa", 0,175,25],
	["RHS_BM21_VMF_01",0,1500,15],
	["rhs_2s3_tv", 0,2000,15],
	["ACE_Track",0,2,0]
];

air_vehicles_overwrite = true;
air_vehicles_extension = [
	["RHS_Mi8AMT_vvs", 0,0,15],
	["RHS_Mi8mt_vvs", 0,10,15],
    ["RHS_Mi8AMTSh_UPK23_vvs", 0,300,15],
    ["RHS_Mi8AMTSh_FAB_vvs", 0,300,15],
    ["RHS_Mi24P_AT_vvs", 0,400,20],
	["RHS_Mi24V_UPK23_vdv", 0,400,20],
    ["RHS_Ka52_UPK23_vvs", 0,500,30],
    ["RHS_T50_vvs_051",0,300,20],
	["RHS_Su25SM_KH29_vvs", 0,500,20],
	["RHS_Su25SM_CAS_vvs", 0, 300,20],
    ["rhs_pchela1t_vvs", 0,0,5],
	["RHS_AN2_B", 0,0,7]
];

static_vehicles_overwrite = true;
static_vehicles_extension = [
	["rhs_D30_at_vdv", 0,750,0],
	["rhs_D30_vdv", 0,750,0],
	["RHS_AGS30_TriPod_VDV", 0,10,0],
	["rhs_Metis_9k115_2_vdv", 0,10,0],
	["rhs_Kornet_9M133_2_vdv", 0,10,0],
	["rhs_Igla_AA_pod_vdv", 0,30,0],
	["RHS_ZU23_VDV", 0,20,0],
	["rhs_KORD_MSV", 0, 10,0],
	["rhs_KORD_high_MSV", 0, 10,0]
];

buildings_overwrite = true;
buildings_extension = [
	["rhs_3Ya40_1_single", 0,0,0],
	["CargoNet_01_box_F",0,0,0],
	["CamoNet_ghex_big_F", 0,0,0],
	["CamoNet_ghex_open_F", 0,0,0],
	["CamoNet_ghex_F", 0,0,0],
	["Land_IRMaskingCover_02_F", 0,0,0],
	["Land_IRMaskingCover_01_F", 0,0,0],
	["Land_BarGate_F",0,0,0],
	["Land_Cargo_Tower_V4_F", 0,0,0],
	["Land_Cargo_Patrol_V4_F", 0,0,0],
	["Land_HBarrier_01_tower_green_F", 0,0,0],
	["Land_HBarrier_01_big_tower_green_F", 0,0,0],
	["Land_HBarrier_01_wall_4_green_F", 0,0,0],
	["Land_HBarrier_01_wall_6_green_F", 0,0,0],
	["Land_HBarrier_01_corner_green_F", 0,0,0],
	["Land_HBarrier_01_corridor_green_F", 0,0,0],
	["Land_HBarrier_01_line_5_green_F", 0,0,0],
	["Land_HBarrier_01_line_3_green_F", 0,0,0],
	["Land_HBarrier_01_line_1_green_F", 0,0,0],
	["Land_HBarrier_01_big_4_green_F", 0,0,0],
	["Land_BagFence_01_short_green_F", 0,0,0],
	["Land_BagFence_01_long_green_F", 0,0,0],
	["Land_BagFence_01_corner_green_F", 0,0,0],
	["Land_BagFence_01_end_green_F", 0,0,0],
	["Land_BagFence_01_round_green_F", 0,0,0],
	["Land_BagBunker_01_small_green_F", 0,0,0],
	["Land_BagBunker_01_large_green_F", 0,0,0],
	["Land_HelipadCircle_F",0,0,0],
	["Land_HelipadSquare_F",0,0,0],
	["Land_Dome_Small_F" ,0,0,0],
    ["Land_LampHalogen_F",0,0,0],
    ["Land_SM_01_shelter_wide_F",0,0,0],
    ["Land_SM_01_shelter_narrow_F",0,0,0],
    ["Land_PlasticCase_01_small_F",0,0,0],
    ["Land_PlasticCase_01_medium_F",0,0,0],
    ["Land_PlasticCase_01_large_F",0,0,0],
	["Land_MetalCase_01_large_F",0,0,0],
	["Land_PortableLight_double_F",0,0,0],
	["Land_PortableLight_single_F",0,0,0],
	["Land_Razorwire_F",0,0,0],
	["Land_TentHangar_V1_F",0,0,0],
	["Land_CncBarrier_F",0,0,0],
    ["Land_CncBarrier_stripes_F", 0,0,0],
    ["Land_CncBarrierMedium_F", 0,0,0],
    ["Land_CncBarrierMedium4_F", 0,0,0],    
    ["Land_CncShelter_F", 0,0,0],
    ["Land_CncWall1_F", 0,0,0],
    ["Land_CncWall4_F", 0,0,0],
	["PortableHelipadLight_01_blue_F",0,0,0],
	["Land_CampingTable_F", 0,0,0],
	["Land_CampingChair_V2_F",0,0,0]
];

support_vehicles_overwrite = true;		// If youre going to overwrite this, make sure you have at least Arsenal_typename, Respawn_truck_typename, FOB_box_typename and FOB_truck_typename in there
support_vehicles_extension = [
	[Arsenal_typename, 0,100,0],
    [FOB_box_typename, 0,500,0],
    [FOB_truck_typename, 0,500,5],
    ["O_Truck_03_medical_F", 0,100,10],
    ["O_Truck_03_repair_F", 0,100,5],
    ["O_Truck_03_fuel_F", 0,100,10],
    ["O_Truck_03_ammo_F", 0,100,5],
    ["Box_NATO_AmmoVeh_F", 0,100,0],
    ["Box_East_AmmoVeh_F", 0,100,0]
];

// All the UAVs must be declared here, otherwise there shall be UAV controlling issues. Namely: you wont be able to control them.
uavs = [
	"B_T_UAV_03_F","B_UAV_02_CAS_F","B_UAV_02_F","B_UAV_01_F","B_UGV_01_rcws_F", "rhs_pchela1t_vvs"
];

// Pre-made squads for the commander build menu. These shouldnt exceed 10 members.
// Light infantry squad
blufor_squad_inf_light = [
	"rhs_vdv_sergeant", "rhs_vdv_arifleman", "rhs_vdv_machinegunner_assistant", "rhs_vdv_machinegunner_assistant"
];

// Heavy infantry squad
blufor_squad_inf = [
	"rhs_vdv_sergeant",
	"rhs_vdv_efreitor",
	"rhs_vdv_arifleman",
	"rhs_vdv_machinegunner_assistant",
	"rhs_vdv_LAT",
	"rhs_vdv_grenadier",
	"rhs_vdv_flora_rifleman",
	"rhs_vdv_flora_marksman"
];

// AT specialists squad
blufor_squad_at = [
	"rhs_vdv_junior_sergeant", 
	"rhs_vdv_at", 
	"rhs_vdv_at", 
	"rhs_vdv_at", 
	"rhs_vdv_strelok_rpg_assist", 
	"rhs_vdv_LAT", 
	"rhs_vdv_rifleman"
];

// AA specialists squad
blufor_squad_aa = [
	"rhs_vdv_junior_sergeant",
	"rhs_vdv_aa",
	"rhs_vdv_aa",
	"rhs_vdv_aa",
	"rhs_vdv_rifleman"
];

// Force recon squad
blufor_squad_recon = [
	"rhs_vdv_recon_sergeant",
	"rhs_vdv_recon_efreitor",
	"rhs_vdv_recon_arifleman",
	"rhs_vdv_recon_machinegunner_assistant",
	"rhs_vdv_recon_rifleman_lat",
	"rhs_vdv_recon_grenadier"
];

// Paratroopers squad
blufor_squad_para = [
	"rhs_vdv_recon_sergeant",
	"rhs_vdv_recon_efreitor",
	"rhs_vdv_recon_arifleman",
	"rhs_vdv_recon_machinegunner_assistant",
	"rhs_vdv_recon_rifleman_lat",
	"rhs_vdv_recon_grenadier"
];





// *** BADDIES *** // *** ENEMY *** // 

/* ------- ADDED BY TF47 ------- */
OpferAAArray = [
	"RHS_M6_wd"	
];


OpferArtyArr = [
	"rhsusf_m109_usarmy"
];


OpforStaticAAA = [
	"RHS_Stinger_AA_pod_USMC_D"
];

OpforStaticAT = [
	"RHS_TOW_TriPod_USMC_D"
];

OpforStaticAP = [
	"RHS_M2StaticMG_USMC_D"
];

OpferDiver = [
	"B_T_Diver_Exp_F",
	"B_T_Diver_F",
	"B_T_Diver_TL_F"
];
OpforBoat = [
	"rhsusf_mkvsoc"
];

OpforCrew = [
	"rhsusf_usmc_marpat_wd_combatcrewman",
	"rhsusf_usmc_marpat_wd_crewman",
	"rhsusf_usmc_lar_marpat_wd_crewman",
	"rhsusf_usmc_lar_marpat_wd_combatcrewman"
];

OpforStaticMortar = [
	"RHS_M2StaticMG_USMC_D"
];
OpforStatics = [];
{ OpforStatics append _x; } foreach [OpforStaticAAA, OpforStaticAT,  OpforStaticAP];

OpforStaticVehicles = [
	"rhsusf_m1a1fep_wd",
	"rhsusf_m1a1hc_wd",
	"rhsusf_m1025_w_s_Mk19",
	"rhsusf_m113_usarmy_M240",
	"RHS_M2A3_BUSKIII_wd",
	"RHS_M2A3_wd",
	"rhsusf_M1083A1P2_B_wd_fmtv_usarmy",
	"rhsusf_m1a2sep1tuskiiwd_usarmy"
];


/* -------  ADDED BY TF47  ------- */

// All OPFOR infantry. Defining a value here will replace the default value from the original mission.
opfor_sentry = "rhsusf_usmc_marpat_wd_rifleman_m590";
opfor_rifleman = "rhsusf_usmc_lar_marpat_wd_rifleman_light";
opfor_grenadier = "rhsusf_usmc_marpat_wd_grenadier";
opfor_squad_leader = "rhsusf_usmc_marpat_wd_squadleader";
opfor_team_leader = "rhsusf_usmc_marpat_wd_teamleader";
opfor_marksman = "rhsusf_usmc_recon_marpat_wd_marksman_lite";
opfor_machinegunner = "rhsusf_usmc_recon_marpat_wd_machinegunner_m249";
opfor_heavygunner = "rhsusf_usmc_recon_marpat_wd_machinegunner";
opfor_medic = "rhsusf_usmc_marpat_wd_rifleman_m4";
opfor_rpg = "rhsusf_usmc_marpat_wd_smaw";
opfor_at = "rhsusf_usmc_marpat_wd_javelin";
opfor_aa = "rhsusf_usmc_marpat_wd_stinger";
opfor_officer  = "rhsusf_usmc_marpat_wd_officer";
opfor_sharpshooter = "rhsusf_usmc_marpat_wd_marksman";
opfor_sniper = "rhsusf_usmc_marpat_wd_sniper_M107";
opfor_engineer = "rhsusf_usmc_marpat_wd_explosives";
opfor_paratrooper = "rhsusf_usmc_lar_marpat_wd_rifleman";

// OPFOR Vehicles to be used in secondary objectives
opfor_mrap = "rhsusf_m998_w_s_2dr";
opfor_mrap_armed = "rhsusf_m1025_w_s_m2sd";
opfor_transport_helo = "RHS_UH1Y_UNARMED";
opfor_transport_truck = "rhsusf_M1083A1P2_B_wd_fmtv_usarmy";
opfor_fuel_truck = "B_Truck_01_fuel_F";
opfor_ammo_truck = "B_Truck_01_ammo_F";
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";
opfor_flag = "Flag_US_F";

// Militia infantry. Soldier classnames the game will pick from randomly
militia_squad_overwrite = true;
militia_squad_extension = [
    "B_G_Soldier_SL_F",
    "B_G_Soldier_A_F",
    "B_G_Soldier_AR_F",
    "B_G_medic_F",
    "B_G_engineer_F",
    "B_G_Soldier_exp_F",
    "B_G_Soldier_GL_F",
    "B_G_Soldier_M_F",
    "B_G_Soldier_F",
    "B_G_Soldier_LAT_F",
    "B_G_Soldier_lite_F",
    "B_G_Sharpshooter_F",
    "B_G_Soldier_TL_F"
];

// Militia vehicles to choose from
militia_vehicles_overwrite = true;
militia_vehicles_extension = [
	"C_Truck_02_covered_F",
	"B_G_Offroad_01_armed_F"
];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles_overwrite = true;
opfor_vehicles_extension = [
	"rhsusf_m1025_w_m2",
	"rhsusf_m1025_w_m2",
	"rhsusf_m1025_w_s_m2",
	"rhsusf_m1025_w_s_m2",
	"rhsusf_m1025_w_s_Mk19",
	"RHS_M2A3_BUSKIII_wd",
	"rhsusf_m1025_w_s_Mk19",
	"RHS_M2A3_BUSKIII_wd",
	"rhsusf_m998_w_s_2dr_halftop",
	"rhsusf_m998_w_s_2dr_halftop",
	"rhsusf_m998_w_s_2dr_halftop",
	"rhsusf_m1025_w_s_Mk19",
	"rhsusf_m1a1hc_wd",
	"rhsusf_m113_usarmy_M240",
	"rhsusf_m113_usarmy_M240",
	"rhsusf_m113_usarmy_M240",
	"rhsusf_m1a1hc_wd"
];

// Same with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity_overwrite = true;
opfor_vehicles_low_intensity_extension = [
	"rhsusf_m1025_w_m2",
	"rhsusf_m998_w_s_2dr_halftop",
	"rhsusf_m1025_w_s_Mk19",
	"rhsusf_m113_usarmy_M240"
];

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles_overwrite = true;
opfor_battlegroup_vehicles_extension = [
	"rhsusf_m1025_w_m2",
	"rhsusf_m1a1fep_wd",
	"rhsusf_m1a1hc_wd",
	"rhsusf_m1a1fep_wd",
	"RHS_UH60M",
	"rhsusf_m1a1hc_wd",
	"rhsusf_m998_w_s_2dr_halftop",
	"rhsusf_m1025_w_s_Mk19",
	"RHS_AH1Z_wd",
	"rhsusf_m113_usarmy_M240",
	"RHS_M2A3_BUSKIII_wd",
	"RHS_M2A3_wd",
	"rhsusf_M1083A1P2_B_wd_fmtv_usarmy",
	"RHS_AH64D_wd_GS",
	"RHS_AH64D_wd",
	"rhsusf_m1a2sep1tuskiiwd_usarmy",
	"RHS_UH1Y_UNARMED"
];

// Same with lighter choices to be used  when the alert level is low
opfor_battlegroup_vehicles_low_intensity_overwrite = true;
opfor_battlegroup_vehicles_low_intensity_extension = [
	"RHS_UH1Y_UNARMED",
	"RHS_UH60M",
	"rhsusf_m1025_w_s_Mk19",
	"rhsusf_m998_w_s_2dr_halftop",
	"rhsusf_m1025_w_m2",
	"RHS_M2A3_wd",
	"rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy",
	"rhsusf_m113_usarmy_M240",
	"rhsusf_M1083A1P2_B_wd_fmtv_usarmy",
	"rhsusf_m1a1aimwd_usarmy"
];

// All the vehicles that can spawn as battlegroup members (see above) and also hold 8 soldiers as passengers.
// If something in here cant hold all 8 soldiers then buggy behaviours may occur
opfor_troup_transports_overwrite = true;
opfor_troup_transports_extension = [
	"rhsusf_m113_usarmy_M240",
	"RHS_UH60M",
	"rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy",
	"rhsusf_M1083A1P2_B_wd_fmtv_usarmy",
	"RHS_UH1Y_UNARMED"
];

// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers_overwrite = true;
opfor_choppers_extension = [
	"RHS_AH64D_wd",
	"RHS_AH64D_wd_AA",
	"RHS_UH1Y_GS",
	"RHS_UH60M",
	"RHS_UH1Y",
	"RHS_AH1Z_wd"
];

// Opfor military aircrafts
opfor_air_overwrite = true;
opfor_air_extension = [
	"RHS_A10",
	"RHS_A10_AT",
	"rhsusf_f22"
];


// Other stuff

// Civilians
civilians_overwrite = false;
civilians_extension = [

];

// Civilian vehicles
civilian_vehicles_overwrite = false;
civilian_vehicles_extension = [

];

// Everything the AI troups should be able to resupply from
ai_resupply_sources_extension = [

];

// Everything that can resupply other vehicles
vehicle_repair_sources_extension = [
	"B_Truck_01_Repair_F",
	"B_T_Truck_01_Repair_F",
	"rhs_gaz66_repair_vmf"
];
vehicle_rearm_sources_extension = [
	
];
vehicle_refuel_sources_extension = [

];

// Elite vehicles that should be unlocked through military base capture.
elite_vehicles_extension = [
	"rhs_btr80a_vmf",
	"rhsgref_BRDM2_ATGM_vmf",
	"RHS_BM21_VMF_01",
	"rhs_t80um",
	"rhs_t90a_tv",
	"RHS_Ka52_UPK23_vvs",
	"RHS_Mi8AMTSh_FAB_vvs",
	"RHS_T50_vvs_051",
	"RHS_Su25SM_KH29_vvs",
	"RHS_Su25SM_CAS_vvs",
	"rhs_2s3_tv"
];

// Blacklisted arsenal items such as deployable weapons  that should be bought instead
// Useless if youre using a predefined arsenal in arsenal.sqf
blacklisted_from_arsenal_extension = [

];

// Configuration for ammo boxes transport
// First entry: classname
// Second entry: how far behind the vehicle the boxes should be unloaded
// Following entries: attachTo position for each box, the number of boxes that can be loaded is derived from the number of entries
box_transport_config_extension = [
	[ "greuh_eh101_gr", -6.5, [0, 4.2, -1.45], [0, 2.5, -1.45], [0, 0.8, -1.45], [0, -0.9, -1.45] ]
];
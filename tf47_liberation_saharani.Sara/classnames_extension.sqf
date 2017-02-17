// This file allows you to add content to the mission without conflict issues after each update of the original classnames.sqf
// If you want more modifications to be supported by this file, lets discuss it on the forums.



// *** SUPPORT STUFF ***

// Setting a value here will overwrite the original value found from the mission. Do that if youre doing a total conversion.
// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just dont try.
FOB_typename = "Land_Cargo_HQ_V1_F"; 									// Default "Land_Cargo_HQ_V1_F";
FOB_box_typename = "B_Slingload_01_Cargo_F";							// Default "B_Slingload_01_Cargo_F";
FOB_truck_typename = "B_Truck_01_box_F";								// Default "B_Truck_01_box_F";
Arsenal_typename = "B_supplyCrate_F";									// Default "B_supplyCrate_F";
huron_typename = "rhsusf_CH53E_USMC";									// Default "B_Heli_Transport_03_unarmed_F";
ammobox_b_typename = "Box_NATO_AmmoVeh_F";								// Default "Box_NATO_AmmoVeh_F";
ammobox_o_typename = "Box_East_AmmoVeh_F";								// Default "Box_East_AmmoVeh_F";
opfor_ammobox_transport = "B_Truck_01_ammo_F";							// Default "O_Truck_03_transport_F";
commander_classname = "B_officer_F";								    // Default "B_officer_F"
crewman_classname = "B_crew_F";								            // Default "B_crew_F";
pilot_classname = "B_Helipilot_F";										// Default "B_Helipilot_F";





// *** FRIENDLIES ***

// Each array below represents one page of the build menu
// Format : [ "classname", manpower, ammo, fuel ]
// Example : [ "B_APC_Tracked_01_AA_F", 0, 40, 15 ],

// If overwrite is set to true, then the extension list will entirely replace the original list defined in classnames.sqf. Otherwise it will be appended to it.
// Useful for total conversions to RHS and such, without having to alter the original file.
infantry_units_overwrite = false;
infantry_units_extension = [
];

light_vehicles_overwrite = true;
light_vehicles_extension = [
	["B_T_LSV_01_unarmed_F",0,0,3],
	["B_Quadbike_01_F",0,0,1],
	["B_Boat_Armed_01_minigun_F",0,30,5],
	["B_Boat_Transport_01_F", 0,0,3],
	["Burnes_MK10_1",0,0,5],
	["B_SDV_01_F",0,0,3],
	["ACE_Wheel",0,2,0]
];

heavy_vehicles_overwrite = true;
heavy_vehicles_extension = [
	["ACE_Track",0,2,0]
];

air_vehicles_overwrite = true;
air_vehicles_extension = [
	["JS_JC_FA18E",0,300,20],
	["JS_JC_FA18F",0,300,20],
	//["B_T_VTOL_01_armed_F",0,1000,20],
	["B_T_VTOL_01_infantry_F",0,0,10]

];

static_vehicles_overwrite = true;
static_vehicles_extension = [
	["B_Mortar_01_F",0,25,0],
	["ace_box_82mm_mo_combo",0,50,0]
];

buildings_overwrite = true;
buildings_extension = [
	["CargoNet_01_box_F",0,0,0],
	["Land_Medevac_house_V1_F", 0,0,0],
	["CamoNet_ghex_big_F", 0,0,0],
	["CamoNet_ghex_open_F", 0,0,0],
	["CamoNet_ghex_F", 0,0,0],
	["Land_IRMaskingCover_02_F", 0,0,0],
	["Land_IRMaskingCover_01_F", 0,0,0],
	["Land_BarGate_F",0,0,0],
	["Land_Cargo_Tower_V4_F", 0,0,0],
	["Land_Cargo_Patrol_V4_F", 0,0,0],
	["Land_HBarrier_3_F", 0,0,0],
	["Land_HBarrier_5_F", 0,0,0],
	["Land_HBarrier_Big_F", 0,0,0],
	["Land_HBarrier_1_F", 0,0,0],
	["Land_HBarrierWall_corridor_F", 0,0,0],
	["Land_HBarrierWall_corner_F", 0,0,0],
	["Land_HBarrierWall6_F", 0,0,0],
	["Land_HBarrierWall4_F", 0,0,0],
	["Land_HBarrierTower_F", 0,0,0],
	["Land_BagFence_Corner_F", 0,0,0],
	["Land_BagFence_End_F", 0,0,0],
	["Land_BagFence_Long_F", 0,0,0],
	["Land_BagFence_Round_F", 0,0,0],
	["Land_BagFence_Short_F", 0,0,0],
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
    ["B_Truck_01_medical_F", 0,100,5],
    ["B_Truck_01_Repair_F", 0,100,5],
    ["B_Truck_01_fuel_F", 0,100,5],
    ["B_Truck_01_ammo_F", 0,100,5],
    ["Box_NATO_AmmoVeh_F", 0,100,0],
    ["Box_East_AmmoVeh_F", 0,100,0]
];

// All the UAVs must be declared here, otherwise there shall be UAV controlling issues. Namely: you wont be able to control them.
uavs = [
	"B_T_UAV_03_F","B_UAV_02_CAS_F","B_UAV_02_F","B_UAV_01_F","B_UGV_01_rcws_F"
];

// Pre-made squads for the commander build menu. These shouldnt exceed 10 members.
// Light infantry squad
blufor_squad_inf_light = [
	"B_Soldier_F","B_Soldier_F","B_Soldier_F","B_Soldier_F"
];

// Heavy infantry squad
blufor_squad_inf = [
	"B_Soldier_F","B_Soldier_F","B_Soldier_F","B_Soldier_F"
];

// AT specialists squad
blufor_squad_at = [
	"B_Soldier_F","B_Soldier_F","B_Soldier_F","B_Soldier_F"
];

// AA specialists squad
blufor_squad_aa = [
	"B_Soldier_F","B_Soldier_F","B_Soldier_F","B_Soldier_F"
];

// Force recon squad
blufor_squad_recon = [
	"B_Soldier_F","B_Soldier_F","B_Soldier_F","B_Soldier_F"
];

// Paratroopers squad
blufor_squad_para = [
	"B_Soldier_F","B_Soldier_F","B_Soldier_F","B_Soldier_F"
];





// *** BADDIES *** // *** ENEMY *** //

/* ------- ADDED BY TF47 ------- */
OpferAAArray = [
	"rhs_zsu234_aa"
];


OpferArtyArr = [
	"rhs_D30_vdv",
	"RHS_BM21_VMF_01"
];


OpforStaticAAA = [
	"rhs_Igla_AA_pod_vdv"
];

OpforStaticAT = [
	"rhs_Kornet_9M133_2_vdv"
];

OpforStaticAP = [
	"rhs_KORD_high_MSV"
];

OpferDiver = [
	"O_diver_F",
	"O_diver_TL_F",
	"O_diver_exp_F"
];
OpforBoat = [
	"O_Boat_Armed_01_hmg_F"
];

OpforCrew = [
	"rhs_vdv_crew"
];

OpforStaticMortar = [
	"rhs_D30_vdv"
];
OpforStatics = [];
{ OpforStatics append _x; } foreach [OpforStaticAAA, OpforStaticAT,  OpforStaticAP];

OpforStaticVehicles = [
	"rhs_t72ba_tv",
	"rhs_t80um",
	"rhs_btr80a_vmf",
	"rhs_2s3_tv",
	"rhs_bmd4ma_vdv",
	"rhs_bmd2m",
	"rhs_bmp2k_vdv"
];


/* -------  ADDED BY TF47  ------- */

// All OPFOR infantry. Defining a value here will replace the default value from the original mission.
opfor_sentry = "rhs_vdv_flora_rifleman";
opfor_rifleman = "rhs_vdv_flora_rifleman";
opfor_grenadier = "rhs_vdv_flora_grenadier";
opfor_squad_leader = "rhs_vdv_flora_efreitor";
opfor_team_leader = "rhs_vdv_flora_junior_sergeant";
opfor_marksman = "rhs_vdv_flora_marksman";
opfor_machinegunner = "rhs_vdv_flora_machinegunner";
opfor_heavygunner = "rhs_vdv_flora_machinegunner";
opfor_medic = "rhs_vdv_flora_medic";
opfor_rpg = "rhs_vdv_flora_grenadier_rpg";
opfor_at = "rhs_vdv_flora_at";
opfor_aa = "rhs_vdv_flora_aa";
opfor_officer  = "rhs_vdv_flora_officer_armored";
opfor_sharpshooter = "rhs_vdv_flora_marksman";
opfor_sniper = "rhs_vdv_flora_marksman";
opfor_engineer = "rhs_vdv_flora_engineer";
opfor_paratrooper = "rhs_vdv_gorka_r_rifleman";

// OPFOR Vehicles to be used in secondary objectives
opfor_mrap = "rhs_tigr_3camo_vdv";
opfor_mrap_armed = "rhs_tigr_ffv_3camo_vdv";
opfor_transport_helo = "RHS_Mi8mt_vdv";
opfor_transport_truck = "rhs_typhoon_vdv";
opfor_fuel_truck = "RHS_Ural_Fuel_VDV_01";
opfor_ammo_truck = "rhs_gaz66_ammo_vdv";
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";
opfor_flag = "rhs_Flag_vdv_F";

// Militia infantry. Soldier classnames the game will pick from randomly
militia_squad_overwrite = true;
militia_squad_extension = [
    "O_G_Soldier_SL_F",
    "O_G_Soldier_A_F",
    "O_G_Soldier_AR_F",
    "O_G_medic_F",
    "O_G_engineer_F",
    "O_G_Soldier_exp_F",
    "O_G_Soldier_GL_F",
    "O_G_Soldier_M_F",
    "O_G_Soldier_F",
    "O_G_Soldier_LAT_F",
    "O_G_Soldier_lite_F",
    "O_G_Sharpshooter_F",
    "O_G_Soldier_TL_F"
];

// Militia vehicles to choose from
militia_vehicles_overwrite = true;
militia_vehicles_extension = [
	"rhs_bmd2_chdkz",
	"rhs_bmd2_chdkz"
];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles_overwrite = true;
opfor_vehicles_extension = [
	"RHS_Ural_VDV_01",
	"RHS_Ural_Flat_VDV_01",
	"RHS_Ural_Open_VDV_01",
	"RHS_Ural_Open_Flat_VDV_01",
	"RHS_BM21_VDV_01",
	"rhs_typhoon_vdv",
	"rhs_bmd1",
	"rhs_bmd1k",
	"rhs_bmd1p",
	"rhs_bmd1pk",
	"rhs_bmd1r",
	"rhs_bmd2",
	"rhs_bmd2m",
	"rhs_bmd2k",
	"rhs_bmp1_vdv",
	"rhs_bmp1p_vdv",
	"rhs_bmp1k_vdv",
	"rhs_bmp1d_vdv",
	"rhs_prp3_vdv",
	"rhs_bmp2e_vdv",
	"rhs_bmp2_vdv",
	"rhs_bmp2k_vdv",
	"rhs_bmp2d_vdv",
	"rhs_brm1k_vdv",
	"rhs_btr70_vdv",
	"rhs_btr80_vdv",
	"rhs_btr80a_vdv",
	"rhs_tigr_vdv",
	"rhs_tigr_3camo_vdv",
	"rhs_tigr_ffv_vdv",
	"rhs_tigr_ffv_3camo_vdv",
	"rhs_zsu234_aa",
	"rhs_sprut_vdv",
	"rhs_bmd4_vdv",
	"rhs_bmd4m_vdv",
	"rhs_bmd4ma_vdv",
	"rhs_t72ba_tv",
"rhs_t72bc_tv",
"rhs_t72bd_tv",
"rhs_t90_tv",
"rhs_t90a_tv",
"rhs_t80b",
"rhs_t80bk",
"rhs_t80bv",
"rhs_t80bvk",
"rhs_t80",
"rhs_t80a",
"rhs_t80u",
"rhs_t80uk",
"rhs_t80u45m",
"rhs_t80ue1",
"rhs_t80um"
];

// Same with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity_overwrite = true;
opfor_vehicles_low_intensity_extension = [

	"rhs_bmd1",
	"rhs_bmd1k",
	"rhs_bmd1p",
	"rhs_bmd1pk",
	"rhs_bmd1r",
	"rhs_bmd2",
	"rhs_bmd2m",
	"rhs_bmd2k",
	"rhs_bmp1_vdv",
	"rhs_bmp1p_vdv",
	"rhs_bmp1k_vdv",
	"rhs_bmp1d_vdv",
	"rhs_prp3_vdv",
	"rhs_bmp2e_vdv",
	"rhs_bmp2_vdv",
	"rhs_bmp2k_vdv",
	"rhs_bmp2d_vdv",
	"rhs_brm1k_vdv",
	"rhs_btr70_vdv",
	"rhs_btr80_vdv",
	"rhs_btr80a_vdv",
	"rhs_tigr_vdv",
	"rhs_tigr_3camo_vdv",
	"rhs_tigr_ffv_vdv",
	"rhs_tigr_ffv_3camo_vdv"
];

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles_overwrite = true;
opfor_battlegroup_vehicles_extension = [
	"RHS_Ural_VDV_01",
	"RHS_Ural_Flat_VDV_01",
	"RHS_Ural_Open_VDV_01",
	"RHS_Ural_Open_Flat_VDV_01",
	"RHS_BM21_VDV_01",
	"rhs_typhoon_vdv",
	"rhs_bmd1",
	"rhs_bmd1k",
	"rhs_bmd1p",
	"rhs_bmd1pk",
	"rhs_bmd1r",
	"rhs_bmd2",
	"rhs_bmd2m",
	"rhs_bmd2k",
	"rhs_bmp1_vdv",
	"rhs_bmp1p_vdv",
	"rhs_bmp1k_vdv",
	"rhs_bmp1d_vdv",
	"rhs_prp3_vdv",
	"rhs_bmp2e_vdv",
	"rhs_bmp2_vdv",
	"rhs_bmp2k_vdv",
	"rhs_bmp2d_vdv",
	"rhs_brm1k_vdv",
	"rhs_btr70_vdv",
	"rhs_btr80_vdv",
	"rhs_btr80a_vdv",
	"rhs_tigr_vdv",
	"rhs_tigr_3camo_vdv",
	"rhs_tigr_ffv_vdv",
	"rhs_tigr_ffv_3camo_vdv",
	"rhs_zsu234_aa",
	"rhs_sprut_vdv",
	"rhs_bmd4_vdv",
	"rhs_bmd4m_vdv",
	"rhs_bmd4ma_vdv",
	"rhs_t72ba_tv",
"rhs_t72bc_tv",
"rhs_t72bd_tv",
"rhs_t90_tv",
"rhs_t90a_tv",
"rhs_t80b",
"rhs_t80bk",
"rhs_t80bv",
"rhs_t80bvk",
"rhs_t80",
"rhs_t80a",
"rhs_t80u",
"rhs_t80uk",
"rhs_t80u45m",
"rhs_t80ue1",
"rhs_t80um"

];

// Same with lighter choices to be used  when the alert level is low
opfor_battlegroup_vehicles_low_intensity_overwrite = true;
opfor_battlegroup_vehicles_low_intensity_extension = [
	"RHS_Ural_VDV_01",
	"RHS_Ural_Flat_VDV_01",
	"RHS_Ural_Open_VDV_01",
	"RHS_Ural_Open_Flat_VDV_01",
	"RHS_BM21_VDV_01",
	"rhs_typhoon_vdv",
	"rhs_bmd1",
	"rhs_bmd1k",
	"rhs_bmd1p",
	"rhs_bmd1pk",
	"rhs_bmd1r",
	"rhs_bmd2",
	"rhs_bmd2m",
	"rhs_bmd2k",
	"rhs_bmp1_vdv",
	"rhs_bmp1p_vdv",
	"rhs_bmp1k_vdv",
	"rhs_bmp1d_vdv",
	"rhs_prp3_vdv",
	"rhs_bmp2e_vdv",
	"rhs_bmp2_vdv",
	"rhs_bmp2k_vdv",
	"rhs_bmp2d_vdv",
	"rhs_brm1k_vdv",
	"rhs_btr70_vdv",
	"rhs_btr80_vdv",
	"rhs_btr80a_vdv",
	"rhs_tigr_vdv",
	"rhs_tigr_3camo_vdv",
	"rhs_tigr_ffv_vdv",
	"rhs_tigr_ffv_3camo_vdv",
	"rhs_zsu234_aa",
	"rhs_sprut_vdv",
	"rhs_bmd4_vdv",
	"rhs_bmd4m_vdv",
	"rhs_bmd4ma_vdv",
	"rhs_t72ba_tv",
"rhs_t72bc_tv",
"rhs_t72bd_tv",
"rhs_t90_tv",
"rhs_t90a_tv",
"rhs_t80b",
"rhs_t80bk",
"rhs_t80bv",
"rhs_t80bvk",
"rhs_t80",
"rhs_t80a",
"rhs_t80u",
"rhs_t80uk",
"rhs_t80u45m",
"rhs_t80ue1",
"rhs_t80um"
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
	"RHS_Mi24P_vvsc",
	"RHS_Mi24P_CAS_vdv",
	"RHS_Mi24P_AT_vdv",
	"RHS_Mi24P_vdv",
	"RHS_Mi24V_vvsc",
	"RHS_Mi24V_FAB_vdv",
	"RHS_Mi24V_UPK23_vdv",
	"RHS_Mi24V_AT_vdv",
	"RHS_Mi24V_vdv",
	"RHS_Mi8mt_vdv",
	"RHS_Mi8mt_Cargo_vdv",
	"RHS_Mi8MTV3_vdv",
	"RHS_Mi8MTV3_UPK23_vdv",
	"RHS_Mi8MTV3_FAB_vdv",
	"RHS_Mi8AMT_vdv",
	"RHS_Mi8AMTSh_vvsc",
	"RHS_Mi8AMTSh_UPK23_vvsc",
	"RHS_Mi8AMTSh_FAB_vvsc",
	"RHS_Ka52_vvsc",
	"RHS_Ka52_UPK23_vvsc"
];

// Opfor military aircrafts
opfor_air_overwrite = true;
opfor_air_extension = [
	"RHS_Su25SM_vvsc",
	"RHS_Su25SM_KH29_vvsc",
	"RHS_T50_vvs_051"
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
];
vehicle_rearm_sources_extension = [

];
vehicle_refuel_sources_extension = [

];

// Elite vehicles that should be unlocked through military base capture.
elite_vehicles_extension = [
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

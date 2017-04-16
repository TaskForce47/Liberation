// Exported from Arsenal by mindbl4ster
class CfgRoles
{
		 class Bundeswehr_GebirgsJ
		 {
					displayName = "Gebirgsjäger (HEER)";
					icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		 };
		 class Bundeswehr_KSK
		 {
					displayName = "Kommando Spezial Kräfte";
					icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		 };
		 class USMC
		 {
			 displayName = "US Marine Corps";
			 icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		 };
};
class CfgRespawnInventory
{
	class ger_lat_g3
	{
		role = "Bundeswehr_GebirgsJ";
		displayName = "PzF3 Schütze (G3)"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
		uniformClass = "PBW_Uniform4K_fleck";
		backpack = "BWA3_PatrolPack_Fleck";
		weapons[] = {"hlc_rifle_g3a3","BWA3_Pzf3","Binocular"};
		magazines[] = {"hlc_20rnd_762x51_b_G3","hlc_20rnd_762x51_b_G3","hlc_20rnd_762x51_b_G3","hlc_20rnd_762x51_b_G3","rhs_mag_an_m8hc","rhs_mag_an_m8hc","BWA3_DM51A1","BWA3_DM51A1","hlc_20rnd_762x51_b_G3","hlc_20rnd_762x51_b_G3","BWA3_Pzf3_IT"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_CableTie","ACE_CableTie","ACE_EarPlugs","ACE_Flashlight_MX991","ACE_MapTools","ACE_morphine","ACE_morphine","ACE_morphine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_tourniquet","PBW_RevisionF_Dunkel","PBW_Helm4_fleck_H","rhsusf_ANPVS_15"};
		linkedItems[] = {"pbw_splitter_schtz","PBW_muetze3_grau","ItemMap","ItemCompass","ItemWatch","ItemRadio"};

	};
	class ger_mg3
	{
		role = "Bundeswehr_GebirgsJ";
		displayName = "MG3 Schütze"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
		// Exported from Arsenal by mindbl4ster
		uniformClass = "PBW_Uniform4K_fleck";
		backpack = "BWA3_PatrolPack_Fleck";
		weapons[] = {"hlc_lmg_MG3","Binocular"};
		magazines[] = {"rhs_mag_an_m8hc","rhs_mag_an_m8hc","BWA3_DM51A1","BWA3_DM51A1","hlc_250Rnd_762x51_Barrier_MG3"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_CableTie","ACE_CableTie","ACE_Flashlight_MX991","ACE_MapTools","ACE_morphine","ACE_morphine","ACE_morphine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_tourniquet","ACE_EarPlugs","PBW_RevisionF_Dunkel","PBW_Helm4_fleck_H","rhsusf_ANPVS_15"};
		linkedItems[] = {"pbw_splitter_schtz","PBW_muetze3_grau","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
	};
	class ger_gren_g36
	{
		role = "Bundeswehr_GebirgsJ";
		displayName = "Grenadier"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
		// Exported from Arsenal by mindbl4ster
		uniformClass = "PBW_Uniform4K_fleck";
		backpack = "BWA3_PatrolPack_Fleck";
		weapons[] = {"BWA3_P8","hlc_rifle_G36A1AG36","Throw","Put"};
		magazines[] = {"BWA3_15Rnd_9x19_P8","BWA3_15Rnd_9x19_P8","BWA3_15Rnd_9x19_P8","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","BWA3_DM25","BWA3_DM25","BWA3_DM51A1","BWA3_DM51A1","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","rhs_mag_m661_green","rhs_mag_m661_green","rhs_mag_m662_red","rhs_mag_m662_red","rhs_mag_m662_red","rhs_mag_M585_white","rhs_mag_M585_white","rhs_mag_M585_white","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_tourniquet","ACE_tourniquet","ACE_tourniquet","ACE_morphine","ACE_morphine","ACE_MapTools","ACE_EarPlugs","ACE_IR_Strobe_Item","ACE_CableTie","ACE_CableTie","ACE_Flashlight_XL50","rhsusf_ANPVS_15","PBW_Helm1_fleck_HBO"};
		linkedItems[] = {"HLC_Optic_G36dualoptic35x2d","pbw_splitter_schtz","PBW_muetze3_grau","ItemMap","ItemCompass","ItemWatch","ItemGPS","itemRadio"};
	};
	class ger_dmr_g28
	{
		role = "Bundeswehr_GebirgsJ";
		displayName = "Gruppenscharfschütze (G28)"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
		// Exported from Arsenal by mindbl4ster
		uniformClass = "PBW_Uniform4K_fleck";
		backpack = "BWA3_PatrolPack_Fleck";
		weapons[] = {"BWA3_P8","BWA3_G28_Standard","ACE_Vector","Throw","Put"};
		magazines[] = {"BWA3_15Rnd_9x19_P8","BWA3_15Rnd_9x19_P8","BWA3_15Rnd_9x19_P8","BWA3_DM25","BWA3_DM25","BWA3_10Rnd_762x51_G28","BWA3_10Rnd_762x51_G28","BWA3_10Rnd_762x51_G28","BWA3_10Rnd_762x51_G28","BWA3_10Rnd_762x51_G28","BWA3_10Rnd_762x51_G28","BWA3_10Rnd_762x51_G28","BWA3_10Rnd_762x51_G28","BWA3_10Rnd_762x51_G28","BWA3_10Rnd_762x51_G28"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_tourniquet","ACE_tourniquet","ACE_tourniquet","ACE_morphine","ACE_morphine","ACE_MapTools","ACE_EarPlugs","ACE_IR_Strobe_Item","ACE_CableTie","ACE_CableTie","ACE_Flashlight_XL50","ACE_RangeCard","ACE_Kestrel4500","BWA3_optic_NSV600","rhsusf_ANPVS_15","PBW_Helm1_fleck_HBO"};
		linkedItems[] = {"BWA3_optic_20x50","BWA3_acc_LLM01_irlaser","pbw_splitter_schtz","PBW_muetze3_grau","ItemMap","ItemCompass","ItemWatch","ItemGPS","itemRadio"};
	};
	class ksk_sql
	{
		role = "Bundeswehr_KSK";
		displayName = "Squadleader"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
		uniformClass = "milgp_u_g3_field_set_mc";
		backpack = "milgp_bp_Pointman_mc";
		weapons[] = {"hlc_rifle_G36KA1KSK","BWA3_P8","BWA3_Vector","Throw","Put"};
		magazines[] = {"hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","ACE_Chemlight_HiYellow","ACE_Chemlight_HiYellow","SmokeShell","SmokeShell","SmokeShell","SmokeShell","ACE_M84","ACE_M84","ACE_M84","ACE_M84","HandGrenade","ACE_HandFlare_Green","BWA3_15Rnd_9x19_P8","SmokeShellPurple","SmokeShellPurple"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_tourniquet","ACE_tourniquet","ACE_morphine","ACE_morphine","ACE_Flashlight_XL50","ACE_EarPlugs","ACE_CableTie","ACE_CableTie","ACE_CableTie","ACE_CableTie","ACE_MapTools","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_epinephrine","ACE_IR_Strobe_Item","ACE_IR_Strobe_Item","rhsusf_ANPVS_15"};
		linkedItems[] = {"BWA3_optic_EOTech","BWA3_acc_VarioRay_irlaser","rhsusf_acc_rotex5_grey","milgp_v_jpc_teamleader_belt_mc","milgp_h_opscore_01_goggles_CB","G_Balaclava_blk","ItemMap","ItemCompass","ItemWatch","tf_rf7800str","ItemGPS","NVGoggles_OPFOR"};
	};
	class ksk_ratelo
	{
		role = "Bundeswehr_KSK";
		displayName = "Fernmeldespezialist"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
		uniformClass = "milgp_u_g3_field_set_mc";
		backpack = "milgp_bp_Pointman_mc";
		weapons[] = {"hlc_rifle_G36KA1KSK","BWA3_P8","BWA3_Vector","Throw","Put"};
		magazines[] = {"hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","ACE_Chemlight_HiYellow","ACE_Chemlight_HiYellow","SmokeShell","SmokeShell","SmokeShell","SmokeShell","ACE_M84","ACE_M84","ACE_M84","ACE_M84","HandGrenade","ACE_HandFlare_Green","BWA3_15Rnd_9x19_P8","SmokeShellPurple","SmokeShellPurple"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_tourniquet","ACE_tourniquet","ACE_morphine","ACE_morphine","ACE_Flashlight_XL50","ACE_EarPlugs","ACE_CableTie","ACE_CableTie","ACE_CableTie","ACE_CableTie","ACE_MapTools","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_epinephrine","ACE_IR_Strobe_Item","ACE_IR_Strobe_Item","rhsusf_ANPVS_15"};
		linkedItems[] = {"BWA3_optic_EOTech","BWA3_acc_VarioRay_irlaser","rhsusf_acc_rotex5_grey","milgp_v_jpc_teamleader_belt_mc","milgp_h_opscore_01_goggles_CB","G_Balaclava_blk","ItemMap","ItemCompass","ItemWatch","tf_rf7800str","ItemGPS","NVGoggles_OPFOR"};
	};
	class ksk_wSpec
	{
		role = "Bundeswehr_KSK";
		displayName = "Waffenspezialist (PzF3)"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
		// Exported from Arsenal by mindbl4ster
		uniformClass = "milgp_u_g3_field_set_mc";
		backpack = "milgp_bp_Tomahawk_mc";
		weapons[] = {"hlc_rifle_G36KA1KSK","BWA3_Pzf3","BWA3_P8","Throw","Put"};
		magazines[] = {"BWA3_15Rnd_9x19_P8","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","SmokeShell","SmokeShell","SmokeShell","SmokeShell","ACE_M84","ACE_M84","ACE_M84","ACE_M84","ACE_M84","ACE_M84","HandGrenade","HandGrenade","HandGrenade"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_tourniquet","ACE_tourniquet","ACE_morphine","ACE_morphine","ACE_Flashlight_XL50","ACE_EarPlugs","ACE_CableTie","ACE_CableTie","ACE_CableTie","ACE_CableTie","ACE_MapTools","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_epinephrine","rhsusf_ANPVS_15","ACE_IR_Strobe_Item"};
		linkedItems[] = {"BWA3_optic_EOTech","BWA3_acc_VarioRay_irlaser","rhsusf_acc_rotex5_grey","milgp_v_jpc_hgunner_belt_mc","milgp_h_opscore_01_CB","G_Balaclava_combat","ItemMap","ItemCompass","ItemWatch","tf_rf7800str"};
	};
	class ksk_expl
	{
		role = "Bundeswehr_KSK";
		displayName = "Sprengstoffspezialist"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
		// Exported from Arsenal by mindbl4ster
		uniformClass = "milgp_u_g3_field_set_mc";
		backpack = "milgp_bp_Breacher_mc";
		weapons[] = {"rhs_weap_hk416d10","BWA3_P8","Throw","Put"};
		magazines[] = {"BWA3_15Rnd_9x19_P8","HandGrenade","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","SmokeShell","SmokeShell","SmokeShell","SmokeShell","ACE_M84","ACE_M84","ACE_M84","ACE_M84","DemoCharge_Remote_Mag","DemoCharge_Remote_Mag"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_tourniquet","ACE_tourniquet","ACE_morphine","ACE_morphine","ACE_Flashlight_XL50","ACE_EarPlugs","ACE_CableTie","ACE_CableTie","ACE_CableTie","ACE_CableTie","ACE_MapTools","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_epinephrine","rhsusf_ANPVS_15","ACE_IR_Strobe_Item","ACE_Clacker","ACE_wirecutter","ACE_DefusalKit"};
		linkedItems[] = {"BWA3_optic_EOTech","BWA3_acc_VarioRay_irlaser","rhsusf_acc_rotex5_grey","milgp_v_jpc_assaulter_belt_mc","milgp_h_opscore_01_goggles_CB","G_Balaclava_blk","ItemMap","ItemCompass","ItemWatch","tf_rf7800str"};
	};
	class ksk_cfr
	{
		role = "Bundeswehr_KSK";
		displayName = "Sanitäter"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
		// Exported from Arsenal by mindbl4ster
		uniformClass = "milgp_u_g3_field_set_mc";
		backpack = "milgp_bp_hydration_mc";
		weapons[] = {"hlc_rifle_G36KA1KSK","BWA3_P8","Throw","Put"};
		magazines[] = {"hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","BWA3_15Rnd_9x19_P8","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","ACE_M84","ACE_M84"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_tourniquet","ACE_tourniquet","ACE_morphine","ACE_morphine","ACE_Flashlight_XL50","ACE_EarPlugs","ACE_CableTie","ACE_CableTie","ACE_CableTie","ACE_CableTie","ACE_MapTools","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_epinephrine","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_tourniquet","ACE_tourniquet","ACE_tourniquet","ACE_tourniquet","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_salineIV_500","ACE_salineIV_500","ACE_salineIV_500","ACE_salineIV_500","ACE_salineIV_500","ACE_salineIV_500","ACE_IR_Strobe_Item","rhsusf_ANPVS_15"};
		linkedItems[] = {"BWA3_optic_EOTech","BWA3_acc_VarioRay_irlaser","rhsusf_acc_rotex5_grey","milgp_v_jpc_medic_belt_mc","milgp_h_opscore_01_goggles_CB","G_Balaclava_blk","ItemMap","ItemCompass","ItemWatch","tf_rf7800str"};
	};
	class ksk_dmr
	{
		role = "Bundeswehr_KSK";
		displayName = "Gruppenscharfschütze"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
		// Exported from Arsenal by mindbl4ster
		uniformClass = "milgp_u_g3_field_set_mc";
		backpack = "milgp_bp_hydration_mc";
		weapons[] = {"BWA3_P8","arifle_SPAR_03_blk_F","BWA3_Vector","Throw","Put"};
		magazines[] = {"HandGrenade","SmokeShell","SmokeShell","SmokeShell","SmokeShell","ACE_M84","ACE_M84","BWA3_15Rnd_9x19_P8","BWA3_15Rnd_9x19_P8","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_tourniquet","ACE_tourniquet","ACE_morphine","ACE_morphine","ACE_Flashlight_XL50","ACE_EarPlugs","ACE_CableTie","ACE_CableTie","ACE_CableTie","ACE_CableTie","ACE_MapTools","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_epinephrine","rhsusf_ANPVS_15","ACE_IR_Strobe_Item","ACE_Kestrel4500","ACE_ATragMX","ACE_RangeCard"};
		linkedItems[] = {"hlc_muzzle_300blk_KAC","BWA3_acc_LLM01_irlaser","optic_AMS","milgp_v_jpc_marksman_belt_mc","milgp_h_opscore_01_goggles_CB","G_Balaclava_blk","ItemMap","ItemCompass","ItemWatch","tf_rf7800str"};
	};
	class usmc_rifle
	{
		role = "USMC";
		displayName = "Rifleman"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
		uniformClass = "rhs_uniform_FROG01_wd";
		backpack = "";
		weapons[] = {"Binocular","rhs_weap_m16a4_carryhandle","Throw","Put"};
		magazines[] = {"rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_an_m8hc","rhs_mag_an_m8hc","HandGrenade","HandGrenade","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag"};
		items[] = {"ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_epinephrine","ACE_epinephrine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_EarPlugs","ACE_tourniquet","ACE_tourniquet","ACE_Flashlight_MX991"};
		linkedItems[] = {"rhsusf_acc_ACOG_RMR","itemradio","rhsusf_spc_rifleman","rhsusf_lwh_helmet_marpatwd_headset","rhs_googles_black","ItemMap","ItemCompass","ItemWatch","ItemGPS","rhsusf_ANPVS_14"};
	};
	class usmc_lmg
	{
		role = "USMC";
		displayName = "Autorifleman (IAR27)"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
		uniformClass =  "rhs_uniform_FROG01_wd";
		backpack = "";
		weapons[] = {"rhs_weap_m27iar_grip","Binocular","Throw","Put"};
		magazines[] = {"rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_an_m8hc","rhs_mag_an_m8hc","rhs_mag_m67","rhs_mag_m67","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag"};
		items[] = {"ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_epinephrine","ACE_epinephrine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_EarPlugs","ACE_tourniquet","ACE_tourniquet","ACE_Flashlight_MX991"};
		linkedItems[] = {"rhsusf_acc_ACOG_RMR","itemRadio","rhsusf_spc_iar","rhsusf_lwh_helmet_marpatwd_headset","rhs_googles_black","ItemMap","ItemCompass","ItemWatch","ItemGPS","rhsusf_ANPVS_14"};
	};
	class usmc_gren
	{
		role = "USMC";
		displayName = "Grenadier"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
			uniformClass = "rhs_uniform_FROG01_wd";
backpack = "";
weapons[] = {"ACE_Vector","rhs_weap_m16a4_carryhandle_M203","Throw","Put"};
magazines[] = {"rhs_mag_an_m8hc","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_M441_HE","rhs_mag_M441_HE","rhs_mag_M441_HE","rhs_mag_M441_HE","rhs_mag_M441_HE","rhs_mag_M441_HE","rhs_mag_M441_HE","rhs_mag_M441_HE","rhs_mag_M433_HEDP","rhs_mag_M433_HEDP","rhs_mag_M433_HEDP","rhs_mag_M433_HEDP","rhs_mag_M433_HEDP","rhs_mag_M433_HEDP","rhs_mag_an_m8hc","rhs_mag_m67","rhs_mag_m67"};
items[] = {"ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_epinephrine","ACE_epinephrine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_EarPlugs","ACE_tourniquet","ACE_tourniquet","ACE_Flashlight_MX991"};
linkedItems[] = {"rhsusf_acc_ACOG_RMR","itemradio","rhsusf_spc_teamleader","rhsusf_lwh_helmet_marpatwd_headset","rhs_googles_black","ItemMap","ItemCompass","ItemWatch","ItemGPS","rhsusf_ANPVS_14"};
	};
	class usmc_sql
	{
		role = "USMC";
		displayName = "Squadleader"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
			uniformClass = "rhs_uniform_FROG01_wd";
backpack = "tf_rt1523g_sage";
weapons[] = {"ACE_Vector","rhsusf_weap_m9","rhs_weap_m4a1_carryhandle","Throw","Put"};
magazines[] = {"rhsusf_mag_15Rnd_9x19_JHP","rhsusf_mag_15Rnd_9x19_JHP","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_an_m8hc","rhs_mag_an_m8hc","rhs_mag_m18_green","rhs_mag_m18_green","rhs_mag_m18_red","rhs_mag_m18_red","rhs_mag_m67","rhs_mag_m67"};
items[] = {"ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_epinephrine","ACE_epinephrine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_EarPlugs","ACE_tourniquet","ACE_tourniquet","ACE_Flashlight_MX991"};
linkedItems[] = {"rhsusf_acc_ACOG_RMR","itemradio","rhsusf_spc_squadleader","rhsusf_mich_helmet_marpatwd_norotos_headset","rhs_googles_black","ItemMap","ItemCompass","ItemWatch","ItemGPS","rhsusf_ANPVS_14"};
	};
	class usmc_cfr
	{
		role = "USMC";
		displayName = "Combat first responder"; // Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
			uniformClass = "rhs_uniform_FROG01_wd";
backpack = "rhsusf_assault_eagleaiii_coy";
weapons[] = {"ACE_Vector","rhs_weap_m4a1_carryhandle","Throw","Put"};
magazines[] = {"rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_an_m8hc","rhs_mag_an_m8hc","rhs_mag_m18_green","rhs_mag_m18_green","rhs_mag_m18_red","rhs_mag_m18_red","rhs_mag_m67","rhs_mag_m67","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag"};
items[] = {"ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_epinephrine","ACE_epinephrine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_EarPlugs","ACE_tourniquet","ACE_tourniquet","ACE_Flashlight_MX991","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_adenosine","ACE_adenosine","ACE_adenosine","ACE_adenosine","ACE_adenosine","ACE_adenosine","ACE_adenosine","ACE_adenosine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_salineIV_250","ACE_salineIV_250","ACE_salineIV_250","ACE_salineIV_250","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_surgicalKit","ACE_tourniquet","ACE_tourniquet","ACE_tourniquet","ACE_tourniquet","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_salineIV_500","ACE_salineIV_500","ACE_salineIV_250","ACE_salineIV_250","ACE_salineIV_500"};
linkedItems[] = {"rhsusf_acc_ACOG_RMR","itemradio","rhsusf_spc_corpsman","rhsusf_lwh_helmet_marpatwd_headset","rhs_googles_black","ItemMap","ItemCompass","ItemWatch","ItemGPS","rhsusf_ANPVS_14"};
	};
};

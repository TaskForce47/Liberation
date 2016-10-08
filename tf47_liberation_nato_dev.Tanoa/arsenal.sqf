// If left empty, everything is allowed, otherwise only whitelisted items will be available
/*
GRLIB_arsenal_weapons = [

];

GRLIB_arsenal_magazines = [

];

GRLIB_arsenal_items = [

];

GRLIB_arsenal_backpacks = [

];

isclass (configfile >> "CfgPatches" >> "BWA3_Flag")
isclass (configfile >> "CfgPatches" >> "hlcweapons_G36")
isclass (configfile >> "CfgPatches" >> "hlcweapons_g3")
isclass (configfile >> "CfgPatches" >> "hlcweapons_mp5")
isclass (configfile >> "CfgPatches" >> "hlcweapons_core")
isclass (configfile >> "CfgPatches" >> "UK3CB_BAF_Equipment")
isclass (configfile >> "CfgPatches" >> "task_force_radio")
isclass (configfile >> "CfgPatches" >> "rhsusf_main")
isclass (configfile >> "CfgPatches" >> "JS_JC_FA18")
isclass (configfile >> "CfgPatches" >> "JS_JC_SU35")

*/

// If left empty, everything is allowed, otherwise only whitelisted items will be available
GRLIB_arsenal_weapons = [
"hgun_Pistol_heavy_01_F",
 "srifle_DMR_03_F",
"srifle_LRR_tna_F",
"srifle_LRR_camo_F",
"srifle_LRR_F",
	"rhsusf_weap_m1911a1",
	"rhsusf_weap_m9",
	"UK3CB_BAF_Soflam_Laserdesignator",
	"rhs_weap_m4a1_blockII_wd",
	"rhs_weap_m4a1_blockII_M203_wd",
	"rhs_weap_m4a1_blockII_KAC_wd",
	"rhs_weap_mk18_bk",
	"rhs_weap_mk18_KAC_bk",
	"rhs_weap_mk18_wd",
	"rhs_weap_mk18_KAC_wd",
	"rhs_weap_m72a7",
	"rhsusf_weap_MP7A1_base_f",
	"rhs_weap_hk416d10",
	"rhs_weap_hk416d10_m320",
	"rhs_weap_hk416d10_LMT",
	"rhs_weap_hk416d145",
	"rhs_weap_hk416d145_m320",
	"ACE_VMM3",
	"ACE_VMM3",
	"ACE_Yardage450",	
	"ACE_Vector",
	"ACE_MX2A",
	"Binocular",
	"arifle_SDAR_F",
	"rhs_weap_M320",
	"rhs_weap_XM2010",
	"rhs_weap_XM2010_d",
	"rhs_weap_XM2010_wd",
	"rhs_weap_XM2010_sa",
	"rhs_weap_m24sws",
	"rhs_weap_m24sws_blk",
	"rhs_weap_m24sws_ghillie",
	"rhs_weap_m4", "rhs_weap_m4_pmag", "rhs_weap_m4_mstock", "rhs_weap_m4_carryhandle", "rhs_weap_m4_carryhandle_pmag", "rhs_weap_m4_carryhandle_mstock", "rhs_weap_m4_grip", "rhs_weap_m4_grip2", "rhs_weap_m4_grip3", "rhs_weap_m4_pmag_grip", "rhs_weap_m4_pmag_grip2", "rhs_weap_m4_pmag_grip3", "rhs_weap_m4_mstock_grip", "rhs_weap_m4_mstock_grip2", "rhs_weap_m4_mstock_grip3", "rhs_weap_m4_carryhandle_grip", "rhs_weap_m4_carryhandle_grip2", "rhs_weap_m4_carryhandle_grip3", "rhs_weap_m4_carryhandle_pmag_grip", "rhs_weap_m4_carryhandle_pmag_grip2", "rhs_weap_m4_carryhandle_pmag_grip3", "rhs_weap_m4_carryhandle_mstock_grip", "rhs_weap_m4_carryhandle_mstock_grip2", "rhs_weap_m4_carryhandle_mstock_grip3", "rhs_weap_m4_m320", "rhs_weap_m4_m203", "rhs_weap_m4_m203S", "rhs_weap_m4a1", "rhs_weap_m4a1_d", "rhs_weap_m4a1_mstock", "rhs_weap_m4a1_d_mstock", "rhs_weap_m4a1_pmag", "rhs_weap_m4a1_carryhandle", "rhs_weap_m4a1_carryhandle_mstock", "rhs_weap_m4a1_carryhandle_pmag", "rhs_weap_m4a1_grip", "rhs_weap_m4a1_grip2", "rhs_weap_m4a1_grip3", "rhs_weap_m4a1_d_grip", "rhs_weap_m4a1_d_grip2", "rhs_weap_m4a1_d_grip3", "rhs_weap_m4a1_pmag_grip", "rhs_weap_m4a1_pmag_grip2", "rhs_weap_m4a1_pmag_grip3", "rhs_weap_m4a1_mstock_grip", "rhs_weap_m4a1_mstock_grip2", "rhs_weap_m4a1_mstock_grip3", "rhs_weap_m4a1_d_mstock_grip", "rhs_weap_m4a1_d_mstock_grip2", "rhs_weap_m4a1_d_mstock_grip3", "rhs_weap_m4a1_carryhandle_grip", "rhs_weap_m4a1_carryhandle_grip2", "rhs_weap_m4a1_carryhandle_grip3", "rhs_weap_m4a1_carryhandle_pmag_grip", "rhs_weap_m4a1_carryhandle_pmag_grip2", "rhs_weap_m4a1_carryhandle_pmag_grip3", "rhs_weap_m4a1_carryhandle_mstock_grip", "rhs_weap_m4a1_carryhandle_mstock_grip2", "rhs_weap_m4a1_carryhandle_mstock_grip3", "rhs_weap_m4a1_m203", "rhs_weap_m4a1_m203s", "rhs_weap_m4a1_m203s_wd", "rhs_weap_m4a1_m203s_d", "rhs_weap_m4a1_m203s_sa", "rhs_weap_m4a1_carryhandle_m203", "rhs_weap_m4a1_carryhandle_m203S", "rhs_weap_m4a1_m320", "rhs_weap_m4a1_blockII", "rhs_weap_m4a1_blockII_bk", "rhs_weap_m4a1_blockII_wd", "rhs_weap_m4a1_blockII_d", "rhs_weap_m4a1_blockII_KAC", "rhs_weap_m4a1_blockII_KAC_bk", "rhs_weap_m4a1_blockII_KAC_wd", "rhs_weap_m4a1_blockII_KAC_d", "rhs_weap_m4a1_blockII_grip", "rhs_weap_m4a1_blockII_grip2", "rhs_weap_m4a1_blockII_grip_bk", "rhs_weap_m4a1_blockII_grip2_bk", "rhs_weap_m4a1_blockII_grip_wd", "rhs_weap_m4a1_blockII_grip2_wd", "rhs_weap_m4a1_blockII_grip_d", "rhs_weap_m4a1_blockII_grip2_d", "rhs_weap_m4a1_blockII_grip_KAC", "rhs_weap_m4a1_blockII_grip2_KAC", "rhs_weap_m4a1_blockII_grip_KAC_bk", "rhs_weap_m4a1_blockII_grip2_KAC_bk", "rhs_weap_m4a1_blockII_grip_KAC_wd", "rhs_weap_m4a1_blockII_grip2_KAC_wd", "rhs_weap_m4a1_blockII_grip_KAC_d", "rhs_weap_m4a1_blockII_grip2_KAC_d", "rhs_weap_m4a1_blockII_M203", "rhs_weap_m4a1_blockII_M203_bk", "rhs_weap_m4a1_blockII_M203_d", "rhs_weap_m4a1_blockII_M203_wd", "rhs_weap_mk18", "rhs_weap_mk18_bk", "rhs_weap_mk18_wd", "rhs_weap_mk18_d", "rhs_weap_mk18_KAC", "rhs_weap_mk18_KAC_bk", "rhs_weap_mk18_KAC_wd", "rhs_weap_mk18_KAC_d", "rhs_weap_mk18_grip", "rhs_weap_mk18_grip2", "rhs_weap_mk18_grip_bk", "rhs_weap_mk18_grip2_bk", "rhs_weap_mk18_grip_wd", "rhs_weap_mk18_grip2_wd", "rhs_weap_mk18_grip_d", "rhs_weap_mk18_grip2_d", "rhs_weap_mk18_grip_KAC", "rhs_weap_mk18_grip2_KAC", "rhs_weap_mk18_grip_KAC_bk", "rhs_weap_mk18_grip2_KAC_bk", "rhs_weap_mk18_grip_KAC_wd", "rhs_weap_mk18_grip2_KAC_wd", "rhs_weap_mk18_grip_KAC_d", "rhs_weap_mk18_grip2_KAC_d", "rhs_weap_mk18_m320", "rhs_weap_m16a4", "rhs_weap_m16a4_pmag", "rhs_weap_m16a4_carryhandle", "rhs_weap_m16a4_carryhandle_pmag", "rhs_weap_m16a4_grip", "rhs_weap_m16a4_grip2", "rhs_weap_m16a4_grip3", "rhs_weap_m16a4_pmag_grip", "rhs_weap_m16a4_pmag_grip2", "rhs_weap_m16a4_pmag_grip3", "rhs_weap_m16a4_carryhandle_grip", "rhs_weap_m16a4_carryhandle_grip2", "rhs_weap_m16a4_carryhandle_grip3", "rhs_weap_m16a4_carryhandle_grip_pmag", "rhs_weap_m16a4_carryhandle_grip2_pmag", "rhs_weap_m16a4_carryhandle_grip3_pmag", "rhs_weap_m16a4_carryhandle_M203", "rhs_weap_hk416d10", "rhs_weap_hk416d10_grip", "rhs_weap_hk416d10_grip2", "rhs_weap_hk416d10_grip3", "rhs_weap_hk416d145", "rhs_weap_hk416d145_grip", "rhs_weap_hk416d145_grip2", "rhs_weap_hk416d145_grip3", "rhs_weap_hk416d10_LMT", "rhs_weap_hk416d10_LMT_grip", "rhs_weap_hk416d10_LMT_grip2", "rhs_weap_hk416d10_LMT_grip3", "rhs_weap_hk416d10_m320", "rhs_weap_hk416d145_m320", "rhs_weap_m27iar", "rhs_weap_m27iar_grip", "rhs_weap_m27iar_grip2", "rhs_weap_m27iar_grip3",
	"rhs_weap_lmg_minimipara",
	"rhs_weap_lmg_minimi_railed",
	"rhs_weap_m249_pip_S",
	"rhs_weap_m249_pip_S_para",
	"rhs_weap_m249_pip_S_vfg",
	"rhs_weap_m249_pip",
	"rhs_weap_m249_pip_L",
	"rhs_weap_m249_pip_L_para",
	"rhs_weap_m249_pip_L_vfg",
	"rhs_weap_m240B",
	"rhs_weap_m240G",
	"rhs_weap_m240B_CAP",
	"rhs_weap_m14ebrri",
	"rhs_weap_sr25",
	"rhs_weap_sr25_ec",
	"rhs_weap_m110",
	"rhs_weap_M590_5RD",
	"rhs_weap_M590_8RD",
	"rhs_weap_m32",
	"rhs_weap_M136",
	"rhs_weap_M136_hedp",
	"rhs_weap_M136_hp",
	"rhs_weap_fim92",
	"rhs_weap_fgm148"
];

GRLIB_arsenal_magazines = [

];

GRLIB_arsenal_items = [
"rhsusf_acc_premier",
"rhsusf_acc_premier_anpvs27",
	"G_B_Diving",
	"V_RebreatherB",
	"U_B_Wetsuit",
	"U_B_FullGhillie_ard",
	"U_B_FullGhillie_lsh",
	"U_B_FullGhillie_sard",
	"U_B_T_FullGhillie_tna_F",
	"Gen3_aor1",
	"Gen3_aor2",
	"Gen3_atacsau",
	"U_B_PilotCoveralls",
	"Gen3_atacsfg",
	"Gen3_Blk",
	"Gen3_M81",
	"Gen3_mcarid",
	"Gen3_mctropical",
	"Gen3_Multicam",
	"Gen3_Ranger",
	"Gen3_Tan",
	"lbt_comms_aor1",
	"lbt_light_aor1",
	"lbt_medical_aor1",
	"lbt_operator_aor1",
	"lbt_pouchless_aor1",
	"lbt_tl_aor1",
	"lbt_weapons_aor1",
	"lbt_comms_aor2",
	"lbt_light_aor2",
	"lbt_medical_aor2",
	"lbt_operator_aor2",
	"lbt_pouchless_aor2",
	"lbt_tl_aor2",
	"lbt_weapons_aor2",
	"lbt_comms_coy",
	"lbt_light_coy",
	"lbt_medical_coy",
	"lbt_operator_coy",
	"lbt_pouchless_coy",
	"lbt_tl_coy",
	"lbt_weapons_coy",
	"lbt_comms_mc",
	"lbt_light_mc",
	"lbt_medical_mc",
	"lbt_operator_mc",
	"lbt_pouchless_mc",
	"lbt_tl_mc",
	"lbt_weapons_mc",
	"lbt_comms_od",
	"lbt_light_od",
	"lbt_medical_od",
	"lbt_operator_od",
	"lbt_pouchless_od",
	"lbt_tl_od",
	"lbt_weapons_od",
	"rhsusf_opscore_aor1",
	"rhsusf_opscore_aor1_pelt_nsw",
	"rhsusf_opscore_aor2",
	"rhsusf_opscore_aor2_pelt",
	"rhsusf_opscore_aor2_pelt_nsw",
	"rhsusf_opscore_bk",
	"rhsusf_opscore_bk_pelt",
	"rhsusf_opscore_coy_cover",
	"rhsusf_opscore_coy_cover_pelt",
	"rhsusf_opscore_fg",
	"rhsusf_opscore_fg_pelt",
	"rhsusf_opscore_fg_pelt_cam",
	"rhsusf_opscore_fg_pelt_nsw",
	"rhsusf_opscore_mc_cover",
	"rhsusf_opscore_mc_cover_pelt",
	"rhsusf_opscore_mc_cover_pelt_nsw",
	"rhsusf_opscore_mc_cover_pelt_cam",
	"rhsusf_opscore_mc",
	"rhsusf_opscore_mc_pelt",
	"rhsusf_opscore_mc_pelt_nsw",
	"rhsusf_opscore_paint",
	"rhsusf_opscore_paint_pelt",
	"rhsusf_opscore_paint_pelt_nsw",
	"rhsusf_opscore_paint_pelt_nsw_cam",
	"rhsusf_opscore_rg_cover",
	"rhsusf_opscore_rg_cover_pelt",
	"rhsusf_opscore_ut",
	"rhsusf_opscore_ut_pelt",
	"rhsusf_opscore_ut_pelt_cam",
	"rhsusf_opscore_ut_pelt_nsw",
	"rhsusf_opscore_ut_pelt_nsw_cam",
	"rhsusf_acc_harris_bipod",
	"rhsusf_acc_anpeq15A",
	"rhsusf_acc_anpeq15",
	"rhsusf_acc_anpeq15_light",
	"rhsusf_acc_anpeq15side",
	"rhsusf_acc_M2010S",
	"rhsusf_acc_SR25S",
	"rhsusf_acc_rotex5_grey",
	"rhsusf_acc_rotex5_tan",
	"rhsusf_acc_nt4_black",
	"rhsusf_acc_nt4_tan",
	"rhsusf_acc_muzzleFlash_SF",
	"rhsusf_acc_SF3P556",
	"rhsusf_acc_SFMB556",
	"rhsusf_acc_sniper_base",
	"rhsusf_acc_compm4",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_SpecterDR",
	"rhsusf_acc_SpecterDR_OD",
	"rhsusf_acc_SpecterDR_D",
	"rhsusf_acc_SpecterDR_A",
	"rhsusf_acc_anpvs27",
	"RKSL_optic_RMR_MS19",
	"rhsusf_acc_LEUPOLDMK4",
	"rhsusf_acc_ELCAN",
	"rhsusf_acc_ELCAN_ard",
	"rhsusf_acc_ELCAN_pip",
	"rhsusf_acc_ACOG",
	"rhsusf_acc_ACOG_wd",
	"rhsusf_acc_ACOG_d",
	"rhsusf_acc_ACOG_sa",
	"rhsusf_acc_ACOG_pip",
	"rhsusf_acc_ACOG2",
	"rhsusf_acc_ACOG3",
	"rhsusf_acc_ACOG_USMC",
	"rhsusf_acc_ACOG2_USMC",
	"rhsusf_acc_ACOG3_USMC",
	"rhsusf_acc_LEUPOLDMK4_2",
	"rhsusf_acc_EOTECH",
	"rhsusf_acc_M2A1",
	"rhsusf_acc_premier_low",
	"rhs_uniform_cu_ocp",
	"rhs_uniform_cu_ucp",
	"rhs_uniform_cu_ocp_1stcav",
	"rhs_uniform_cu_ucp_1stcav",
	"rhs_uniform_cu_ocp_82nd",
	"rhs_uniform_cu_ucp_82nd",
	"rhs_uniform_cu_ocp_101st",
	"rhs_uniform_cu_ucp_101st",
	"rhs_uniform_cu_ocp_10th",
	"rhs_uniform_cu_ucp_10th",
	"rhs_uniform_cu_ucp_patchless",
	"rhs_uniform_cu_ocp_patchless",
	"rhs_uniform_FROG01_d",
	"rhs_uniform_FROG01_wd",
	"rhs_uniform_FROG01_m81",
	"rhsusf_patrolcap_ocp",
	"rhsusf_patrolcap_ucp",
	"rhs_Booniehat_ocp",
	"rhs_Booniehat_ucp",
	"rhs_Booniehat_marpatd",
	"rhs_Booniehat_marpatwd",
	"rhs_Booniehat_m81",
	"rhsusf_ach_helmet_ocp",
	"rhsusf_ach_helmet_ocp_norotos",
	"rhsusf_ach_helmet_ucp",
	"rhsusf_ach_helmet_ucp_norotos",
	"rhsusf_ach_helmet_M81",
	"rhsusf_ach_helmet_camo_ocp",
	"rhsusf_ach_helmet_headset_ocp",
	"rhsusf_ach_helmet_headset_ucp",
	"rhsusf_ach_helmet_ESS_ocp",
	"rhsusf_ach_helmet_ESS_ucp",
	"H_PilotHelmetFighter_B",
	"rhsusf_ach_helmet_headset_ess_ocp",
	"rhsusf_ach_helmet_headset_ess_ucp",
	"rhsusf_ach_bare",
	"rhsusf_ach_bare_ess",
	"rhsusf_ach_bare_headset",
	"G_Balaclava_TI_G_tna_F",
	"rhsusf_ach_bare_headset_ess",
	"rhsusf_ach_bare_tan",
	"rhsusf_ach_bare_tan_ess",
	"rhsusf_ach_bare_tan_headset",
	"rhsusf_ach_bare_tan_headset_ess",
	"rhsusf_ach_bare_wood",
	"rhsusf_ach_bare_wood_ess",
	"rhsusf_ach_bare_wood_headset",
	"rhsusf_ach_bare_wood_headset_ess",
	"rhsusf_ach_bare_des",
	"rhsusf_ach_bare_des_ess",
	"rhsusf_ach_bare_des_headset",
	"rhsusf_ach_bare_des_headset_ess",
	"rhsusf_ach_bare_semi",
	"rhsusf_ach_bare_semi_ess",
	"rhsusf_ach_bare_semi_headset",
	"rhsusf_ach_bare_semi_headset_ess",
	"rhsusf_opscore_01",
	"rhsusf_opscore_01_tan",
	"rhsusf_opscore_02",
	"rhsusf_opscore_02_tan",
	"rhsusf_opscore_03_ocp",
	"rhsusf_opscore_04_ocp",
	"rhsusf_cvc_helmet",
	"rhsusf_cvc_green_helmet",
	"rhsusf_cvc_ess",
	"rhsusf_cvc_green_ess",
	"rhsusf_hgu56p",
	"rhsusf_hgu56p_mask",
	"rhsusf_ANPVS_14",
	"rhsusf_ANPVS_15",
	"rhsusf_mich_helmet_marpatwd",
	"rhsusf_mich_helmet_marpatwd_headset",
	"rhsusf_mich_helmet_marpatd",
	"rhsusf_mich_helmet_marpatd_headset",
	"rhsusf_mich_helmet_marpatwd_alt",
	"rhsusf_mich_helmet_marpatwd_alt_headset",
	"rhsusf_mich_helmet_marpatd_alt",
	"rhsusf_mich_helmet_marpatd_alt_headset",
	"rhsusf_mich_helmet_marpatwd_norotos",
	"rhsusf_mich_helmet_marpatwd_norotos_headset",
	"rhsusf_mich_helmet_marpatd_norotos",
	"rhsusf_mich_helmet_marpatd_norotos_headset",
	"rhsusf_mich_helmet_marpatwd_norotos_arc",
	"rhsusf_mich_helmet_marpatwd_norotos_arc_headset",
	"rhsusf_mich_helmet_marpatd_norotos_arc",
	"rhsusf_mich_helmet_marpatd_norotos_arc_headset",
	"rhsusf_mich_bare",
	"rhsusf_mich_bare_headset",
	"rhsusf_mich_bare_alt",
	"rhsusf_mich_bare_norotos",
	"rhsusf_mich_bare_norotos_headset",
	"rhsusf_mich_bare_norotos_alt",
	"rhsusf_mich_bare_norotos_alt_headset",
	"rhsusf_mich_bare_norotos_arc",
	"rhsusf_mich_bare_norotos_arc_headset",
	"rhsusf_mich_bare_norotos_arc_alt",
	"rhsusf_mich_bare_norotos_arc_alt_headset",
	"rhsusf_mich_bare_tan",
	"rhsusf_mich_bare_tan_headset",
	"rhsusf_mich_bare_alt_tan",
	"rhsusf_mich_bare_norotos_tan",
	"rhsusf_mich_bare_norotos_tan_headset",
	"rhsusf_mich_bare_norotos_alt_tan",
	"rhsusf_mich_bare_norotos_alt_tan_headset",
	"rhsusf_mich_bare_norotos_arc_tan",
	"rhsusf_mich_bare_norotos_arc_tan_headset",
	"rhsusf_mich_bare_norotos_arc_alt_tan",
	"rhsusf_mich_bare_norotos_arc_alt_tan_headset",
	"rhsusf_mich_bare_semi",
	"rhsusf_mich_bare_semi_headset",
	"rhsusf_mich_bare_alt_semi",
	"rhsusf_mich_bare_norotos_semi",
	"rhsusf_mich_bare_norotos_semi_headset",
	"rhsusf_mich_bare_norotos_alt_semi",
	"rhsusf_mich_bare_norotos_alt_semi_headset",
	"rhsusf_mich_bare_norotos_arc_semi",
	"rhsusf_mich_bare_norotos_arc_semi_headset",
	"rhsusf_mich_bare_norotos_arc_alt_semi",
	"rhsusf_mich_bare_norotos_arc_alt_semi_headset",
	"rhsusf_lwh_helmet_marpatd",
	"rhsusf_lwh_helmet_marpatd_ess",
	"rhsusf_lwh_helmet_marpatd_headset",
	"rhsusf_lwh_helmet_marpatwd",
	"rhsusf_lwh_helmet_marpatwd_ess",
	"rhsusf_lwh_helmet_marpatwd_headset",
	"rhsusf_lwh_helmet_M1942",
	"rhsusf_Bowman",
	"rhsusf_bowman_cap",
	"RHS_jetpilot_usaf",
	"rhsusf_iotv_ocp_base",
	"rhsusf_iotv_ocp",
	"rhsusf_iotv_ocp_Grenadier",
	"rhsusf_iotv_ocp_Medic",
	"rhsusf_iotv_ocp_Repair",
	"rhsusf_iotv_ocp_Rifleman",
	"rhsusf_iotv_ocp_SAW",
	"rhsusf_iotv_ocp_Squadleader",
	"rhsusf_iotv_ocp_Teamleader",
	"rhsusf_iotv_ucp_base",
	"rhsusf_iotv_ucp",
	"rhsusf_iotv_ucp_Grenadier",
	"rhsusf_iotv_ucp_Medic",
	"rhsusf_iotv_ucp_Repair",
	"rhsusf_iotv_ucp_Rifleman",
	"rhsusf_iotv_ucp_SAW",
	"rhsusf_iotv_ucp_Squadleader",
	"rhsusf_iotv_ucp_Teamleader",
	"rhsusf_spc",
	"rhsusf_spc_rifleman",
	"rhsusf_spc_iar",
	"rhsusf_spc_corpsman",
	"rhsusf_spc_crewman",
	"rhsusf_spc_light",
	"rhsusf_spc_marksman",
	"rhsusf_spc_mg",
	"rhsusf_spc_squadleader",
	"rhsusf_spc_teamleader",
	"rhsusf_spcs_ocp",
	"rhsusf_spcs_ucp",
	/****************** RHS USF END ******************************/
	 "optic_MRD",
	"NVGoggles_OPFOR",
	"NVGoggles",
	"NVGoggles_INDEP",
	"NVGoggles_tna_F",
	"ItemCompass",
	"tf_microdagr",
	"ItemGPS",
	"ItemWatch",
	"rhs_acc_tgpv",
	"O_UavTerminal",
	"ACE_EarPlugs",
	"ACE_DefusalKit",
	"ACE_DeadManSwitch",
	"ACE_DAGR",
	"ACE_Cellphone",
	"ACE_CableTie",
	"ACE_bloodIV_250",
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_quikclot",
	"ACE_adenosine",
	"ACE_RangeTable_82mm",
	"ACE_ATragMX",
	"ACE_atropine",
	"ACE_Banana",
	"ACE_SpraypaintBlack",
	"ACE_bloodIV",
	"ACE_bloodIV_500",
	"ACE_SpraypaintBlue",
	"ACE_optic_SOS_2D",
	"ACE_optic_MRCO_2D",
	"ACE_optic_Hamr_2D",
	"ACE_optic_LRPS_2D",
	"ACE_optic_Arco_2D",
	"ACE_bodyBag",
	"ACE_EntrenchingTool",
	"ACE_epinephrine",
	"ACE_Flashlight_MX991",
	"ACE_SpraypaintGreen",
	"ACE_HuntIR_monitor",
	"ACE_IR_Strobe_Item",
	"ACE_Kestrel4500",
	"ACE_Flashlight_KSF1",
	"ACE_M26_Clacker",
	"ACE_Clacker",
	"ACE_Flashlight_XL50",
	"ACE_MapTools",
	"ACE_microDAGR",
	"MineDetector",
	"ACE_morphine",
	"ACE_packingBandage",
	"ACE_personalAidKit",
	"ACE_plasmaIV",
	"ACE_plasmaIV_250",
	"ACE_plasmaIV_500",
	"ACE_RangeCard",
	"ACE_salineIV",
	"ACE_SpraypaintRed",
	"ACE_salineIV_250",
	"ACE_salineIV_500",
	"ACE_Sandbag_empty",
	"ACE_SpottingScope",
	"ACE_Tripod",
	"ACE_surgicalKit",
	"ACE_tourniquet",
	"ToolKit",
	"ACE_UAVBattery",
	"ACE_wirecutter",
	"bipod_01_F_snd",
	"bipod_01_F_blk",
	"bipod_01_F_mtp",
	"bipod_02_F_blk",
	"bipod_02_F_tan",
	"bipod_03_F_blk",
	"bipod_03_F_oli",
	"ACE_optic_Hamr_PIP",
	"ACE_optic_SOS_PIP",
	"ACE_optic_LRPS_PIP",
	"ACE_optic_LRPS_2D",
	"ACE_optic_Arco_PIP",
	"ACE_optic_Arco_2D",
	"G_Diving",
	"ItemMap",
	"ItemGPS",
	"ItemCompass",
	"ItemWatch",
	"ACE_Altimeter",
	"tf_microdagr",
	"G_Balaclava_blk",
	"G_Balaclava_combat",
	"G_Balaclava_lowprofile",
	"G_Balaclava_oli",
	"rhs_ess_black",
	"G_Combat",
	"G_Combat_Goggles_tna_F",
	"rhs_Booniehat_m81",
	"rhs_booniehat2_marpatwd",
	"rhs_Booniehat_ocp",
	"rhs_8point_marpatwd",
	"optic_Hamr_khk_F",
	"optic_SOS_khk_F",
	"optic_Holosight_smg_blk_F",
	"optic_Holosight_khk_F",
	"optic_Holosight_blk_F",
	"optic_LRPS_tna_F",
	"optic_ERCO_khk_F",
	"optic_ERCO_blk_F",
	"optic_Arco_blk_F",
	"optic_KHS_blk",
	"optic_AMS_khk",
	"optic_AMS"
];

GRLIB_arsenal_backpacks = [
	"B_AssaultPack_mcamo",
	"B_AssaultPack_khk",
	"B_AssaultPack_rgr",
	"B_AssaultPack_cbr",
	"B_Bergen_mcamo_F",
	"B_Bergen_dgtl_F",
	"B_Bergen_tna_F",
	"B_Carryall_cbr",
	"B_Carryall_ocamo",
	"B_Parachute",
	"B_Kitbag_cbr",
	"B_Kitbag_rgr",
	"B_Kitbag_mcamo",
	"B_Kitbag_sgg",
	"ace_gunbag",
	"ace_gunbag_Tan",
	"ACE_TacticalLadder_Pack",
	"B_Kitbag_rgr",
	"B_FieldPack_oli"
];
if(	!(isclass (configfile >> "CfgPatches" >> "BWA3_Flag")	)	)exitWith{"3CB BAF not initialized!" remoteExec ["systemchat",0]};

if(isDedicated)exitWith{};

{GRLIB_arsenal_weapons pushBack _x}forEach [
"hlc_rifle_awcovert_BL",
"hlc_rifle_awcovert_FDE",
"hlc_rifle_awcovert",
"hlc_rifle_awmagnum_BL",
"hlc_rifle_awMagnum_BL_ghillie",
"hlc_rifle_awmagnum_FDE",
"hlc_rifle_awMagnum_FDE_ghillie",
"hlc_rifle_awmagnum",
"hlc_rifle_awMagnum_OD_ghillie",
"hlc_rifle_g3a3",
"hlc_rifle_g3a3v",
"hlc_rifle_g3a3ris",
"hlc_rifle_g3ka4",
"HLC_Rifle_g3ka4_GL",	
"hlc_rifle_g3sg1",
"hlc_rifle_G36A1",
"hlc_rifle_G36A1AG36",
"hlc_rifle_G36C",
"hlc_rifle_G36CV",
"hlc_rifle_G36CTac",
"hlc_rifle_G36E1",
"hlc_rifle_G36E1AG36",
"hlc_rifle_G36KA1",
"hlc_rifle_G36KE1",
"hlc_rifle_G36KV",
"hlc_rifle_g36KTac",
"hlc_rifle_G36V",
"hlc_rifle_G36VAG36",
"hlc_rifle_G36TAC",
"hlc_smg_mp510",
"hlc_smg_mp5a2",
"hlc_smg_mp5a3",
"hlc_smg_mp5a4",
"hlc_smg_mp5k_PDW",
"hlc_smg_MP5N",
"hlc_smg_9mmar",
"hlc_smg_mp5sd5",
"hlc_smg_mp5sd6",
"hlc_rifle_augsrcarb_b",
"hlc_rifle_augsrcarb",
"hlc_rifle_augsrhbar_b",
"hlc_rifle_augsrhbar",
"hlc_rifle_augsrhbar_t",
"hlc_rifle_augsr_b",
"hlc_rifle_augsr",
"hlc_rifle_augsr_t",
"hlc_rifle_augsrcarb_t",
"hlc_rifle_augpara_b",
"hlc_rifle_augpara",
"hlc_rifle_augpara_t",
"hlc_rifle_auga1carb_B",
"hlc_rifle_auga1carb",
"hlc_rifle_auga1carb_t",
"hlc_rifle_aughbar_B",
"hlc_rifle_aughbar",
"hlc_rifle_aughbar_t",
"hlc_rifle_auga1_b",
"hlc_rifle_aug",
"hlc_rifle_auga1_t",
"hlc_rifle_auga2para_b",
"hlc_rifle_auga2para",
"hlc_rifle_auga2para_t",
"hlc_rifle_auga2carb_b",
"hlc_rifle_auga2carb_t",
"hlc_rifle_auga2carb",
"hlc_rifle_auga2lsw_b",
"hlc_rifle_auga2lsw",
"hlc_rifle_auga2lsw_t",
"hlc_rifle_auga2_b",
"hlc_rifle_auga2",
"hlc_rifle_auga2_t",
"hlc_rifle_auga3_GL_B",
"hlc_rifle_auga3_GL_BL",
"hlc_rifle_auga3_GL",
"hlc_rifle_auga3_b",
"hlc_rifle_auga3_bl",
"hlc_rifle_auga3",
"hlc_rifle_STG58F",
"hlc_lmg_mk48"
];

{GRLIB_arsenal_items pushBack _x}forEach [
"HLC_Optic_G36dualoptic35x",
"HLC_Optic_G36Dualoptic15x2d",
"HLC_Optic_G36Dualoptic15x",
"HLC_Optic_G36dualoptic35x2d",
"HLC_Optic_G36Export15x",
"HLC_Optic_G36Export15x2d",
"HLC_Optic_G36Export35x",
"HLC_Optic_G36Export35x2d",
"rhs_acc_rakursPM",
"hlc_muzzle_snds_g3",
"hlc_muzzle_snds_fal",
"hlc_muzzle_300blk_KAC",
"hlc_optic_accupoint_g3",
"HLC_Optic_ZFSG1"
];

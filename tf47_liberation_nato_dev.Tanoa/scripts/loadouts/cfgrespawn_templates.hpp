 class CfgRoles
 {
      class riflemanCTI
      {
           displayName = "Rifleman";
           icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
      };
 };
class CfgRespawnInventory 
{
    class riflemanUSMC
    {
		displayName	=	"Rifleman (USMC)";
        role = "riflemanCTI";
		uniformClass = "rhs_uniformClass_FROG01_wd";
		backpack = "";
		weapons[] = {"rhs_weap_m4a1_carryhandle","Throw","Put"};
		magazines[] = {"rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag"};
		items[] = {};
		linkedItems[] = {"rhsusf_spc_rifleman","rhsusf_lwh_helmet_marpatwd_headset_blk","","ItemMap","ItemCompass","tf_microdagr"};
    };
    class riflemanRM
    {
		uniformClass = "UK3CB_BAF_U_CombatUniform_DPMW_ShortSleeve";
		backpack = "";
		weapons[] = {"UK3CB_BAF_L85A2_EMAG","Throw","Put"};
		magazines[] = {"UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd"};
		items[] = {};
		linkedItems[] = {"UK3CB_BAF_V_Osprey_DPMW9","UK3CB_BAF_H_Mk6_DPMW_F","","ItemMap","ItemCompass","tf_microdagr"};
		displayName	=	"Rifleman (BAF)";
        role = "riflemanCTI";
	};
	class riflemanGER
    {
		displayName	=	"Rifleman (BW)";
        role = "riflemanCTI";
		uniformClass = "BWA3_Uniform3_idz_Fleck";
		backpack = "";
		weapons[] = {"hlc_rifle_G36KA1","Throw","Put"};
		magazines[] = {"hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36"};
		items[] = {};
		linkedItems[] = {"BWA3_Vest_Rifleman1_Fleck","BWA3_MICH_Fleck","","ItemMap","ItemCompass","tf_microdagr"};
    };
};
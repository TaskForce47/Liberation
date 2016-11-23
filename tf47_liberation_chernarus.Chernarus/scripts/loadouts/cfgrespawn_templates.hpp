 class CfgRoles
 {
      class bw
      {
           displayName = "Bundeswehr";
           icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
      };
	  class baf
      {
           displayName = "British Armed Forces";
           icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
      };
	  class usmc
      {
           displayName = "US Marine Corps";
           icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
      };
	  class usarmy
      {
           displayName = "US Army";
           icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
      };
 };
class CfgRespawnInventory 
{
    class riflemanUSMC
    {
		displayName	=	"Rifleman (USMC)";
        role = "usmc";
		// Exported from Arsenal by mindbl4ster
		uniformClass = "rhs_uniform_FROG01_wd";
		backpack = "";
		weapons[] = {"rhs_weap_m16a4_carryhandle_pmag","rhs_weap_M136","Binocular","Throw","Put"};
		magazines[] = {"rhs_m136_mag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_an_m8hc","rhs_mag_an_m8hc","rhs_mag_f1","rhs_mag_f1","rhs_mag_30Rnd_556x45_Mk318_Stanag"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_CableTie","ACE_CableTie","ACE_Flashlight_MX991","ACE_IR_Strobe_Item","ACE_MapTools","ACE_morphine","ACE_morphine","ACE_morphine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_salineIV_250","ACE_salineIV_250","ACE_tourniquet","ACE_tourniquet"};
		linkedItems[] = {"rhsusf_spc_rifleman","rhsusf_lwh_helmet_marpatwd","rhsusf_acc_ACOG","ItemMap","ItemCompass","ItemGPS"};


    };
	class riflemanUSA
	{
		displayName	=	"Rifleman (US Army)";
        role = "usarmy";
		// Exported from Arsenal by mindbl4ster
		uniformClass = "rhs_uniform_cu_ocp";
		backpack = "";
		weapons[] = {"rhs_weap_M136","UK3CB_BAF_L131A1","Binocular","rhs_weap_m4a1_carryhandle_pmag","Throw","Put"};
		magazines[] = {"rhs_mag_an_m8hc","rhs_mag_an_m8hc","rhs_mag_f1","rhs_mag_f1","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_CableTie","ACE_CableTie","ACE_EarPlugs","ACE_Flashlight_MX991","ACE_IR_Strobe_Item","ACE_MapTools","ACE_morphine","ACE_morphine","ACE_morphine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_salineIV_250","ACE_salineIV_250","ACE_tourniquet","ACE_tourniquet"};
		linkedItems[] = {"rhsusf_iotv_ocp_Rifleman","rhsusf_ach_helmet_ESS_ocp","","ItemMap","ItemCompass","tf_anprc148jem_2","ItemGPS"};

	};
    class riflemanRM
    {
		displayName	=	"Rifleman (BAF)";
        role = "baf";

		uniformClass = "UK3CB_BAF_U_CombatUniform_DPMW_RM";
		backpack = "";
		weapons[] = {"UK3CB_BAF_L85A2_RIS","UK3CB_BAF_L131A1","Binocular","Throw","Put"};
		magazines[] = {"Chemlight_blue","SmokeShellBlue","SmokeShell","UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd_T","UK3CB_BAF_556_30Rnd_T","UK3CB_BAF_556_30Rnd_T","UK3CB_BAF_9_17Rnd","UK3CB_BAF_9_17Rnd"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_CableTie","ACE_CableTie","ACE_EarPlugs","ACE_morphine","ACE_morphine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_Flashlight_XL50","ACE_MapTools"};
		linkedItems[] = {"UK3CB_BAF_V_Osprey_DPMW2","UK3CB_BAF_H_Mk6_DPMW_A","rhs_googles_yellow","ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","rhsusf_ANPVS_14"};
	};
	class riflemanGER
    {
		displayName	=	"Rifleman (BW)";
        role = "bw";
		// Exported from Arsenal by Crewt
		uniformClass = "BWA3_Uniform3_idz_Fleck";
		backpack = "";
		weapons[] = {"hlc_rifle_G36V","Throw","Put"};
		magazines[] = {"hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","SmokeShellBlue","HandGrenade","HandGrenade","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_Tracers_G36"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_CableTie","ACE_CableTie","ACE_CableTie","ACE_EarPlugs","ACE_morphine","ACE_morphine","ACE_morphine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_tourniquet","ACE_tourniquet","ACE_morphine","ACE_tourniquet","ACE_tourniquet","ACE_microDAGR","BWA3_optic_NSV80","BWA3_optic_NSV600"};
		linkedItems[] = {"BWA3_Vest_Rifleman1_Fleck","BWA3_OpsCore_Fleck","BWA3_G_Combat_Black","ItemMap","ItemCompass","ItemWatch","ItemGPS","UK3CB_BAF_HMNVS"};

    };
};
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
 };
class CfgRespawnInventory 
{
    class riflemanUSMC
    {
		displayName	=	"Rifleman (USMC)";
        role = "usmc";
		// Exported from Arsenal by Crewt
		uniformClass = "Gen3_Ranger";
		backpack = "";
		weapons[] = {"rhs_weap_m4a1_blockII","Binocular","Throw","Put"};
		magazines[] = {"SmokeShellBlue","HandGrenade","HandGrenade","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red","SmokeShellBlue","SmokeShellBlue"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_CableTie","ACE_CableTie"};
		linkedItems[] = {"rhsusf_spc_light","UK3CB_BAF_H_Beret_Mer","","ItemMap","ItemCompass","ItemWatch","ItemGPS","UK3CB_BAF_HMNVS"};

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
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
		displayName	=	"Rifleman Winter (BAF RM)";
        role = "baf";
		// Exported from Arsenal by mindbl4ster
		uniformClass = "UK3CB_BAF_U_Smock_Arctic";
		backpack = "UK3CB_BAF_B_Bergen_Arctic_Rifleman_B";
		weapons[] = {"Binocular","UK3CB_BAF_L119A1_FG"};
		magazines[] = {"UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd","rhs_mag_an_m8hc","rhs_mag_an_m8hc","rhs_mag_m18_red","rhs_mag_m18_red"};
		items[] = {"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_CableTie","ACE_CableTie","ACE_EarPlugs","ACE_Flashlight_MX991","ACE_IR_Strobe_Item","ACE_MapTools","ACE_morphine","ACE_morphine","ACE_morphine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_tourniquet","ACE_tourniquet"};
		linkedItems[] = {"UK3CB_BAF_V_PLCE_Webbing_Plate_Winter","UK3CB_BAF_H_Mk7_Win_A","rhs_ess_black","ItemMap","ItemCompass","ItemGPS"};
	};
};
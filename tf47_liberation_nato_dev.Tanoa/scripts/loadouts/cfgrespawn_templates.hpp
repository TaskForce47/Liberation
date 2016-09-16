class CfgRespawnInventory 
{
    class veryEmpty
    {
        displayName = "EMPTY"; // Name visible in the menu
    };
    class eastpilotheli
    {
        vehicle = "rhs_pilot_combat_heli";
    };
    class eastpilotcrew
    {
        vehicle = "rhs_pilot_transport_heli";
    };
    class eastpilotfixedwing
    {
        vehicle = "rhs_pilot";
    };
    class eastcrew
    {
        vehicle = "rhs_vdv_armoredcrew";
    };
    class eastsoldier
    {
        displayName = "Schuetze";
        role = "Rifleman";
        icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

        // Loadout definition, uses same entries as CfgVehicles classes
        weapons[] = {
            "rhs_weap_ak74m",
            "hgun_Pistol_01_F"
        };
        magazines[] = {
            "rhs_30Rnd_545x39_7N10_AK",
            "rhs_30Rnd_545x39_7N10_AK",
            "rhs_30Rnd_545x39_7N10_AK",
            "rhs_30Rnd_545x39_7N10_AK",
            "rhs_30Rnd_545x39_7N10_AK",
            "rhs_30Rnd_545x39_7N10_AK",
            "rhs_30Rnd_545x39_7N10_AK",
            "10Rnd_9x21_Mag",
            "10Rnd_9x21_Mag",
            "rhs_mag_rgn",
            "rhs_mag_rgn",
            "rhs_mag_rdg2_white",
            "rhs_mag_rdg2_white"
        };
        items[] = {
            "ACE_morphine",
            "ACE_morphine",
            "ACE_tourniquet",
            "ACE_tourniquet",
            "ACE_EarPlugs",
            "ACE_Flashlight_XL50",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage",
            "ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing",
            "ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage",
            "ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot"
        };
        linkedItems[] = {
            "rhs_acc_dtk",
            "rhs_acc_2dpZenit",
            "rhs_acc_ekp1",
            "ItemMap",
            "ItemCompass",
            "ItemWatch",
            "ItemRadio",
            "rhs_6b28"
        };
        uniformClass = "rhs_uniform_vdv_emr";
        // backpack = "B_AssaultPack_mcamo";
    };
    //________________________________________________________________________________________________________________//
    class eastSchuetzeAT
    {
        displayName = "Schuetze AT (rshg2)";
        icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
        role = "MissileSpecialist";
        // Loadout definition, uses same entries as CfgVehicles classes
        weapons[] = {
            "rhs_weap_ak74m",
            "rhs_weap_rshg2",
            "Binocular"
        };
        magazines[] = {
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_mag_9x18_8_57N181S",
            "rhs_mag_9x18_8_57N181S",
            "SmokeShellGreen",
            "SmokeShellGreen",
            "SmokeShell",
            "SmokeShell",
            "HandGrenade",
            "HandGrenade"
        };
        items[] = {
            "ACE_EarPlugs",
            "ACE_Flashlight_XL50",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_MapTools",
            "ACE_elasticBandage",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_tourniquet",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_morphine",
            "ACE_epinephrine"
        };
        linkedItems[] = {
            "rhs_6b23_6sh116_vog",
            "rhs_6b47_bala",
            "rhs_acc_2dpZenit",
            "rhs_acc_dtk3",
            "ItemMap",
            "ItemCompass",
            "ItemWatch",
            "ItemRadio",
            "G_Combat",
            "rhs_1PN138"
        };
        uniformClass = "rhs_uniform_vdv_emr";
        // backpack = "B_AssaultPack_mcamo";
    };
    //____________________________________________________________________________________________________________________________________________//
    class eastdesignated
    {
        displayName = "Marksman";
        icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa"; 
        role = "Marksman";
        // Loadout definition, uses same entries as CfgVehicles classes
        weapons[] = {
            "rhs_weap_svdp",
            "rhs_weap_makarov_pm",
            "ACE_Vector"
        };
        magazines[] = {
            "rhs_mag_rdg2_white",
            "rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N1",
        };
        items[] = {
            "ACE_EarPlugs",
            "ACE_Flashlight_XL50",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_MapTools",
            "ACE_elasticBandage",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_tourniquet",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_morphine",
            "ACE_MapTools",
            "ACE_microDAGR",
            "ACE_epinephrine"
        };
        linkedItems[] = {
            "rhs_acc_pso1m2",
            "rhs_6b23_digi_sniper",
            "rhs_fieldcap_helm_digi"
        };
        uniformClass = "rhs_uniform_vdv_emr";
        // backpack = "B_AssaultPack_mcamo";
    };
    //______________________________________________________________________________________________________________________________________________//
    class eastSchuetzeGL
    {
        vehicle = "rhs_vdv_grenadier";        
    };
    //________________________________________________________________________________________________________________________________________________//
    class eastMedic
    {
        displayName = "Medic"; 
        icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
        role = "CombatLifeSaver";
        weapons[] = {
            "rhs_weap_ak74m",
            "rhs_weap_makarov_pm",
            "Binocular"
        };

        magazines[] = {
            "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK",
            "rhs_mag_rgn","rhs_mag_rgn",
            "rhs_mag_rdg2_white","rhs_mag_rdg2_white","rhs_mag_rdg2_white","rhs_mag_rdg2_white","rhs_mag_rdg2_white",
        };

        items[] = {
            "ACE_EarPlugs",
            "ACE_Flashlight_XL50",
            "ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing",
            "ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage",
            "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", 
            "ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage",
            "ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine",
            "ACE_plasmaIV_250","ACE_plasmaIV_250","ACE_plasmaIV_250","ACE_plasmaIV_250","ACE_plasmaIV_250",
            "ACE_bloodIV_250","ACE_bloodIV_250","ACE_bloodIV_250","ACE_bloodIV_250","ACE_bloodIV_250"
        };

        linkedItems[] = {
            "rhs_acc_dtk",
            "rhs_6b23_digi_medic",
            "rhs_6b28",

        };
        uniformClass = "rhs_uniform_vdv_emr";
        backpack = "rhs_assault_umbts";
    };
    //________________________________________________________________________________________________________________________________________________//
    class eastsoldierMG
    {
        vehicle = "rhs_vdv_machinegunner";
    };
    //________________________________________________________________________________________________________________________________________________//
    class eastTeamlead
    {
        displayName = "Teamlead"; // Name visible in the menu
        icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
        role = "Rifleman";
        // Loadout definition, uses same entries as CfgVehicles classes
        weapons[] = {
            "rhs_weap_ak74m_fullplum_gp25_npz",
            "rhs_weap_makarov_pm",
            "ACE_Vector"
        };
        magazines[] = {
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_mag_9x18_8_57N181S",
            "rhs_mag_9x18_8_57N181S",
            "rhs_VG40TB",
            "rhs_VG40SZ",
            "rhs_VG40OP_white",
            "rhs_VG40OP_green",
            "rhs_VG40TB",
            "rhs_VG40SZ",
            "rhs_VG40OP_white",
            "rhs_VG40OP_green",
            "HandGrenade",
            "HandGrenade"
        };
        items[] = {
            "ACE_EarPlugs",
            "ACE_Flashlight_XL50",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_MapTools",
            "ACE_elasticBandage",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_tourniquet",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_morphine",
            "ACE_epinephrine"
        };
        linkedItems[] = {
            "rhs_6b13_EMR_6sh92_headset_mapcase",
            "rhs_6b47_bala",
            "rhs_acc_perst1ik",
            "rhs_acc_2dpZenit",
            "ItemMap",
            "ItemCompass",
            "ItemWatch",
            "ItemRadio",
            "G_Combat",
            "rhs_1PN138"
        };
        uniformClass = "rhs_uniform_vdv_emr";
    };
    //________________________________________________________________________________________________________________________________________________//
    class eastSchuetzeAA
    {
        vehicle = "rhs_vdv_aa";
    };
    //________________________________________________________________________________________________________________________________________________//
    class eastSchuetzeATTitan
    {
        vehicle = "rhs_vdv_RShG2";
    };
    
    //________________________________________________________________________________________________________________________________________________//
    class eastSniper
    {
        displayName = "Sniper"; // Name visible in the menu
        icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
        role = "Marksman";
        // Loadout definition, uses same entries as CfgVehicles classes
        weapons[] = {
            "srifle_LRR_F",
            "rhs_weap_makarov_pm",
            "ACE_Vector"
        };
        magazines[] = {
            "7Rnd_408_Mag",
            "7Rnd_408_Mag",
            "7Rnd_408_Mag",
            "7Rnd_408_Mag",
            "7Rnd_408_Mag",
            "rhs_mag_9x18_8_57N181S",
            "SmokeShellGreen",
            "SmokeShellRed",
            "SmokeShell",
            "HandGrenade",
            "HandGrenade"
        };
        items[] = {
            "ACE_EarPlugs",
            "ACE_Flashlight_XL50",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_MapTools",
            "ACE_elasticBandage",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_tourniquet",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_morphine",
            "ACE_epinephrine"
        };
        linkedItems[] = {
            "rhs_6b23_6sh116_vog",
            "rhs_6b47_bala",
            "ACE_optic_LRPS_2D",
            "rhs_acc_perst1ik",
            "rhs_acc_2dpZenit",
            "bipod_01_F_blk",
            "ItemMap",
            "ItemCompass",
            "ItemWatch",
            "ItemRadio",
            "G_Combat",
            "rhs_1PN138"
        };
        uniformClass = "U_B_T_FullGhillie_tna_F";
        backpack = "B_AssaultPack_khk";
    };
    //________________________________________________________________________________________________________________________________________________//
    class eastSpotter
    {
        displayName = "Spotter"; // Name visible in the menu
        icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
        role = "Marksman";
        // Loadout definition, uses same entries as CfgVehicles classes
        weapons[] = {
            "rhs_weap_vss_grip_npz",
            "rhs_weap_makarov_pm",
            "ACE_Vector"
        };
        magazines[] = {
            "rhs_10rnd_9x39mm_SP5",
            "rhs_10rnd_9x39mm_SP5",
            "rhs_10rnd_9x39mm_SP5",
            "rhs_10rnd_9x39mm_SP5",
            "rhs_10rnd_9x39mm_SP5",
            "rhs_10rnd_9x39mm_SP5",
            "rhs_10rnd_9x39mm_SP5",
            "7Rnd_408_Mag", "7Rnd_408_Mag", "7Rnd_408_Mag", "7Rnd_408_Mag",
            "SmokeShellGreen",
            "SmokeShellRed",
            "SmokeShell",
            "APERSTripMine_Wire_Mag",
            "APERSTripMine_Wire_Mag",
            "APERSTripMine_Wire_Mag",
            "HandGrenade",
            "HandGrenade"
        };
        items[] = {
            "ACE_EarPlugs",
            "ACE_Flashlight_XL50",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_MapTools",
            "ACE_elasticBandage",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_tourniquet",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_morphine",
            "ACE_epinephrine",
            "ACE_DefusalKit",
            "ACE_Kestrel4500",
            "ACE_RangeCard",
            "ACE_Tripod",
            "ACE_SpottingScope"
        };
        linkedItems[] = {
            "rhs_6b23_6sh116_vog",
            "rhs_6b47_bala",
            "rhs_acc_perst1ik_ris",
            "rhs_acc_rakursPM",
            "ItemMap",
            "ItemCompass",
            "ItemWatch",
            "ItemRadio",
            "G_Combat",
            "rhs_1PN138"
        };
        uniformClass = "U_B_T_FullGhillie_tna_F";
        backpack = "B_AssaultPack_khk";
    };
    //________________________________________________________________________________________________________________________________________________//
    class eastspezialist
    {
        displayName = "Spezialist"; // Name visible in the menu
        icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"; // Icon displayed next to the name
        role = "Rifleman";
        // Loadout definition, uses same entries as CfgVehicles classes
        weapons[] = {
            "rhs_weap_ak74m",
            "rhs_weap_makarov_pm",
            "ACE_Vector"
        };
        magazines[] = {
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_30Rnd_545x39_AK",
            "rhs_mag_9x18_8_57N181S", "rhs_mag_9x18_8_57N181S",
            "SmokeShellGreen",
            "SmokeShellRed",
            "SmokeShell",
            "SLAMDirectionalMine_Wire_Mag","SLAMDirectionalMine_Wire_Mag","SLAMDirectionalMine_Wire_Mag","SLAMDirectionalMine_Wire_Mag",
            "DemoCharge_Remote_Mag","DemoCharge_Remote_Mag",
            "SLAMDirectionalMine_Wire_Mag","SLAMDirectionalMine_Wire_Mag","SLAMDirectionalMine_Wire_Mag","SLAMDirectionalMine_Wire_Mag",
            "HandGrenade",
            "HandGrenade"
        };
        items[] = {
            "ACE_EarPlugs",
            "ACE_Flashlight_XL50",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_MapTools",
            "ACE_elasticBandage",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_tourniquet",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_morphine",
            "ACE_epinephrine",
            "ACE_DefusalKit"
        };
        linkedItems[] = {
            "rhs_6b23_6sh116_vog",
            "rhs_6b47_bala",
            "rhs_acc_2dpZenit",
            "ItemMap",
            "ItemCompass",
            "ItemWatch",
            "ItemRadio",
            "rhs_1PN138"
        };
        uniformClass = "U_B_T_FullGhillie_tna_F";
        backpack = "B_Kitbag_rgr";
    };
    class westDiver
    {
        vehicle = "B_T_Diver_F";
    };
};
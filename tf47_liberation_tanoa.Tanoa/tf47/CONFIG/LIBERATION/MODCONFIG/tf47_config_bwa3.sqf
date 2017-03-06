params [["_entryToGet",""]];

if( _entryToGet isEqualTo "")exitWith {[]};
if !(	isClass (configFile >> "cfgPatches" >> "BWA3_Flag"))exitWith{[]};

private _return = switch tolower _entryToGet do {
  case("lv"):{[]};
  case("hv"):{
		[
			["BWA3_Puma_Tropen",0,50,10],
			["BWA3_Puma_Fleck",0,50,10],
			["BWA3_Leopard2A6M_Tropen",0,100,20],
			["BWA3_Leopard2A6M_Fleck",0,100,20]
		]
	};
  case("av"):{
		[
			["BWA3_Tiger_RMK_PARS",0,200,25],
			["BWA3_Tiger_RMK_Universal",0,200,25],
			["BWA3_Tiger_RMK_FZ",0,200,25],
			["BWA3_Tiger_RMK_Heavy",0,300,25],
			["BWA3_Tiger_Gunpod_PARS",0,150,15],
			["BWA3_Tiger_Gunpod_FZ",0,150,15],
			["BWA3_Tiger_Gunpod_Heavy",0,200,15]
		]
	};
  case("sv"):{[]};
  case("st"):{[]};
  case("w"):{
		[
			"BWA3_G38",
			"BWA3_G38K",
			"BWA3_G38C",
			"BWA3_G38_AG",
			"BWA3_G38K_AG",
			"BWA3_G38_Tan",
			"BWA3_G38_AG_Tan",
			"BWA3_G38K_Tan",
			"BWA3_G38K_AG_Tan",
			"BWA3_G38C_Tan",
			"BWA3_G28_Standard",
			"BWA3_G28_Assault",
			"BWA3_G27",
			"BWA3_G27_Tan",
			"BWA3_G27_AG",
			"BWA3_G27_Tan_AG",
			"BWA3_MG4",
			"BWA3_MG5",
			"BWA3_MG5_Tan",
			"BWA3_G82",
			"BWA3_P8",
			"BWA3_MP7",
			"BWA3_Pzf3",
			"BWA3_RGW90",
			"BWA3_Fliegerfaust"
		]
	};
  case("m"):{[]};
  case("i"):{
		[
			"BWA3_optic_RSAS",
			"BWA3_optic_Aimpoint",
			"BWA3_optic_EOTech",
			"BWA3_optic_EOTech_tan",
			"BWA3_optic_EOTech_Mag_Off",
			"BWA3_optic_EOTech_Mag_On",
			"BWA3_optic_EOTech_tan_Mag_Off",
			"BWA3_optic_EOTech_tan_Mag_On",
			"BWA3_optic_NSV80",
			"BWA3_optic_ZO4x30",
			"BWA3_optic_ZO4x30_NSV",
			"BWA3_optic_ZO4x30_IRV",
			"BWA3_optic_Shortdot",
			"BWA3_optic_20x50",
			"BWA3_optic_20x50_NSV",
			"BWA3_optic_24x72",
			"BWA3_optic_24x72_NSV",
			"BWA3_optic_NSV600",
			"BWA3_optic_NSA80",
			"BWA3_acc_LLM01_irlaser",
			"BWA3_acc_LLM01_flash",
			"BWA3_acc_VarioRay_irlaser",
			"BWA3_acc_VarioRay_flash",
			"BWA3_muzzle_snds_G28",
			"BWA3_muzzle_snds_MG4",
			"BWA3_muzzle_snds_MG5",
			"BWA3_muzzle_snds_MP7",
			"BWA3_Uniform_idz_Fleck",
			"BWA3_Uniform2_idz_Fleck",
			"BWA3_Uniform3_idz_Fleck",
			"BWA3_Uniform_Ghillie_idz_Fleck",
			"BWA3_Uniform_Fleck",
			"BWA3_Uniform2_Fleck",
			"BWA3_Uniform_Ghillie_Fleck",
			"BWA3_Uniform_Crew_Fleck",
			"BWA3_Uniform_idz_Tropen",
			"BWA3_Uniform2_idz_Tropen",
			"BWA3_Uniform3_idz_Tropen",
			"BWA3_Uniform_Ghillie_idz_Tropen",
			"BWA3_Uniform_Tropen",
			"BWA3_Uniform2_Tropen",
			"BWA3_Uniform_Ghillie_Tropen",
			"BWA3_Uniform_Crew_Tropen",
			"BWA3_Uniform_Helipilot ",
			"BWA3_OpsCore_Fleck",
			"BWA3_OpsCore_Fleck_Patch",
			"BWA3_OpsCore_Fleck_Camera",
			"BWA3_CrewmanKSK_Fleck",
			"BWA3_CrewmanKSK_Fleck_Headset",
			"BWA3_MICH_Fleck",
			"BWA3_M92_Fleck",
			"BWA3_Booniehat_Fleck",
			"BWA3_OpsCore_Tropen",
			"BWA3_OpsCore_Tropen_Patch",
			"BWA3_OpsCore_Tropen_Camera",
			"BWA3_CrewmanKSK_Tropen",
			"BWA3_CrewmanKSK_Tropen_Headset",
			"BWA3_MICH_Tropen",
			"BWA3_M92_Tropen",
			"BWA3_Booniehat_Tropen",
			"BWA3_OpsCore_Schwarz",
			"BWA3_OpsCore_Schwarz_Camera",
			"BWA3_CrewmanKSK_Schwarz",
			"BWA3_CrewmanKSK_Schwarz_Headset",
			"BWA3_Knighthelm",
			"BWA3_Beret_PzGren",
			"BWA3_Beret_Pz",
			"BWA3_Beret_PzAufkl",
			"BWA3_Beret_Jaeger",
			"BWA3_Beret_Falli",
			"BWA3_Beret_HFlieger",
			"BWA3_Beret_Wach_Gruen",
			"BWA3_Beret_Wach_Blau",
			"BWA3_Vest_Fleck",
			"BWA3_Vest_Rifleman1_Fleck",
			"BWA3_Vest_Autorifleman_Fleck",
			"BWA3_Vest_Grenadier_Fleck",
			"BWA3_Vest_Medic_Fleck",
			"BWA3_Vest_Marksman_Fleck",
			"BWA3_Vest_Leader_Fleck",
			"BWA3_Vest_Tropen",
			"BWA3_Vest_Rifleman1_Tropen",
			"BWA3_Vest_Autorifleman_Tropen",
			"BWA3_Vest_Grenadier_Tropen",
			"BWA3_Vest_Medic_Tropen",
			"BWA3_Vest_Marksman_Tropen",
			"BWA3_Vest_Leader_Tropen",
			"BWA3_G_Combat_Orange",
			"BWA3_G_Combat_Black",
			"BWA3_G_Combat_Clear"
		]
	};
  case("b"):{
		[
			"BWA3_AssaultPack_Fleck",
			"BWA3_Kitbag_Fleck",
			"BWA3_Kitbag_Fleck_Medic",
			"BWA3_TacticalPack_Fleck",
			"BWA3_TacticalPack_Fleck_Medic",
			"BWA3_FieldPack_Fleck",
			"BWA3_Carryall_Fleck",
			"BWA3_PatrolPack_Fleck",
			"BWA3_AssaultPack_Tropen",
			"BWA3_Kitbag_Tropen",
			"BWA3_Kitbag_Tropen_Medic",
			"BWA3_TacticalPack_Tropen",
			"BWA3_TacticalPack_Tropen_Medic",
			"BWA3_FieldPack_Tropen",
			"BWA3_Carryall_Tropen",
			"BWA3_PatrolPack_Tropen"
		]
	};
  default{[]};
};
_return

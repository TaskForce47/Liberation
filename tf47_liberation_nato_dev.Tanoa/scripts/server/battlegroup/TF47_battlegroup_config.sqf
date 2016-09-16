params["_attackSize","_attackType"];

private _return = [];

switch(_attackType)do{

	case("mot"):{
	
		_return = switch(_attackSize)do{
		
			case("small"):{
			[
				"RHS_Ural_VDV_01",
				"RHS_Ural_VDV_01",
				"rhs_tigr_ffv_3camo_vdv",
				"rhs_tigr_ffv_3camo_vdv"
			]
			};
			case("medium"):{
			[
				"RHS_Ural_VDV_01",
				"RHS_Ural_VDV_01",
				"rhs_tigr_ffv_3camo_vdv",
				"rhs_tigr_ffv_3camo_vdv",
				"RHS_Ural_VDV_01",
				"RHS_Ural_VDV_01",
				"rhs_tigr_ffv_3camo_vdv",
				"rhs_tigr_ffv_3camo_vdv"
			]
			
			};
			case("mayhem"):{
			[
				"RHS_Ural_VDV_01",
				"RHS_Ural_VDV_01",
				"rhs_tigr_ffv_3camo_vdv",
				"rhs_tigr_ffv_3camo_vdv",
				"RHS_Ural_VDV_01",
				"RHS_Ural_VDV_01",
				"rhs_tigr_ffv_3camo_vdv",
				"rhs_tigr_ffv_3camo_vdv",
				"RHS_Ural_VDV_01",
				"RHS_Ural_VDV_01",
				"rhs_tigr_ffv_3camo_vdv",
				"rhs_tigr_ffv_3camo_vdv"
			]
			
			};
				
		};
	
	};

	case("mech"):{
	
		_return = switch(_attackSize)do{
		
			case("small"):{
				[
				"rhs_bmd4ma_vdv",
				"rhs_bmd4ma_vdv",
				"rhs_bmd4ma_vdv",
				"rhs_bmd4ma_vdv"
				]
			};
			case("medium"):{
				[
				"rhs_bmd4ma_vdv",
				"rhs_bmd4ma_vdv",
				"rhs_bmd2",
				"rhs_bmd2",
				"rhs_bmd4ma_vdv",
				"rhs_bmd4ma_vdv",
				"rhs_zsu234_aa",
				"rhs_zsu234_aa"
				]
			};
			case("mayhem"):{
				[
				"rhs_bmd4ma_vdv",
				"rhs_bmd4ma_vdv",
				"rhs_bmd2",
				"rhs_bmd2",
				"rhs_bmd4ma_vdv",
				"rhs_bmd4ma_vdv",
				"rhs_zsu234_aa",
				"rhs_zsu234_aa",
				"rhs_bmd2",
				"rhs_bmd2",
				"rhs_bmd4ma_vdv",
				"rhs_bmd4ma_vdv"
				]
			};
				
		};
	
	};
	
	case("air"):{
	
		_return = switch(_attackSize)do{
		
			case("small"):{
				[
					"RHS_Mi8MTV3_vdv",
					"RHS_Mi8MTV3_vdv",
					"RHS_Ka52_vvsc"
				]
			};
			case("medium"):{
				[
					"RHS_Mi24P_AT_vdv",
					"RHS_Mi24P_AT_vdv",
					"RHS_Mi8MTV3_vdv",
					"RHS_Mi8MTV3_vdv"
				]
			};
			case("mayhem"):{
				[
					"RHS_Ka52_vvsc",
					"RHS_Ka52_vvsc",
					"RHS_Mi8MTV3_vdv",
					"RHS_Mi8MTV3_vdv",
					"RHS_Mi24P_AT_vdv",
					"RHS_Mi24P_AT_vdv"
				]
			};
				
		};
	
	};
	
	case("arm"):{
	
		_return = switch(_attackSize)do{
		
			case("small"):{
			[
				"rhs_bmp2_vdv",
				"rhs_bmp2_vdv",
				"rhs_t80um",
				"rhs_t80um"
			]
			};
			case("medium"):{
			[
				"rhs_t90a_tv",
				"rhs_t90a_tv",
				"rhs_t72bd_tv",
				"rhs_t72bd_tv",
				"rhs_zsu234_aa",
				"rhs_zsu234_aa"
			]
			};
			case("mayhem"):{
			[
				"rhs_t90a_tv",
				"rhs_t90a_tv",
				"rhs_t72bd_tv",
				"rhs_t72bd_tv",
				"rhs_zsu234_aa",
				"rhs_zsu234_aa",
				"RHS_Ka52_vvsc",
				"RHS_Ka52_vvsc"
			]
			
			};
				
		};
	
	};
	
};

_return;

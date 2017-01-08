params["_attackSize","_attackType"];

private _return = [];

switch(_attackType)do{

	case("mot"):{
	
		_return = switch(_attackSize)do{
		
			case("small"):{
			[
				"rhsusf_m1025_w_m2",
				"rhsusf_m1025_w_m2",
				"rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy",
				"rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy"
			]
			};
			case("medium"):{
			[
				"rhsusf_m1025_w_m2",
				"rhsusf_m1025_w_m2",
				"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy",
				"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy",
				"rhsusf_m1025_w_m2",
				"rhsusf_m1025_w_m2",
				"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy",
				"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy"
			]
			
			};
			case("mayhem"):{
			[
				"rhsusf_m1025_w_m2",
				"rhsusf_m1025_w_m2",
				"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy",
				"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy",
				"rhsusf_m1025_w_m2",
				"rhsusf_m1025_w_m2",
				"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy",
				"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy",
				"rhsusf_m1025_w_m2",
				"rhsusf_m1025_w_m2",
				"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy",
				"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy"
			]
			
			};
				
		};
	
	};

	case("mech"):{
	
		_return = switch(_attackSize)do{
		
			case("small"):{
				[
				"RHS_M2A3_BUSKIII_wd",
				"RHS_M2A3_BUSKIII_wd",
				"RHS_M2A3_BUSKIII_wd",
				"RHS_M2A3_BUSKIII_wd"
				]
			};
			case("medium"):{
				[
				"RHS_M2A3_BUSKIII_wd",
				"RHS_M2A3_BUSKIII_wd",
				"rhsusf_m113_usarmy_M240",
				"rhsusf_m113_usarmy_M240",
				"RHS_M2A3_BUSKIII_wd",
				"RHS_M2A3_BUSKIII_wd",
				"RHS_M6",
				"RHS_M6"
				]
			};
			case("mayhem"):{
				[
				"RHS_M2A3_BUSKIII_wd",
				"RHS_M2A3_BUSKIII_wd",
				"rhsusf_m113_usarmy_M240",
				"rhsusf_m113_usarmy_M240",
				"RHS_M2A3_BUSKIII_wd",
				"RHS_M2A3_BUSKIII_wd",
				"RHS_M6",
				"RHS_M6",
				"rhsusf_m113_usarmy_M240",
				"rhsusf_m113_usarmy_M240",
				"RHS_M2A3_BUSKIII_wd",
				"RHS_M2A3_BUSKIII_wd"
				]
			};
				
		};
	
	};
	
	case("air"):{
	
		_return = switch(_attackSize)do{
		
			case("small"):{
				[
					"RHS_CH_47F",
					"RHS_CH_47F",
					"RHS_AH64D_wd"
				]
			};
			case("medium"):{
				[
					"RHS_AH1Z_wd",
					"RHS_AH1Z_wd",
					"rhsusf_CH53E_USMC",
					"rhsusf_CH53E_USMC"
				]
			};
			case("mayhem"):{
				[
					"RHS_AH1Z_wd",
					"RHS_AH1Z_wd",
					"rhsusf_CH53E_USMC",
					"rhsusf_CH53E_USMC",
					"RHS_UH1Y",
					"RHS_UH1Y"
				]
			};
				
		};
	
	};
	
	case("arm"):{
	
		_return = switch(_attackSize)do{
		
			case("small"):{
			[
				"RHS_M2A2",
				"RHS_M2A2",
				"rhsusf_m1a1aimwd_usarmy",
				"rhsusf_m1a1aimwd_usarmy"
			]
			};
			case("medium"):{
			[
				"rhsusf_m1a2sep1tuskiiwd_usarmy",
				"rhsusf_m1a2sep1tuskiiwd_usarmy",
				"rhsusf_m1a1aim_tuski_wd",
				"rhsusf_m1a1aim_tuski_wd",
				"RHS_M6_wd",
				"RHS_M6_wd"
			]
			};
			case("mayhem"):{
			[
				"rhsusf_m1a2sep1tuskiiwd_usarmy",
				"rhsusf_m1a2sep1tuskiiwd_usarmy",
				"rhsusf_m1a1aim_tuski_wd",
				"rhsusf_m1a1aim_tuski_wd",
				"RHS_M6_wd",
				"RHS_M6_wd",
				"RHS_AH64D_wd",
				"RHS_AH64D_wd"
			]
			
			};
				
		};
	
	};
	
};

_return;

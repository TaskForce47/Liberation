if(isNil "TF47_helper_paratrooperJumpInit")then{TF47_helper_paratrooperJumpInit=[];};
if(isNil "TF47_helper_paratrooperProcessList")then{TF47_helper_paratrooperProcessList=[];};
if(isNil "TF47_helper_paratrooperLanded")then{TF47_helper_paratrooperLanded=[];};

[
	{
		private _cacheToProcessInit	=	[];
		private _cacheLandingUnits	=	[];	
		private _cacheLandedUnits	=	[];
		
		_cacheToProcessInit = +TF47_helper_paratrooperJumpInit;
		TF47_helper_paratrooperJumpInit	=	[];
		{
			if(	((getPos _x) select 2) < 300)then{
			
				_x setVariable ["TF47_paratrooper_items", backpackitems _x];
				_x setVariable ["TF47_paratrooper_backpack",backpack _x];
				removeBackpackGlobal _x;
				TF47_helper_paratrooperProcessList pushBackUnique	_x;
				_x addbackpack "ACE_NonSteerableParachute";
				
			}else{ TF47_helper_paratrooperJumpInit	pushBackUnique	_x; };
			
		}forEach _cacheToProcessInit;
		
		_cacheLandingUnits	=	+TF47_helper_paratrooperProcessList;
		TF47_helper_paratrooperProcessList	=	[];
		
		{
			
			if(	((getPos _x) select 2) < 2)then{
			
				if(alive _x)then{
				
					private _unit	=	_x;
					_unit allowDamage false;
					removeBackpackGlobal _unit;
					_unit addbackpack  (_unit getVariable "TF47_paratrooper_backpack");
					{ _unit additemtobackpack _x}forEach (_unit getVariable "TF47_paratrooper_items");
					TF47_helper_paratrooperLanded	pushBackUnique	_unit;
					
				};
			
			}else{ TF47_helper_paratrooperProcessList pushBackUnique	_x; };
			
		}forEach _cacheLandingUnits;
		
		_cacheLandedUnits = +TF47_helper_paratrooperLanded;
		TF47_helper_paratrooperLanded	=	[];
		
		{
			
			if(	isTouchingGround _x)then{
			
				if(alive _x)then{	_x allowDamage true; _x linkItem "rhsusf_ANPVS_15";	};
			
			}else{	TF47_helper_paratrooperLanded pushBackUnique	_x; };
			
		}forEach	_cacheLandedUnits;
		
	},
	0.1,
	[]
] call CBA_fnc_addPerFrameHandler;

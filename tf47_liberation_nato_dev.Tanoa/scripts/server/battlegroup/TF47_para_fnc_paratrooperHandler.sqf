if(isNil "TF47_helper_paratrooperJumpInit")then{TF47_helper_paratrooperJumpInit=[];};
if(isNil "TF47_helper_paratrooperProcessCache")then{TF47_helper_paratrooperProcessCache=[];};
if(isNil "TF47_helper_paratrooperProcessList")then{TF47_helper_paratrooperProcessList=[];};

[
	{
		private _cacheToProcess	=	+TF47_helper_paratrooperJumpInit;
		TF47_helper_paratrooperJumpInit	=	[];
		{
			if(	((getPos _x) select 2) < 300)then{
			
				TF47_helper_paratrooperProcessCache pushBackUnique	_x;
				
			}else{
			
				TF47_helper_paratrooperJumpInit	pushBackUnique	_x;
			
			};
			
		}forEach _cacheToProcess;

		_cacheToProcess	=	+TF47_helper_paratrooperProcessCache;
		TF47_helper_paratrooperProcessCache	=	[];
		{

			_x setVariable ["TF47_paratrooper_items", backpackitems _x];
			_x setVariable ["TF47_paratrooper_backpack",backpack _x];
			removeBackpackGlobal _x;
			TF47_helper_paratrooperProcessList pushBackUnique	_x;
			_x addbackpack "ACE_NonSteerableParachute";
			
		}forEach _cacheToProcess;

		_cacheToProcess	=	+TF47_helper_paratrooperProcessList;
		TF47_helper_paratrooperProcessList	=	[];
		{
			
			if(	((getPos _x) select 2) < 2)then{
			
				if(alive _x)then{
				
					private _unit	=	_x;
					_unit allowDamage false;
					removeBackpackGlobal _unit;
					_unit addbackpack  (_unit getVariable "TF47_paratrooper_backpack");
					{ _unit additemtobackpack _x}forEach (_unit getVariable "TF47_paratrooper_items");
					_unit spawn {params ["_unit"]; sleep 2;	_unit allowDamage true; _unit linkItem "rhsusf_ANPVS_15";};
					
				};
			
			}else{
			
				TF47_helper_paratrooperProcessList pushBackUnique	_x;
				
			};
			
		}forEach _cacheToProcess;
	},
	0.1,
	[]
] call CBA_fnc_addPerFrameHandler;

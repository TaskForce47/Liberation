if(isNil "TF47_helper_paratrooperJumpInit")then{	TF47_helper_paratrooperJumpInit=[];	};

[
	{
		if(count TF47_helper_paratrooperJumpInit >	0)then{
			{
				private _unit	=	_x;
				if(	alive _unit)then{
				
					private _z	=	(getPos _unit)param [2,10000];
					if(	(_z < 200)	&& (_z > 2)	&& (	backpack _unit isEqualTo ""	)	)then{
						_unit addBackpackGlobal "B_Parachute";
					};
					if(	_z	<	2	)then{
						_unit allowDamage false; 
						removeBackpackGlobal _unit;
					};
					if(	isTouchingGround _unit)then{	
						_unit addbackpack  (_unit getVariable ["TF47_paratrooper_backpack",""]);
						{ _unit additemtobackpack _x}forEach (_unit getVariable ["TF47_paratrooper_items",[]]);	
						_unit allowDamage true; 
						TF47_helper_paratrooperJumpInit deleteAt (TF47_helper_paratrooperJumpInit find _unit);
					};
						
				}else{
					TF47_helper_paratrooperJumpInit deleteAt (TF47_helper_paratrooperJumpInit find _unit);
				};
			}forEach TF47_helper_paratrooperJumpInit;
		};
	},
	0.1,
	[]
] call CBA_fnc_addPerFrameHandler;

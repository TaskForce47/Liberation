player addEventHandler ["GetInMan",{
	params ["_unit","_pos","_veh","_turrent"];
	
	if(	( _veh getCargoIndex player ) < 0  && 
		isTouchingGround _veh && 
		!(_veh isKindOf "ParachuteBase")
	)then{	
		private _doeject = false;
		switch (true) do {
			case( _veh  isKindOf "Tank"):{
				if ( ! TF47_PERMISSION_ARMOUR ) then {
					_doeject = true;
					hint localize "STR_PERMISSION_NO_ARMOR";
				};
			};
			case( _veh  isKindOf "Helicopter"):{
				if ( ! TF47_PERMISSION_HELO) then {
					_doeject = true;
					hint localize "STR_PERMISSION_NO_AIR";
				};
			};
			case( _veh  isKindOf "Plane"):{
				if ( ! TF47_PERMISSION_PLANE ) then {
					_doeject = true;
					hint localize "STR_PERMISSION_NO_AIR";
				};
			};
		};

		if ( _doeject ) then {
			moveOut player;
			_doeject = false;
		};
		
	};
}];
player addEventHandler ["SeatSwitchedMan",{
	params ["_unit","","_veh"];
	
	if(	( _veh getCargoIndex player ) < 0  && 
		isTouchingGround _veh && 
		!(_veh isKindOf "ParachuteBase")
	)then{	
		private _doeject = false;
		switch (true) do {
			case( _veh  isKindOf "Tank"):{
				if ( ! TF47_PERMISSION_ARMOUR ) then {
					_doeject = true;
					hint localize "STR_PERMISSION_NO_ARMOR";
				};
			};
			case( _veh  isKindOf "Helicopter"):{
				if ( ! TF47_PERMISSION_HELO) then {
					_doeject = true;
					hint localize "STR_PERMISSION_NO_AIR";
				};
			};
			case( _veh  isKindOf "Plane"):{
				if ( ! TF47_PERMISSION_PLANE ) then {
					_doeject = true;
					hint localize "STR_PERMISSION_NO_AIR";
				};
			};
		};

		if ( _doeject ) then {
			moveOut player;
			_doeject = false;
		};
		
	};
}];
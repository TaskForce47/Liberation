params [ "_grp" ];
private [ "_grouptype", "_vehicletype", "_vehicle" ];

_grouptype = 'infantry';
_vehicletype = '';
_vehicle = '';
{
	private _vehicleX	=	vehicle _x;
	if ( (_vehicleX != _x) && (_vehicletype == '') ) then {
		if ( 
			(	(gunner _vehicleX ) == _x	) || 
			(	(driver  _vehicleX ) == _x	) || 
			(	(commander _vehicleX ) == _x	) 
		)then{
			_vehicletype = typeof _vehicleX;
			_vehicle = _vehicleX;
		};
	};
} foreach units _grp;

if ((_grouptype == 'infantry') && (_vehicletype != '')) then {
	switch(true) do {
		case(_vehicle isKindOf "TANK"):{
			_grouptype = 'heavy';
		};
		case(_vehicle isKindOf "CAR"):{
			if ( _vehicletype in uavs ) then {
				_grouptype = 'uav';
			} else {
				_grouptype = 'light';
			};
		};
		case(_vehicle isKindOf "AIR"):{
			if ( _vehicletype in uavs ) then {
				_grouptype = 'uav';
			};
			if (_vehicle isKindOf "Helicopter") then {
				_grouptype = 'Helicopter';
			};
			if (_vehicle isKindOf "Plane") then {
				_grouptype = 'Plane';
			};
		};
		case(_vehicle isKindOf "StaticWeapon"):{
			_grouptype = 'static';
		};
	};
};

_grouptype

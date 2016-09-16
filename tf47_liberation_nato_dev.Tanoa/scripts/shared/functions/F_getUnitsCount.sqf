params [ "_position", "_distance", "_side" ];
private [ "_infantrycount", "_countedvehicles", "_vehiclecrewcount" ];

_infantrycount = _side countSide (
	(_position nearEntities [ "Man", _distance]) select {
		(!(captive _x)) && 
		((getpos _x) select 2 < 300) && 
		(!(_x getVariable ["TF47_Missioncritical", false])) 
	}
);

_countedvehicles =  (_position nearEntities [["LandVehicle", "Helicopter", "Ship"], _distance]) select  {
	((getpos _x) select 2 < 351) && 
	(!(_x getVariable ["TF47_Missioncritical", false])) && 
	(count crew _x > 0) && 
	(!(_x isKindOf "Plane")) && 
	(!((typeOf _x) in uavs))
};

_vehiclecrewcount = 0;

{ _vehiclecrewcount = _vehiclecrewcount + (_side countSide (crew _x)) } foreach _countedvehicles;

(_infantrycount + _vehiclecrewcount)
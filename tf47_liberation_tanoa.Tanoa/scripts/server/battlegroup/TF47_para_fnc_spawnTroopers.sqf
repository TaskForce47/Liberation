// exampe: [_plane,1,10,WEST] spawn mib_fnc_dropSquad;
params [
	"_plane",
	"_grp",
	["_door",0]			//0: mid, 1:left, 2:right
];
private _sqComp	=	units _grp;
private _sqSize	=	(count _sqComp)-1;

for "_i" from 0 to _sqSize do {
	
	(getPos _plane) params ["_dx","_dy","_dz"];
	private _dir  =	getDir _plane;
	private _unit = _sqComp select _i;
	_unit allowDamage false;
	moveOut _unit;
	_unit setpos [
					_dx	- 10*sin(_dir) +((-1)^_door)* 10*sin( _dir + 90),
					_dy	- 10*cos(_dir) -((-1)^_door)* 10*cos(_dir + 90),
					_dz
				];
	
	
	sleep 0.25;
	
	_unit spawn {
		sleep 1;
		
		private _unit	=	_this;
		_unit allowDamage true;
				//_unit allowDamage false;
		private _items	=	backpackitems _unit;
		private _backpack	=	backpack _unit;
		removeBackpackGlobal _unit;
		//_unit addbackpack  "B_Parachute"; //<- ai dies
		_unit addbackpack "ACE_NonSteerableParachute";
		
		waituntil{ ((	(getPos _unit) select 2) <= 1.5) || !(alive _unit)	};
		
		if(alive _unit)then{
			_unit allowDamage false;
			removeBackpackGlobal _unit;
			_unit addbackpack  _backpack;
			{ _unit additemtobackpack _x}forEach _items;
			sleep 1;
			_unit allowDamage true;
		};
		
	};
	
};

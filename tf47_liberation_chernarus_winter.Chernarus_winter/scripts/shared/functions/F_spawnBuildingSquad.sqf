// diag_log format [ "Spawning building squad at %1", time ];

params [ "_infsquad", "_building_ai_max", "_buildingpositions", "_sectorpos", [ "_sector", "" ] ];
private [ "_squadtospawnnn", "_infsquad_classnames", "_usedposits", "_nextposit", "_remainingposits", "_grp", "_everythingspawned", "_nextunit", "_position_indexes", "_position_count", "_idxposit", "_groupunitscount" ];

_everythingspawned = [];

_infsquad_classnames = [];
if ( _infsquad == "militia" ) then {
	_infsquad_classnames = militia_squad;
} else {
	_infsquad_classnames = ([] call F_getAdaptiveSquadComp);
};

// diag_log format [ "Spawning building squad Checkpoint A at %1", time ];

if ( _building_ai_max > floor ((count _buildingpositions) * GRLIB_defended_buildingpos_part)) then { _building_ai_max = floor ((count _buildingpositions) * GRLIB_defended_buildingpos_part)};
_squadtospawnnn = [];
while { (count _squadtospawnnn) < _building_ai_max } do { _squadtospawnnn pushback ( selectRandom _infsquad_classnames); };

// diag_log format [ "Spawning building squad Checkpoint B at %1", time ];

// diag_log format [ "Spawning building squad Checkpoint C at %1", time ];
_side = TF47_helper_opposingFaction;
/*
if ((_squadtospawnnn select 0) in militia_squad) then {
	_side = independent;
} else {
	_side = TF47_helper_opposingFaction;	
};
*/
sleep 0.1;
private _odx = 0;
for "_i" from 0 to (round ((count _squadtospawnnn)/4)) do {
	_grp = createGroup _side;
	_newpos = _sectorpos getPos [20 +  random 170, random 360];
	for "_i" from 0 to 4 do {
		if (_odx < (count _squadtospawnnn)) then {
			_nextunit = _grp createUnit [ (_squadtospawnnn select _odx), _newpos, [], 0, "NONE" ];
			_nextunit linkItem "rhsusf_ANPVS_15";
			_everythingspawned pushback _nextunit;
			_odx = _odx +1;
		};
	};
	_newgroup = [TF47_helper_opposingFaction, _grp ] call TF47_helper_swapSide; sleep 0.1;
	{ [ _x, _sector ] spawn building_defence_ai; } foreach (units _newgroup);
};

_everythingspawned
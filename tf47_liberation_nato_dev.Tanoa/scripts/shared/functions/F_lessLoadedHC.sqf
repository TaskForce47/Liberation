private _less_loaded_HC = -1;

private _activeHCs = (entities "HeadlessClient_F") select {!local _x};
if (_activeHCs isEqualTo []) exitWith {_less_loaded_HC};

//create feedback arrays
private _hcClientIDs = _activeHCs apply {owner _x};		
private _hcsWithLoad = _hcClientIDs apply {[0, _x]};	

//quick search through all groups
{
	private _hcIndex = _hcClientIDs find groupOwner _x;
	if (_hcIndex != -1) then {
		private _loadArray = _hcsWithLoad select _hcIndex;
		_loadArray params ["_load", "_hcID"];
		_loadArray set [0,_load + count units _x];
		_hcsWithLoad set [_hcIndex, _loadArray];
	};

	false
} count allGroups;

_hcsWithLoad sort true;
_less_loaded_HC = ((_hcsWithLoad select 0) select 1);

_less_loaded_HC
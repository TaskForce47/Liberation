/*
	Autor:
		Crewt
	Description:
		Check if a Prisoners are near a FOB.
	Parameters:
		NONE
	Return:
		NONE
	Example:
		[]call TF47_CheckPrisoners;
*/

[
	{
		{
			{
				_unit = _x;
				_grp = createGroup TF47_helper_playerFaction;
				[_unit] joinSilent _grp;
				_unit disableAI "ANIM";
				_unit disableAI "MOVE";
				[ [ _unit, "AidlPsitMstpSnonWnonDnon_ground00" ], "remote_call_switchmove" ] call bis_fnc_mp;
				
				[
					{
						[ [(_this select 0)] , "prisonner_remote_call" ] call BIS_fnc_MP;
						deleteVehicle (_this select 0);
					}, 
					[_unit], 
					300
				] call CBA_fnc_waitAndExecute;


			} foreach ( (_x nearEntities ["Man", 30]) select { (_x getVariable ["ace_captives_ishandcuffed", false]) && ( !isPlayer _x)   }   );
			
			{	deleteVehicle _x 	} foreach (nearestObjects [_x ,["groundWeaponHolder"], 150]);

		} foreach GRLIB_all_fobs;
		{_x remoteExec ["deleteGroup", groupOwner _x]; } foreach (allGroups select {count units _x  == 0 });

	}, 
	360, 
	[]
] call CBA_fnc_addPerFrameHandler;
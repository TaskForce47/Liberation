/*
 * Author: mindbl4ster
 * use script to focus player efforts in conquering missionobjectives
 *
 * Arguments:
 * nothing
 *
 * Return Value:
 * nothing
 *
 * Example:
 *
 * Public: No
*/
private _sectorsToAttack = [];
private _fobs = GRLIB_all_fobs + [getMarkerPos "respawn_west"];
{
	private _distance = 10000;
	private _posMarker	=	getMarkerPos _x;
	{
		
	}forEach _fobs;
}forEach sectors_allSectors;
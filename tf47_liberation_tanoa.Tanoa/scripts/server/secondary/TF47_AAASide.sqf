TF47_side_AAAactive	=	true;

if (isNil "MyPlacesAA") then {
	MyPlacesAA = selectBestPlaces [[9981.85,9991.62,0], 10000, "((2 + 2* meadow) - (1 * forest - 0 * hills - houses))", 250, 30]; 
};
if (count MyPlacesAA == 0) then {
	MyPlacesAA = selectBestPlaces [[9981.85,9991.62,0], 10000, "((2 + 2* meadow) - (1 * forest - 0 * hills - houses))", 250, 30]; 
};
private _currdistance = 99999;
private _accdistance = 99999;
private _location = (selectRandom MyPlacesAA) select 0;
private _targetsec = selectRandom sectors_opfor;
{
	
	_normal = surfaceNormal (_x select 0);
	_accdistance = (_x select 0) distance (getMarkerPos _targetsec);
	if ( ((((_normal select 0) > -0.15) && ((_normal select 0) <  0.15)) && (((_normal select 0) > -0.15) && ((_normal select 0) <  0.15))) ) then {
		if ( ((((_normal select 1) > -0.15) && ((_normal select 1) <  0.15)) && (((_normal select 1) > -0.15) && ((_normal select 1) <  0.15))) ) then {
			if ( !([ 2000, (_x select 0) ] call F_getNearestSector in blufor_sectors) ) then {
				if (_accdistance < _currdistance) then {
					_currdistance = _accdistance;
					_location = _x;
				};
			};
		} else {
			MyPlacesAA deleteAt _forEachIndex;
		};
	} else {
		MyPlacesAA deleteAt _forEachIndex;
	};
} foreach MyPlacesAA;

MyPlacesAA deleteAt ( MyPlacesAA find _location );

private _havetobuild = selectRandom 
[
	[
		[ (selectRandom OpferAAArray) , [-0.37, 12.72, 0.02], 0.02 ],
		[ (selectRandom OpforStaticVehicles), [-8.21, -9.89, -0.03], 358.33 ],
		[ (selectRandom OpforStaticAAA), [2.61, -24.31, 3.23], 171.26 ],
		[ "Land_IRMaskingCover_02_F", [0.09, -0.08, 0], 267.45 ],
		[ "Land_BagFence_01_long_green_F", [0.6, -6.85, 0], 2.05 ],
		[ "Land_Cargo20_military_green_F", [-7.65, 0.13, 0], 273.8 ],
		[ "Land_Cargo20_military_green_F", [7.59, 1.64, 0], 91.52 ],
		[ "Land_HBarrier_01_line_5_green_F", [-9.23, 6.01, 0], 300.49 ],
		[ "Land_Trench_01_forest_F", [5.39, 10.51, 2.08], 181.9 ],
		[ "Land_HBarrier_01_line_5_green_F",[10.24, 5.7, 0], 50.55 ],
		[ "Land_Cargo20_military_green_F", [-12.02, -2.15, 0], 266.97 ],
		[ "Land_Trench_01_forest_F", [-6.36, 10.84, 1.84], 181.9 ],
		[ "Land_Cargo20_military_green_F", [12.4, -1.26, 0], 266.96 ],
		[ "Land_HBarrier_01_line_5_green_F", [-11.46, -8.24, 0], 266.83 ],
		[ "Land_Cargo_House_V4_F", [10.69, -10.76, 0],85.46 ],
		[ "Land_Trench_01_forest_F", [5.31, 14.23, 1.88], 0 ],
		[ "Land_Trench_01_forest_F", [-6.41, 14.55, 1.67], 0 ],
		[ "Land_TrenchFrame_01_F", [1.38, 16.58, 1.49], 0.28 ],
		[ "Land_TrenchFrame_01_F", [-2.53, 16.72, 1.5], 0.28 ],
		[ "Land_HBarrier_01_line_5_green_F", [-10.97, -14.08, 0],264.68 ],
		[ "Land_HBarrier_01_line_5_green_F", [-8.57, -17.46, 0], 175.88 ],
		[ "Land_Cargo_HQ_V4_F", [1.97, -20.63, 0], 87.28 ],
		[ "Land_HBarrier_01_line_5_green_F", [12.1, -16.8, 0], 263.29 ],
		[ "Land_HBarrier_01_line_5_green_F", [10.44, -20.5, 0], 176.3 ],
		[ (selectRandom OpforStaticAP), [-3.83, -18.01, 2.94], 302.36 ]
	],[
		[ (selectRandom OpforStaticAAA), [-14.01, 4.06, 0.01], 220.77 ],
		[ (selectRandom OpferAAArray), [-6.66, 16.53, 0.05], 306.36 ],
		[ (selectRandom OpferAAArray), [2.13, -19.01, 0.07], 126.68 ],
		[ "Land_Cargo_House_V4_F", [13.99, 2.45, 0], 305.09 ],
		[ "Land_HBarrier_01_big_4_green_F", [3.98, -15.06, 0], 37.68 ],
		[ "Land_HBarrier_01_big_4_green_F", [-8.72, 13.26, 0.01], 217.14 ],
		[ "Land_Cargo_House_V4_F", [-14.76, -7.6, 0], 125.15 ],
		[ "Land_HBarrier_01_big_4_green_F", [-3.75, 19.52, 0.02], 217.13 ],
		[ "Land_Cargo_House_V4_F", [18.25, 8.2, 0], 305.56 ],
		[ "Land_HBarrier_01_big_4_green_F", [-1.19, -21.22, 0.03], 37.25 ],
		[ "Land_HBarrier_01_big_4_green_F", [-10.26, 19.55, 0.01], 307.37 ],
		[ "Land_HBarrier_01_big_4_green_F", [5.42, -21.28, 0.01], 127.82 ],
		[ "Land_Cargo_House_V4_F", [-19.02, -13.35, 0], 125.62 ],
		[ "Land_Cargo_House_V4_F", [24.83, -5.5, 0], 125.62 ],
		[ "Land_BagBunker_01_large_green_F", [7.77, 25.2, 0.01], 217.8 ],
		[ "Land_Cargo_House_V4_F", [-27.11, 1.49, 0], 305.36 ],
		[ "Land_Cargo_House_V4_F", [27.34, 2.14, 0], 125.15 ],
		[ "Land_Cargo_Patrol_V1_F", [21.96, -18.9, 0], 304.78 ],
		[ "Land_Cargo_Patrol_V1_F", [-25.06, 15.12, 0], 124.25 ],
		[ "Land_HBarrier_01_line_1_green_F", [2.89, 27.96, 0], 304.46 ],
		[ "Land_HBarrier_01_line_1_green_F", [2.01, 28.53, 0], 304.47 ],
		[ "Land_Cargo_House_V4_F", [-29.05, -5.83, 0.07], 305.36 ],
		[ "Land_HBarrier_01_big_4_green_F", [22.76, 17.95, 0], 217.15 ],
		[ "Land_HBarrier_01_big_4_green_F", [26.49, 12.18, 0.04], 216.99 ],
		[ "Land_HBarrier_01_big_4_green_F", [29.47, -7.34, 0], 306.66 ],
		[ "Land_HBarrier_01_big_4_green_F", [-15.95, 26.03, 0], 125.94 ],
		[ "Land_HBarrier_01_big_4_green_F", [27.53, -13.34, 0.03], 306.39 ],
		[ "Land_HBarrier_01_big_4_green_F", [-21.82, 22.08, 0], 125.98 ],
		[ "Land_HBarrier_01_big_4_green_F", [-2.12, 31.17, 0.01], 217.08 ],
		[ "Land_HBarrier_01_big_4_green_F", [30.34, 6.48, 0.03], 217.12 ],
		[ "Land_HBarrier_01_big_4_green_F", [31.52, -0.75, 0], 306.62 ],
		[ "Land_HBarrier_01_big_4_green_F", [-10.35, 29.94, 0.04], 125.92 ],
		[ "Land_HBarrier_01_big_4_green_F", [18.59, -25.56, 0.01], 306.32 ],
		[ "Land_HBarrier_01_big_4_green_F", [-30.6, 9.77, 0.01], 126.05 ],
		[ "Land_HBarrier_01_wall_corridor_green_F", [-19.1, -25.94, 0], 305.93 ],
		[ "Land_HBarrier_01_big_4_green_F", [12.64, -29.52, 0.01], 306.47 ],
		[ "Land_HBarrier_01_big_4_green_F", [24.79, -20.8, 0.01], 306.62 ],
		[ "Land_HBarrier_01_big_4_green_F", [-13.54, -29.67, 0], 36.02 ],
		[ "Land_HBarrier_01_big_4_green_F", [-32.47, 3.61, 0], 126.09 ],
		[ "Land_HBarrier_01_big_4_green_F", [-27.89, 17.22, 0], 126.02 ],
		[ "Land_HBarrier_01_big_4_green_F", [-24.17, -21.94, 0], 36.2 ],
		[ "Land_HBarrier_01_big_4_green_F", [-6.79, -32.36, 0], 36.04 ],
		[ "Land_HBarrier_01_big_4_green_F", [-29.13, -15.79, 0.01], 36.16 ],
		[ "Land_HBarrier_01_big_4_green_F", [7.02, -33.39, 0], 306.53 ],
		[ "Land_HBarrier_01_big_4_green_F", [-0.29, -34.3, 0.01], 35.73 ],
		[ "Land_HBarrier_01_big_4_green_F", [-34.53, -3.01, 0], 126.07 ],
		[ "Land_HBarrier_01_big_4_green_F", [-33.06, -10.17, 0], 36.14 ],
		[ (selectRandom OpforStaticAP), [20.67, -19.92, 4.4], 125.18 ],
		[ (selectRandom OpforStaticAP), [-25.46, 13.94, 4.34], 305.56 ],
		[ (selectRandom OpforStaticAT), [20.09, 24.09, 0.03], 34.72 ]
	],
	[
		[ (selectRandom OpferAAArray), [7.07, 8.15, -0.05], 87.45 ],
		[ "CamoNet_ghex_open_F", [0.21, -0.74, 0], 0 ],
		[ (selectRandom OpferAAArray), [-12.8, -6.5, -0.05], 270.05 ],
		[ "Land_Cargo_House_V4_F", [4.7, -7.81, 0], 178.35 ],
		[ "Land_Cargo_House_V4_F", [-8.92, 7, 0], 0.31 ],
		[ "Land_HBarrier_01_line_5_green_F", [0.62, -12.35, 0], 0 ],
		[ "Land_HBarrier_01_line_5_green_F", [0.5, 12.6, 0], 0 ],
		[ "Land_Cargo_House_V4_F", [11.09, -7.9, 0], 178.35 ],
		[ "Land_HBarrier_01_line_5_green_F", [-5.37, -12.45, 0], 0 ],
		[ "Land_HBarrier_01_line_5_green_F", [-5.49, 12.5, 0], 0 ],
		[ "Land_HBarrier_01_line_5_green_F", [6.22, -12.42, 0], 0 ],
		[ "Land_HBarrier_01_line_5_green_F", [6.09, 12.53, 0], 0 ],
		[ "Land_HBarrier_01_line_5_green_F", [-11.08, -12.36, 0], 0 ],
		[ "Land_HBarrier_01_line_5_green_F", [-11.21, 12.59, 0], 0 ],
		[ "Land_HBarrier_01_line_5_green_F", [11.85, -12.28, 0], 0 ],
		[ "Land_HBarrier_01_line_5_green_F", [11.72, 12.67, 0], 0 ],
		[ "Land_Cargo_Patrol_V4_F", [-17.49, 7.77, 0], 88.87 ],
		[ "Land_HBarrier_01_line_5_green_F", [17.58, -5.32, 0], 136.15 ],
		[ "Land_HBarrier_01_line_5_green_F", [15.46, 10.59, 0], 269.34 ],
		[ "Land_HBarrier_01_line_5_green_F", [15.65, -10.46, 0], 269.34 ],
		[ "Land_HBarrier_01_line_5_green_F", [18.04, 5.86, 0], 31.48 ],
		[ "Land_HBarrier_01_line_5_green_F", [-16.55, -12.34, 0], 0 ],
		[ "Land_HBarrier_01_line_5_green_F", [-20.2, -4.82, 0], 269.34 ],
		[ "Land_HBarrier_01_wall_corridor_green_F", [-20.89, 0.02, 0], 0 ],
		[ "Land_HBarrier_01_line_5_green_F", [-16.68, 12.61, 0], 0 ],
		[ "Land_HBarrier_01_line_5_green_F", [-20.35, 5.15, 0], 269.34 ],
		[ "Land_HBarrier_01_line_5_green_F", [-20.15, -10.3, 0], 269.34 ],
		[ "Land_HBarrier_01_line_5_green_F", [-20.34, 10.75, 0], 269.34 ],
		[ (selectRandom OpforStaticAP), [-17.01, 6.61, 4.31], 267.75 ]
	],
	[
		[ (selectRandom OpferAAArray), [0.7, -7.52, -0.05], 180.54 ],
		[ (selectRandom OpferAAArray), [-0.32, 8.76, -0.05], 360 ],
		[ "rhsusf_m113_usarmy_supply", [-12.2, -2.93, 0.02], 272.25 ],
		[ "Land_Trench_01_grass_F", [-5.02, -7.93, 1.7], 269.44 ],
		[ "Land_Trench_01_grass_F", [5.36, 8.56, 1.7], 90.38 ],
		[ "Land_Trench_01_grass_F", [6.22, -8, 1.7], 87.28 ],
		[ "Land_Trench_01_grass_F", [-5.74, 9.01, 1.7], 268.76 ],
		[ "Land_BagFence_01_long_green_F", [-9.03, -7.54, 0], 359.68 ],
		[ "Land_Trench_01_grass_F", [-4.8, -12.02, 1.7], 179.15 ],
		[ "Land_Cargo_Patrol_V4_F", [14.49, 1.48, 0], 272.36 ],
		[ "Land_Trench_01_grass_F", [6.38, -12.16, 1.7], 179.15 ],
		[ "Land_TrenchFrame_01_F", [-7.39, -12.09, 1.56], 268.98 ],
		[ "Land_BagFence_01_long_green_F", [-11.64, 8, 0], 311.74 ],
		[ "Land_TrenchFrame_01_F", [-0.77, -14.34, 1.56], 179.15 ],
		[ "Land_TrenchFrame_01_F", [2.6, -14.34, 1.56], 179.15 ],
		[ "Land_Trench_01_grass_F", [5.3, 13.21, 1.7], 0 ],
		[ "Land_BagFence_01_long_green_F", [-13.74, 5.74, 0], 312.58 ],
		[ "Land_TrenchFrame_01_F", [8.72, -12.12, 1.56], 90.55 ],
		[ "Land_Trench_01_grass_F", [-5.88, 13.51, 1.7], 0 ],
		[ "Land_BagFence_01_long_green_F", [14.42, -4.3, 0], 312.58 ],
		[ "Land_TrenchFrame_01_F", [7.84, 13.31, 1.56], 92.22 ],
		[ "Land_TrenchFrame_01_F", [1.3, 15.59, 1.56], 0 ],
		[ "Land_TrenchFrame_01_F", [-2.07, 15.64, 1.56], 0 ],
		[ "Land_TrenchFrame_01_F", [-8.37, 13.51, 1.56], 271.35 ],
		[ "Land_BagBunker_01_small_green_F", [-16.46, 1.57, 0], 91.72 ],
		[ "Land_BagFence_01_long_green_F", [-15.78, -2.71, 0], 89.41 ],
		[ "Land_BagFence_01_long_green_F", [14.53, 7.37, 0], 45.37 ],
		[ "Land_BagFence_01_long_green_F", [16.52, -2.03, 0], 311.74 ],
		[ "Land_BagFence_01_long_green_F", [16.66, 5.19, 0], 45.37 ],
		[ "Land_BagFence_01_long_green_F", [17.63, 1.52, 0], 90.89 ],
		[ (selectRandom OpforStaticAP), [-14.09, 1.77, -0.01], 269.78 ]
	],
	[
		[ (selectRandom OpferAAArray), [-15.92, 2.69, 0.09], 270.28 ],
		[ "Land_HBarrier_01_line_5_green_F", [-8.65, 2.98, 0], 91.65 ],
		[ "Land_BagFence_01_long_green_F", [-0.09, -12.01, 0], 271.14 ],
		[ "Land_Cargo_HQ_V4_F", [11.43, -6.2, 0], 0 ],
		[ "Land_BagFence_01_long_green_F", [-0.09, -15.14, 0], 271.14 ],
		[ "Land_Cargo_House_V4_F", [16.83, 4.06, 0], 91.87 ],
		[ "Land_BagFence_01_long_green_F", [-0.18, -18.24, 0], 271.14 ],
		[ "Land_Cargo_House_V4_F", [16.9, 10.86, 0.13], 91.87 ],
		[ "Land_Cargo_House_V4_F", [-15.69, -12.94, 0], 270.08 ],
		[ "Land_BagFence_01_long_green_F", [-0.16, -21.31, 0], 271.14 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.33, 3.03, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.5, -2.8, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.54, -2.97, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.72, 2.85, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.28, 8.8, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-11.28, 20.26, 0], 88.49 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.53, -8.59, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.52, -8.77, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.77, 8.62, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-11.82, -20.4, 0], 88.12 ],
		[ "Land_HBarrier_01_line_5_green_F", [12.19, 20.28, 0], 272.08 ],
		[ "Land_HBarrier_01_line_5_green_F", [2.35, -23.77, 0], 181.01 ],
		[ "Land_Cargo_Patrol_V4_F", [-17.39, 19.06, 0], 92.51 ],
		[ "Land_HBarrier_01_line_5_green_F", [-7.62, 23.83, 0], 0.02 ],
		[ "Land_HBarrier_01_line_5_green_F", [7.96, -23.87, 0], 181.01 ],
		[ "Land_Cargo_Patrol_V4_F", [-16.02, -20.88, 0], 0.39 ],
		[ "Land_HBarrier_01_line_5_green_F", [8.15, 24.11, 0], 0.02 ],
		[ "Land_Cargo_Patrol_V4_F", [16.84, 20.41, 0], 180.38 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.16, 14.69, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.55, -14.32, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.5, -14.5, 0], 90 ],
		[ "Land_Cargo_Patrol_V4_F", [18.09, -19.79, 0], 272.51 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.89, 14.51, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-13.39, 23.88, 0], 0.02 ],
		[ "Land_HBarrier_01_line_5_green_F", [13.73, -24.02, 0], 181.01 ],
		[ "Land_HBarrier_01_line_5_green_F", [-14.01, -24, 0], 181.01 ],
		[ "Land_HBarrier_01_line_5_green_F", [13.88, 24.09, 0], 0.02 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.13, 20.48, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.43, -20.35, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-21.62, -20.17, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [21.92, 20.3, 0], 90 ],
		[ "Land_HBarrier_01_line_5_green_F", [-19.28, 24, 0], 0.02 ],
		[ "Land_HBarrier_01_line_5_green_F", [-19.86, -23.82, 0], 181.01 ],
		[ "Land_HBarrier_01_line_5_green_F", [19.73, 24.01, 0], 0.02 ],
		[ "Land_HBarrier_01_line_5_green_F", [19.61, -24.25, 0], 181.01 ],
		[ (selectRandom OpforStaticAP), [-16.99, 17.71, 4.31], 271.42 ],
		[ (selectRandom OpforStaticAP), [15.74, 19.92, 4.31], 3.57 ],
		[ (selectRandom OpforStaticAP), [-15.51, -20.75, 4.31], 178.43 ],
		[ (selectRandom OpforStaticAP), [17.71, -19.14, 4.31], 96.03 ]
	],
	[
		[ (selectRandom OpforStaticAAA), [-17.69, -17.11, 0], 0 ],
		[ (selectRandom OpforStaticAAA), [-17.01, 18.66, 0], 90.35 ],
		[ (selectRandom OpforStaticAAA), [18.75, -17.73, 0], 269.69 ],
		[ (selectRandom OpforStaticAAA), [18.62, 18.72, 0], 179.76 ],
		[ "CamoNet_ghex_F", [-0.16, -6.29, 0], 180.52 ],
		[ "CamoNet_ghex_F", [0.17, 6.94, 0], 0 ],
		[ "Box_NATO_AmmoVeh_F", [-0.06, 6.03, 0.03], 0 ],
		[ "Box_NATO_AmmoVeh_F", [1.7, 6.13, 0.03], 360 ],
		[ "Box_NATO_AmmoVeh_F", [3.82, 6.27, 0.03], 360 ],
		[ "Land_BagBunker_01_small_green_F", [-13.65, 0.02, 0], 91.1 ],
		[ "Land_BagBunker_01_small_green_F", [1.1, -13.97, 0], 0.31 ],
		[ "Land_BagBunker_01_small_green_F", [0.81, 14.45, 0], 180.54 ],
		[ "Land_BagBunker_01_small_green_F", [15, -0.14, 0], 268.83 ],
		[ "Land_Pod_Heli_Transport_04_ammo_F", [13.55, 5.6, 0], 2.01 ],
		[ "Land_BagFence_01_long_green_F", [-14.66, -2.49, 0], 89.26 ],
		[ "Land_BagFence_01_long_green_F", [-2.11, -14.89, 0], 179.55 ],
		[ "Land_BagFence_01_long_green_F", [-14.7, 3.67, 0], 89.26 ],
		[ "Land_BagFence_01_long_green_F", [4.04, -14.88, 0], 179.55 ],
		[ "Land_BagFence_01_long_green_F", [-14.63, -5.55, 0], 89.26 ],
		[ "Land_BagFence_01_long_green_F", [-5.17, -14.9, 0], 179.55 ],
		[ "Land_BagFence_01_long_green_F", [-14.62, 6.63, 0], 89.26 ],
		[ "Land_BagFence_01_long_green_F", [-2.35, 15.98, 0], 179.96 ],
		[ "Land_BagFence_01_long_green_F", [3.8, 15.96, 0], 179.96 ],
		[ "Land_BagFence_01_long_green_F", [16.19, 3.21, 0], 89.26 ],
		[ "Land_BagFence_01_long_green_F", [16.24, -2.95, 0], 89.26 ],
		[ "Land_BagFence_01_long_green_F", [7, -14.98, 0], 179.55 ],
		[ "Land_BagFence_01_long_green_F", [-5.41, 16, 0], 179.96 ],
		[ "Land_BagFence_01_long_green_F", [6.77, 15.84, 0], 179.96 ],
		[ "Land_BagFence_01_long_green_F", [16.26, -6.01, 0], 89.26 ],
		[ "Land_BagFence_01_long_green_F", [16.27, 6.17, 0], 89.26 ],
		[ "Land_BagFence_01_round_green_F", [-20.67, -17.13, 0], 87.95 ],
		[ "Land_BagFence_01_round_green_F", [-17.82, -20.2, 0], 0 ],
		[ "Land_BagFence_01_round_green_F", [-20.18, 18.73, 0], 90.35 ],
		[ "Land_BagFence_01_round_green_F", [-17.56, 21.58, 0], 178.3 ],
		[ "Land_BagFence_01_round_green_F", [18.79, -20.71, 0], 357.63 ],
		[ "Land_BagFence_01_round_green_F", [21.84, -17.85, 0], 269.69 ],
		[ "Land_BagFence_01_round_green_F", [21.6, 18.77, 0], 267.7 ],
		[ "Land_BagFence_01_round_green_F", [18.74, 21.82, 0], 179.76 ],
		[ (selectRandom OpforStaticAP), [0.94, 13.16, -0.01], 2.12 ],
		[ (selectRandom OpforStaticAP), [13.74, -0.32, -0.01], 94.55 ],
		[ (selectRandom OpforStaticAP), [-12.27, 0.22, -0.01], 269.68 ],
		[ (selectRandom OpforStaticAP), [0.91, -12.77, -0.01], 180.33 ]
	]
];


private _roadarr = [];
private _unitarr = [];
private _didbuild = [];
private _locpos = _location select 0;
_defensegroup1 =  createGroup TF47_helper_opposingFaction;
{
	private _type = (_x select 0);
	private _pos = (_x select 1);
	private _endpos = [	
		((_locpos select 0) + (_pos select 0)), 
		((_locpos select 1) + (_pos select 1)), 
		((_pos select 2) + 0.1)
	];
	
	private _building = createVehicle [ _type, _endpos getPos [200, 0] , [], 0, "NONE"];
	_building allowDamage false;
	_didbuild pushback _building;
	_building setDir (_x select 2);
	_building setPos _endpos;
	_building setVectorUp (surfaceNormal (position _building));
	
	if ((_building emptyPositions "Commander") != 0) then {
		_building lock 3;
		private _commander = _defensegroup1 createUnit [ (selectRandom OpforCrew), _endpos, [], 0, "NONE"];
		_commander allowDamage false;
		_commander assignAsCommander _building;
		_commander moveinCommander _building;
		_unitarr pushback _commander;
	};
	if ((_building emptyPositions "GUNNER") != 0) then {
		private _gunner = _defensegroup1 createUnit [ (selectRandom OpforCrew), _endpos, [], 0, "NONE"];
		_gunner allowDamage false;
		_gunner assignAsGunner _building;
		_gunner moveinGunner _building;
		_unitarr pushback _gunner;
		_building setVehicleAmmo 1;
	}  else {
	    if ( isOnRoad (getpos _building)) then {
	        deletevehicle _building; 
	        private _road = roadAt _endpos;
	        if (!(_road in _roadarr)) then {
		        private _barr = "RoadBarrier_F" createVehicle (getPos _road);
		        _roadarr pushBackUnique _road;
		        _barr setDir (getDir _road) + 70;
	        };
	    };
	};
	_building setDamage 0;
	_building allowDamage true;
} foreach _havetobuild;

private _description = format ["The opposing Force has build up a AAA side at %1. Do not enter the Area with any Aircraft", mapGridPosition _locpos];

private _index = TF47_Missionarray pushback [ (_location select 0), { }, "Destroy AAA Side", _description, "", "res\secondary\destroy_aaa.jpg"];
publicVariable "TF47_Missionarray";
//___________________________________________ Notification ___________________________________________//

["TF47_TaskAssigned", [("Destroy AAA Side")]] remoteExec ["BIS_fnc_showNotification", TF47_helper_playerFaction, false];

//___________________________________________ Notification ___________________________________________//


for "_i" from 0 to (round random 3) do {
	_next_box = createVehicle [ ammobox_o_typename, [((_locpos select 0) - ((random 20) + (random 40))) , ((_locpos select 1) - ((random 20) + (random 40))), 0], [], 0, "NONE"]; 
	_next_box enableRopeAttach true;
	[ [_next_box, 200 ] , "F_setMass" ] call BIS_fnc_MP;
};

{ _x setDamage 0; _x allowDamage true; } foreach _didbuild;
{ _x setDamage 0; _x allowDamage true; } foreach _unitarr;
private _patrol = 1;
private _garnison = 6;

if ( ({alive _x} count (units _defensegroup1) != 0) ) then {
	for "_i" from 1 to _patrol do {
		private _group = createGroup TF47_helper_opposingFaction;
		for "_o" from 1 to 4 do {
			_unit = _group createUnit [ (selectRandom [opfor_sentry, opfor_rifleman, opfor_grenadier, opfor_squad_leader, opfor_team_leader, opfor_marksman, opfor_machinegunner, opfor_heavygunner, opfor_medic, opfor_rpg, opfor_at, opfor_aa,opfor_aa,opfor_aa,opfor_aa, opfor_sharpshooter]), _locpos, [], 1, "NONE"];
			_didbuild pushback _unit;
			_unitarr pushback _unit;
		};
		[_group, (getPos (leader _group)), (100 + (random 300)), 7, "MOVE", "SAFE", "RED", "LIMITED", "STAG COLUMN", "this spawn CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
	};
	_buildingpositions = [];

	{

		_Arr =  _x buildingpos -1;
		if (count _Arr > 0) then {
			_buildingpositions pushback _x;
		};
			
	} foreach _didbuild;

	for "_i" from 1 to _garnison do {
		private _group = createGroup TF47_helper_opposingFaction;
		_unit = _group createUnit [ (selectRandom [opfor_sentry, opfor_rifleman, opfor_grenadier, opfor_marksman, opfor_machinegunner, opfor_heavygunner, opfor_rpg, opfor_rpg, opfor_at, opfor_aa,  opfor_engineer]), _locpos, [], 1, "NONE"];
		_didbuild pushback _unit;
		if (count _buildingpositions > 0 ) then {
			_rndbuildingpos = (selectRandom _buildingpositions);
			_buildingpositions deleteAt (_buildingpositions find _rndbuildingpos);
			_unit setDir (random 360);
			_wphold1 = _group addWaypoint [(leader _group), 0];
			_wphold1 setWaypointType "HOLD";
			_unitarr pushback _unit;
		} else {
			_wphold1 = _group addWaypoint [(leader _group), 0];
			_wphold1 setWaypointType "LOITER";
			_unitarr pushback _unit;
		};
	};
};

WaitUntil { sleep 10;  ( { alive _x } count (units _defensegroup1)) == 0 };
["TF47_TaskSucceeded", [("Destroy AAA Side")]] remoteExec ["BIS_fnc_showNotification", TF47_helper_playerFaction, false];
TF47_Missionarray deleteAT _index;
publicVariable "TF47_Missionarray";
combat_readiness = (combat_readiness - (5 + (round 5)));
publicVariableServer "combat_readiness";
sleep 1;
trigger_server_save = true;
sleep 3;

Waituntil { sleep 10; [ _locpos ] call F_sectorOwnership != TF47_helper_playerFaction };
{
	deleteVehicle _x;
} foreach _didbuild;

TF47_side_AAAactive	=	false;
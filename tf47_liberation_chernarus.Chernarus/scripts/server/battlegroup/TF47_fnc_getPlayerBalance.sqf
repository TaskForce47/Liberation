/*
	
	author: mindbl4ster
	
	description:
		stupid shit of missionmaker forgot to adjust armor and air weight
		
	parameter:
			
	return:
				
	notes:
	
	example:
	
*/
infantry_weight = 33 ;
armor_weight = 33 ;
air_weight = 33 ;

{
	private _veh	=	vehicle _x;
	if(_veh != _x)then{
	
		{
		
			if(typeOf _veh	==	(_x select 0)	)then{armor_weight	=	50};
		
		}forEach heavy_vehicles_extension;
		
		{
		
			if(typeOf _veh	==	(_x select 0)	)then{air_weight	=	50};
		
		}forEach air_vehicles_extension;

	};

}FOREACH allUnits;

infantry_weight	=	100 - armor_weight	-	air_weight;

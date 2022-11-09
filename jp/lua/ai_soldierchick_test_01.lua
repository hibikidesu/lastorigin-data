



function Process()
    
	
	if CreatureAI.ISCharacterInBattle("Char_PECS_Sunny_N") == 1 then
	
				
		CreatureAI.SetTarget("skill_slot_2", "HPHighest")
		
		
	
	else
	
		
		CreatureAI.SetTarget("skill_slot_1", "HPHighest")
			
	end
	
end 


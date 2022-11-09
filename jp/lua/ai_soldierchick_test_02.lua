



function Process()
    
	
	if CreatureAI.ISCharacterInBattle("MOB_MP_NightChickSpCH_B0208") == 1 then
	
				
		CreatureAI.SetTarget("skill_slot_2", "APHighest")
		
		
	
	else
	
		
		CreatureAI.SetTarget("skill_slot_1", "APHighest")
			
	end
	
end 



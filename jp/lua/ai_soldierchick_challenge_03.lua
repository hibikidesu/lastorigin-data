



function Process()
    
	Now_Position = 0
	pos = CreatureAI.GetGridPos()
	
	
	if CreatureAI.IsApplyBuff("Effect_MP_EmperorChickSpCH_N_5") == 1 then
	
		count = CreatureAI.GetTargetCount("skill_slot_2")
		
		if count > 0 then
		
		CreatureAI.SetTarget("skill_slot_2", "DefenseHighest")
		
		else
		
		CreatureAI.SetTarget("skill_slot_1", "DefenseHighest")
		
		end
	
	
	
	else
			
	
	    if 0 == pos or 1 == pos or 2 == pos then
	
	    	Now_Position = 1
		
		end
	
		if 6 == pos or 7 == pos or 8 == pos then
	
			Now_Position = 2
			
		end
    	
		if Now_Position == 1 then
				
			pos = pos + 3
			CreatureAI.Move(pos)
					
		end
				
		if Now_Position == 2 then
				
			pos = pos - 3
			CreatureAI.Move(pos)
				
		end
		
		if Now_Position == 0 then
				
			pos = pos - 3
			CreatureAI.Move(pos)
				
		end
															
	end
	
end 






function Process()
    
	
	if CreatureAI.IsApplyBuff("Effect_MP_EmperorChickSpCH_N_5") == 1 then
	
		count = CreatureAI.GetTargetCount("skill_slot_2")
		
		if count > 0 then
		
		CreatureAI.SetTarget("skill_slot_2", "random")
		
		else
		
		CreatureAI.SetTarget("skill_slot_1", "random")
		
		end
	
	
	
	else
	
		pos = CreatureAI.GetGridPos()
	
	    if 0 == pos or 1 == pos then
	
	    pos = pos + 1
	    CreatureAI.Move(pos)
		end
	
	    if 2 == pos or 5 == pos then
	
	    pos = pos + 3
	    CreatureAI.Move(pos)
		end
    
	
	    if  7 == pos or 8 == pos then
	
	    pos = pos - 1
	    CreatureAI.Move(pos)
		end
    
	
		if  3 == pos or 6 == pos then
	
	    pos = pos - 3
	    CreatureAI.Move(pos)
		end
		
			
	end
	
end 


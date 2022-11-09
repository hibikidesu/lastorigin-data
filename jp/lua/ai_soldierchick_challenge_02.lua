



function Process()
    
	
	pos = CreatureAI.GetGridPos()
	
	
	if CreatureAI.IsApplyBuff("Effect_MP_EmperorChickSpCH_N_5") == 1 then
	
		count = CreatureAI.GetTargetCount("skill_slot_2")
		
		if count > 0 then
		
		CreatureAI.SetTarget("skill_slot_2", "DefenseHighest")
		
		else
		
		CreatureAI.SetTarget("skill_slot_1", "DefenseHighest")
		
		end
	
	
	
	else
				
	    CreatureAI.Wait()	
		
	end
	
end 


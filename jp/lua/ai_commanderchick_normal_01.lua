



function Process()
    
	count = CreatureAI.GetTargetCount("skill_slot_1")
	count2 = CreatureAI.GetTargetCount("skill_slot_2")
	pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
	
	if CreatureAI.IsApplyBuff("Effect_MP_EmperorChickSpCH_N_33") == 1 and  count2 > 0 then
	
	
	CreatureAI.SetTarget_ActorClass("skill_slot_2", 0)
	
	else
	
		if count > 0 then
		
		CreatureAI.SetTarget_ActorClass("skill_slot_1", 1)
				
		else
		
			if -1 == pos then 
				
				CreatureAI.Wait()
				
			else
				
				CreatureAI.Move(pos)
			
			end
			
		end
		
	end
	
end 



	
	
function Process()
	
		if CreatureAI.IsApplyBuff("Effect_MP_EmperorChickSpCH_Challenge2_33") == 1 then
	
	
		CreatureAI.SetTarget_ActorClass("skill_slot_2", 0)
	
		else
	
		count = CreatureAI.GetTargetCount("skill_slot_1")
		
			if count > 0 then
		
			CreatureAI.SetTarget_ActorClass("skill_slot_1", 1)
				
			else
		
			CreatureAI.Wait()
		
			end
		
		end	
end 


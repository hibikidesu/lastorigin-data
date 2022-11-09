
function Process()
	
	pos = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
	pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
	count = CreatureAI.GetTargetCount("skill_slot_2")
	count2 = CreatureAI.GetTargetCount("skill_slot_1")
	
	
	-- 스피드업 상황에서 30%확률로 2스 사용
	if CreatureAI.IsApplyBuff("Effect_MP_LightningBomber_N_3") == 1 and 70 <= CreatureAI.GetRandomValue(100) then
	
		if 	count > 0 then	
					
		CreatureAI.SetTarget_Near("skill_slot_2")
		
		else
		
			if -1 == pos then 
				
			CreatureAI.Wait()
				
			else
				
			CreatureAI.Move(pos)
				
			end
		
        end
		
	else
		
		if count2 > 0 then
			
		CreatureAI.SetTarget("skill_slot_1","AtkHighest")
			
		else
			
			if -1 == pos2 then 
				
			CreatureAI.Wait()
				
			else
				
			CreatureAI.Move(pos2)
				
			end
											
		end
			
	end
		
end			
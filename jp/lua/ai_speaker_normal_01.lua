
function Process()
	
	pos = CreatureAI.GetGridPos()
		
		-- 20% 확률로 이동 아닐경우 공격
	if  70 <= CreatureAI.GetRandomValue(100) and CreatureAI.IsApplyBuff("Effect_MP_Speaker_N_32") == 0 then
				    
  		if 4 == pos then

		pos = pos + 1
			
		CreatureAI.Move(pos)
	
		else
					
			if 1 == pos % 2 then
		
			pos = ( pos * 2 + 1 ) % 10
	
			CreatureAI.Move(pos)			
			
			else
			
			pos = ( pos * 2 + 6 ) % 10
			
			CreatureAI.Move(pos)
			
			end
			
		end
			
	else
						
		count = CreatureAI.GetTargetCount("skill_slot_2")
		count2 = CreatureAI.GetTargetCount("skill_slot_1")
			
		if CreatureAI.IsApplyBuff("Effect_MP_Speaker_N_32") == 1 and count > 0 then			
			
			CreatureAI.SetTarget_Near("skill_slot_2")
			
		else
		
			if count2 > 0 then
			
			CreatureAI.SetTarget("skill_slot_1", "backend")
			
			else
			
				pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_1")
			
				if -1 == pos2 then 
				
				CreatureAI.Wait()
				
				else
				
				CreatureAI.Move(pos2)
				
				end
											
			end
			
	    end
		
	end	
			
end			
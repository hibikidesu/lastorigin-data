


function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")



    -- 추적 회로 손상 상태일 때 80% 확률로 2스 사용
	if CreatureAI.IsApplyBuff("Effect_MP_RobertCore_N_42") == 1 then
			
		if 20 <= CreatureAI.GetRandomValue(100) then
			
		CreatureAI.SetTarget("skill_slot_2", "self")
		
		else
		
		SubProcess()
		
		end
				
	else
       
		if 20 <= CreatureAI.GetRandomValue(100) then
			
		SubProcess()
		
		else
		
		CreatureAI.SetTarget("skill_slot_2", "self")
		
		end
	   
	end 

		
end 


-- 1스 사용
function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget("skill_slot_1","random")
		
	else
								
		CreatureAI.Wait()
						
    end
end


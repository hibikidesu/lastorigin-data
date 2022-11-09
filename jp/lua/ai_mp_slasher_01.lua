


function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")



    -- 추적 회로 손상 상태일 때 80% 확률로 2스 사용
	if CreatureAI.IsApplyBuff("Effect_MP_Slasher_N_43") == 1 then
						
		SubProcess2()
								
	else
       
		if CreatureAI.IsApplyBuff("Effect_MP_Slasher_N_31") == 1 or CreatureAI.IsApplyBuff("Effect_MP_Slasher_N_32") == 1 or CreatureAI.IsApplyBuff("Effect_MP_Slasher_N_33") == 1 then
			
			if 80 <= CreatureAI.GetRandomValue(100) then
			
			SubProcess2()
			
			else
			
			SubProcess()
			
			end
			
		else
					
		SubProcess()
			
		
		end
	   
	end 

		
end 


-- 1스 사용
function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget("skill_slot_1","HPHighest")
		
	else
								
		CreatureAI.Wait()
						
    end
end

-- 2스 사용
function SubProcess2()

	if 	count2 > 0 then	
					
		CreatureAI.SetTarget("skill_slot_2", "DefenseHighest")
		
	else
								
		SubProcess()
						
    end
	
end


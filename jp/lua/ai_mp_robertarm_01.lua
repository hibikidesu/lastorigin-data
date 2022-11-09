


function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

    -- 체력이 50% 이상일 경우 1스만 사용
    if  50 <= CreatureAI.GetHPPer() then
					
        SubProcess()
				
    else
       
		-- 체력이 50% 이하에서 30% 확률로 2스 사용
		if 70 <= CreatureAI.GetRandomValue(100) then
		
			SubProcess2()
			
		else
			
			SubProcess()			
					
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

-- 2스 사용
function SubProcess2()

	if 	count2 > 0 then	
					
		CreatureAI.SetTarget("skill_slot_2","random")
		
	else
								
		CreatureAI.Wait()
							
    end
	
end


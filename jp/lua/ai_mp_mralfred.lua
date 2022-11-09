


function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")



    if CreatureAI.GetReserveSkillCount() > 0 then 
        return 
    end 
	
	-- 대기
	if 	count > 0 then	
		
							
		CreatureAI.Wait()
						
    end

		
end 

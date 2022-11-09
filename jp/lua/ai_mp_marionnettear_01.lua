function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")


		-- 1스 사거리 확인
	if  count > 0 then
		
		-- 1스 무작위 타겟
		CreatureAI.SetTarget("skill_slot_1","random")

    else
		
		-- 2스 사거리 확인
		if count2 > 0 then
		
		-- 2스 공격력 가장 높은
		CreatureAI.SetTarget("skill_slot_2","AtkHighest")
		
		else
		
		-- 그 외에는 대기
		CreatureAI.Wait()	
		
		end
	   
    end 
	
end 
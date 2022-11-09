function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")


		-- 2스 버프 확인
	if  CreatureAI.IsApplyBuff("Effect_MP_Intruder_N_2") == 0 then
		
		-- 2스 자신에게 사용
		CreatureAI.SetTarget("skill_slot_2", "self")

    else
		
		-- 사거리 확인
		if count > 0 then
		
		-- 1스 랜덤 타격 (아마 도발 따라가지 않을까)
		CreatureAI.SetTarget("skill_slot_1","random")
		
		else
		
		-- 그 외에는 대기
		CreatureAI.Wait()	
		
		end
	   
    end 
	
end 
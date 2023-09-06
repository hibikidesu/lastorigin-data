function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

		-- 1스 스택 확인
	if  CreatureAI.GetApplyBuffCount("Effect_MP_Demolisher_BOSS_TU_11") == 1 then
		
		-- 2스 HP 가장 낮은 대상 타격
		CreatureAI.SetTarget("skill_slot_2","HPLow")

    else
			-- 사거리 내 공격력 가장 높은 대상 타격
		if  count > 0 then	
			
			CreatureAI.SetTarget("skill_slot_1","AtkHighest")
			
		else
			-- 사거리 안닿으면 2스
			CreatureAI.SetTarget("skill_slot_2","HPLow")
			
		end	   
	   
    end 
	
end 
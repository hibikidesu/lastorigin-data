function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")


		-- 2스 적용 여부 확인
    if	CreatureAI.IsApplyBuff("Effect_MP_UnderWatcherGenerator_EW2_2") == 1 then
	
		-- 2스 걸렸으면 1스 사용
		CreatureAI.SetTarget("skill_slot_1", "self")
	
    else

		-- 2스 안걸린 루틴
		SubProcess() 
	   
    end 
	
end 

-- 2스 안걸린 루틴
function SubProcess()

		-- 1라운드인지 확인
	if 	CreatureAI.GetRoundCount() == 1 then	
	
		-- 1라운드라면 1스 사용
		CreatureAI.SetTarget("skill_slot_1", "self")
		
	else
	
		-- 아니면 2스 사용
		CreatureAI.SetTarget("skill_slot_2", "self")
		
    end
	
end
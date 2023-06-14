function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")
round = CreatureAI.GetRoundCount()

		-- 1스 준비 확인
	if  CreatureAI.IsApplyBuff("Effect_MP_JangHwa_TU2_21") == 1 then
		
		-- 1스 사용
		SubProcess()

    else
	
		-- 2스 사용
		SubProcess2()
	   
    end 
	
end 

function SubProcess() 

		-- 사거리 체크
	if	count > 0 then
	
		-- 후방 대상 타겟
		CreatureAI.SetTarget_ActorClass("skill_slot_1", 0)
	
	else
		
		-- 안닿으면 대기
		CreatureAI.Wait()
		
	end

end

function SubProcess2() 

		-- 사거리 체크
	if	count2 > 0 then

		-- 후방 대상 타겟
		CreatureAI.SetTarget_ActorClass("skill_slot_2", 0)	
		
    else
		
		-- 안닿으면 대기
		CreatureAI.Wait()
	   
    end 

end
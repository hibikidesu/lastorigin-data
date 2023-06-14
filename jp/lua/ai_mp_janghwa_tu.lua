function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")
round = CreatureAI.GetRoundCount()

		-- 홀짝 라운드 확인
	if  1 == round % 2 then
		
		-- 홀수면 1스 사용
		SubProcess()

    else
	
		-- 짝수면 2스 사용
		SubProcess2()
	   
    end 
	
end 

function SubProcess() 

		-- 사거리 체크
	if	count > 0 then
	
		-- 후방 대상 타겟
		CreatureAI.SetTarget("skill_slot_1","backend")
	
	else
		
		-- 안닿으면 대기
		CreatureAI.Wait()
		
	end

end

function SubProcess2() 

		-- 사거리 체크
	if	count2 > 0 then

		-- 후방 대상 타겟
		CreatureAI.SetTarget("skill_slot_2","backend")		
		
    else
		
		-- 안닿으면 대기
		CreatureAI.Wait()
	   
    end 

end
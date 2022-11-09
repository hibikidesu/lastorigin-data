function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

        -- 자신이 전방인지 확인
		pos4 = CreatureAI.GetGridPos()
	if  pos4 == 0 or pos4 == 3 or pos4 == 6 then
		
		-- 전방이면 2스 루틴
		SubProcess2()

    else
        -- 그외에는 1스 루틴
	    SubProcess()
	   
    end 
end 

-- 1스 사용
function SubProcess()

		-- 사거리 내 적 무작위 타격
	if  count > 0 then	
				
		CreatureAI.SetTarget("skill_slot_1", "random")
				
	else
		-- 그 외에는 대기	
		CreatureAI.Wait()
				
	end
	
end

-- 2스 사용
function SubProcess2() 

		-- 사거리 내 적 무작위 타격
	if  count2 > 0 then	
				
		CreatureAI.SetTarget("skill_slot_2", "random")
		
    else
       -- 아니면 1스 사용
	   SubProcess()
	   
    end 
	
end 
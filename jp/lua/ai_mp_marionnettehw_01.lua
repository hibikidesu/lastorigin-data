function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")


		-- 2스 디버프 확인
	if  CreatureAI.IsApplyBuffTarget("Effect_MP_MarionnetteHW_N_2") == 1 then
	
		-- 1스 루틴
		SubProcess2()		
	
    else
		
		-- 2스 루틴
		SubProcess()
	   
    end 
	
end 

-- 2스 사용
function SubProcess()

		-- 2스 사거리 확인
	if 	count2 == 0 then
	
		-- 사거리 안닿으면 1스 루틴
		SubProcess2()
		
	else
	
		-- 2스 방어력 가장 높은
		CreatureAI.SetTarget("skill_slot_2","DefenseHighest")
		
    end 		
	
end


-- 1스 사용
function SubProcess2() 

		-- 1스 사거리 확인
	if  count == 0 then
		
		-- 1스 안닿으면 대기
		CreatureAI.Wait()
		
    else
		
		-- 경장형 체크
        if CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 0) == 1 then         
            return 	
		
		-- 그 외에는 무작위 가까운 대상
        elseif CreatureAI.SetTarget_Near("skill_slot_1") == 1 then 
            return 
			
        end 	
	   
    end 
	
end 
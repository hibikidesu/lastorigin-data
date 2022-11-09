function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")


		-- 패2 적용 확인
    if	CreatureAI.IsApplyBuffTarget("Effect_MP_UnderWatcherSensor_EW2_4") == 1 then	
	
		-- 패2 적용 된 루틴
        SubProcess()
	
    else

	   -- 패2 적용 안 된 루틴
        SubProcess2()
	   
    end 
	
end 


-- 패2 적용 된 루틴
function SubProcess() 

		-- 2스 사거리 확인
	if  count2 == 0 then
		
		-- 2스 안닿으면 대기
		CreatureAI.Wait()
		
    else
		-- 적 캐릭터가 두명 이상 배치된 행중 가장 가까운 열의 대상을 선정
		
		-- 지원기 체크
        if CreatureAI.SetTarget_ActorClassAndRowInCnt_By_Near("skill_slot_2", 2, 2) == 1 then         
            return 
		
		-- 공격기 체크
        elseif CreatureAI.SetTarget_ActorClassAndRowInCnt_By_Near("skill_slot_2", 1, 2) == 1 then 
            return 
		
		-- 그 외에는 무작위 가까운 대상
        elseif CreatureAI.SetTarget_Near("skill_slot_2") == 1 then 
            return 
        end 	
	   
    end 
	
end 


	-- 패2 적용 안 된 루틴
function SubProcess2()

		-- 1스 사거리 확인
	if  count > 0 then
		
		-- 회피가 가장 높은 대상 타겟
		CreatureAI.SetTarget("skill_slot_1","EvadeHighest")
		
	else
		-- 안닿으면 대기
		CreatureAI.Wait()
		
    end
	
end
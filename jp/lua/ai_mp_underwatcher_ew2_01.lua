function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")


		-- 패2 최대 출력 적용 여부 확인
    if	CreatureAI.IsApplyBuff("Effect_MP_UnderWatcher_EW2_4") == 1 then	
	
		-- 최대 출력 상태 루틴
		SubProcess()
	
    else
		-- 최대 출력이 아닌 상태 루틴
		SubProcess2()
	   
    end 
	
end 

-- 최대 출력 상태 루틴
function SubProcess()

		-- 2스 사거리 확인
	if  count2 == 0 then
		
		-- 2스 안닿으면 대기
		CreatureAI.Wait()
		
    else
	
		-- 센서 2스킬 표식 확인
        if CreatureAI.SetTarget_ApplyBuff("skill_slot_2", "Effect_MP_UnderWatcherSensor_EW2_2") == 1 then        
            return 
		
		-- 센서 1스킬 표식 확인
        elseif CreatureAI.SetTarget_ApplyBuff("skill_slot_2", "Effect_MP_UnderWatcherSensor_EW2_1") == 1 then       
            return 
		
		-- 그 외에는 무작위 가까운 대상
        elseif CreatureAI.SetTarget_Near("skill_slot_2") == 1 then 
            return 
			
        end 	
	   
    end 	
	
end


-- 최대 출력이 아닌 상태 루틴
function SubProcess2() 

		-- 1스 사거리 확인
	if  count1 == 0 then
		
		-- 1스 안닿으면 2스 사용 루트로
		SubProcess()
		
    else		
	
		-- 센서 2스킬 표식 확인
        if CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_UnderWatcherSensor_EW2_2") == 1 then        
            return 
		
		-- 센서 1스킬 표식 확인
        elseif CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_UnderWatcherSensor_EW2_1") == 1 then       
            return 
		
		-- 그 외에는 무작위 가까운 대상
        elseif CreatureAI.SetTarget_Near("skill_slot_1") == 1 then 
            return 
			
        end 	
	   
    end 
	
end 
	

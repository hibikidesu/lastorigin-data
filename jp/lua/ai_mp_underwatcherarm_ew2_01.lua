function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")


		-- 언더왓쳐 센서 연계 : 표식 확인
    if	CreatureAI.IsApplyBuffTarget("Effect_MP_UnderWatcherSensor_EW2_1") == 1 or CreatureAI.IsApplyBuffTarget("Effect_MP_UnderWatcherSensor_EW2_2") == 1 then	
		
		-- 표식 확인 된 루틴
        SubProcess()
	
    else

	   -- 표식 확인 안 된 루틴
        SubProcess2()
	   
    end 
	
end 

	
-- 표식 확인 된 루틴
function SubProcess() 

		-- 1스 사거리 확인
	if  count2 == 0 then
		
		-- 1스 안닿으면 대기
		CreatureAI.Wait()
		
    else
	
		-- 1스 표식 우선 타겟
        if CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_UnderWatcherSensor_EW2_1") == 1 then
            return 
		
		-- 2스 표식 우선 타겟
        elseif CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_UnderWatcherSensor_EW2_2") == 1 then
            return 
		
		-- 그 외에는 방어력이 가장 높은 대상
        elseif CreatureAI.SetTarget("skill_slot_1","DefenseHighest") == 1 then 
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
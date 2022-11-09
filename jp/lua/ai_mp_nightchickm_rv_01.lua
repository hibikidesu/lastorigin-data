function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")


		-- 패3 자신 도발 상태 확인
	if  CreatureAI.IsApplyBuff("Effect_MP_NightChickM_RV_5") == 1 then
		
		-- 2스 랜덤 타격 (아마 도발 따라가지 않을까)
		CreatureAI.SetTarget("skill_slot_2","random")

    else
        -- 1스 루틴
	    SubProcess()
	   
    end 
end 

-- 1스 루틴
function SubProcess()

		-- 1스 사거리 확인
	if 	count < 1 then	
	
		-- 사거리 안닿으면 닿는 곳으로 이동
		CreatureAI.Move(pos)
		
	else
	
		-- 패1 가짜 표식 우선 타겟
        if CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_NightChickM_RV_31") == 1 then
            return 
		
		-- 패1 가짜 표식 2 우선 타겟
        elseif CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_NightChickM_RV_32") == 1 then
            return 
			
		-- 패1 진짜 표식 우선 타겟
        elseif CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_NightChickM_RV_3") == 1 then
            return 			
		
		-- 그 외에는 회피가 가장 높은 대상
        elseif CreatureAI.SetTarget("skill_slot_1","EvadeHighest") == 1 then 
            return 
			
        end 
		
    end
	
end
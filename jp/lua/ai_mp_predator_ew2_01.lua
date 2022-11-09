function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")


		-- 1스 사거리 확인
	if  count == 0 then
		
		-- 1스 사거리 안닿는 루틴
		SubProcess2()

    else
        -- 1스 사거리 닿는 루틴
	    SubProcess()
	   
    end 
end 

-- 1스 사거리 닿는 루틴
function SubProcess()

		-- 2스 디버프 체크
	if 	CreatureAI.IsApplyBuffTarget("Effect_MP_Predator_EW2_2") == 1 then	
	
		-- 2스 디버프 걸린 적 우선 타격
		CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_Predator_EW2_2")
		
	else
	
			-- 25% 확률로 2스 사용
		if  CreatureAI.GetRandomValue(100) > 75 then
		
			CreatureAI.SetTarget("skill_slot_2", "random")		
		
		else
		
			-- 사거리 내 무작위 1스 사용
			CreatureAI.SetTarget("skill_slot_1", "random")
		
		end
		
    end
	
end

-- 1스 사거리 안닿는 루틴
function SubProcess2() 

		-- 2스 사거리 확인
	if  count2 == 0 then
		
		-- 2스도 안닿으면 사거리 닿는 곳으로 이동
		CreatureAI.Move(pos2)
		
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
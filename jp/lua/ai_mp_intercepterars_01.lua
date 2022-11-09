function Process() 

        -- 자신이 전방인지 확인
		pos = CreatureAI.GetGridPos()
	if  pos == 0 or pos == 3 or pos == 6 then
		
		-- 전방이면 2스 루틴
		SubProcess2()

    else
        -- 그외에는 1스 루틴
	    SubProcess()
	   
    end 
end 

-- 1스 사용
function SubProcess()

		-- 패1 표식 버프 체크
	if 	CreatureAI.IsApplyBuffTarget("Effect_MP_IntercepterARS_N_3") == 1 then	
	
		-- 패1 표식 버프 걸린 적 우선 타격
		CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_IntercepterARS_N_3")
		
	else
	
			-- 사거리 내 적 무작위 타격
		if  CreatureAI.GetTargetCount("skill_slot_1") > 0 then	
				
			CreatureAI.SetTarget("skill_slot_1", "random")
				
		else
			-- 그 외에는 대기	
			CreatureAI.Wait()
				
		end
		
    end
	
end

-- 2스 사용
function SubProcess2() 

        -- 아군이 살아 있을 때 자신에게 2스 버프가 없으면 50% 확률로 2스 자신에게 사용		
    if	CreatureAI.IsLiveOurTeam() == 1 and CreatureAI.IsApplyBuff("Effect_MP_IntercepterARS_N_2") == 0 and CreatureAI.GetRandomValue(100) > 50 then
		
        CreatureAI.SetTarget("skill_slot_2", "self")
		
    else
       -- 이후 1스 사용
	   SubProcess()
	   
    end 
end 
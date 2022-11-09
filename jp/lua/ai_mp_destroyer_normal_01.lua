



function Process() 

    -- 버프 이펙트 없는 상태면 이 버프 
    if CreatureAI.IsApplyBuff("Effect_MP_Destroyer_N_2") == 0 and CreatureAI.IsApplyBuff("Effect_MP_Destroyer_N_15") == 0 then
        
		CreatureAI.SetTarget("skill_slot_2", "self")
    else
	
        -- 스킬의 사정거리에 적이 있는지 확인
		count = CreatureAI.GetTargetCount("skill_slot_1")
		
		if count == 0 then 
		
			-- 대기 
            pos = CreatureAI.MoveToUseSkillPos("skill_slot_1") -- 스킬사용이 가능한 위치를 가져옴
			
			if -1 == pos then 
			
				CreatureAI.Wait()-- 이동 불가할 경우 대기한다. 
				
			else 
			
				CreatureAI.Move(pos)-- 이동 한다. 
				
			end 
			
		else 
		
			CreatureAI.SetTarget_Near("skill_slot_1")
			
		end 
		
    end 
	
end 
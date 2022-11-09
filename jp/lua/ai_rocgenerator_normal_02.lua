



function Process() 

    -- 자신의 HP가 25% 이하 + 방어막 상태가 아니면 자신에게 방어막 사용 
    if CreatureAI.GetHPPer() <= 50 and CreatureAI.IsApplyBuff("Effect_MP_RocCGenerator_N_2") ~= 1 then
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
				CreatureAI.Wait()-- 이동 한다. 
			end 
		else 
			CreatureAI.SetTarget("skill_slot_1", "self")
		end 
    end 
end 
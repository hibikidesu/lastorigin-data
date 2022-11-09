



function Process() 

    -- 자신의 HP가 10% 이하 
    if CreatureAI.GetHPPer() <= 10  then
        CreatureAI.SetTarget("skill_slot_2", "random")
    else
        -- 스킬의 사정거리에 대상이 있는지 확인
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count == 0 then 
			-- 대기 
            pos = CreatureAI.MoveToUseSkillPos("skill_slot_1") -- 스킬사용이 가능한 위치를 가져옴
			if -1 == pos then 
				CreatureAI.Wait()-- 이동 불가할 경우 대기한다. 
			else 
				CreatureAI.Wait()-- 대기 한다. 
			end 
		else 
			CreatureAI.SetTarget("skill_slot_1", "random")
		end 
    end 
end 
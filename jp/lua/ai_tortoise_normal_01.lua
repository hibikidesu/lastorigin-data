



function Process()

	-- 자신이 전열에 위치한 경우 스킬1 위주 사용
	pos = CreatureAI.GetGridPos()
	if 0 == pos % 3  then
	
		-- 스킬1 사정 거리에 적이 존재하면 스킬1 사용
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
		
			-- 랜덤 대상에게 스킬1 사용
			CreatureAI.SetTarget("skill_slot_1", "random")
		else
		
			-- 스킬1 사정 거리에 적이 존재하지 않으면 스킬2 사용
			CreatureAI.SetTarget("skill_slot_2", "self")
		end
		
	-- 자신이 전열이 아닌 경우 스킬2 사용 (스킬1 사거리가 1이나, 수치가 변경될 때를 대비해서 스킬1 사용도 설정)
	else
	
		-- 자신이 스킬2 버프를 보유하고 있는 경우 스킬1 사용 가능 여부 파악
		if 1 == CreatureAI.IsApplyBuff("Effect_MP_Tortoise_N_2") then
			count = CreatureAI.GetTargetCount("skill_slot_1")
			if count > 0 then
			
				-- 랜덤 대상에게 스킬1 사용
				CreatureAI.SetTarget("skill_slot_1", "random")
			else
				CreatureAI.Wait()
			end
			
		-- 자신이 스킬2 버프를 보유하고 있지 않은 경우 자신에게 스킬2 사용
		else
			CreatureAI.SetTarget("skill_slot_2", "self")
		end
	end
end 
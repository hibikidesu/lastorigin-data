



function Process()

	-- 아군이 살아있는 경우, 자신에게 버프가 걸려있으면 스킬1을 사용하고, 아닌 경우 스킬2 사용
	if 1 == CreatureAI.IsApplyBuff("Effect_MP_SpectorBS_N_13") then
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
			-- 가장 먼 열의 대상에게 스킬1 사용
			CreatureAI.SetTarget("skill_slot_1", "backend")
		else
			CreatureAI.SetTarget("skill_slot_2", "self")
		end
	else
		CreatureAI.SetTarget("skill_slot_2", "self")
	end
end 
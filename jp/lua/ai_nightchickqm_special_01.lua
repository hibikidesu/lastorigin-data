



function Process()

	-- 아군이 살아있는 경우, 자신에게 버프가 걸려있으면 스킬1을 사용하고, 아닌 경우 스킬2 사용
	if 1 == CreatureAI.IsLiveOurTeam() then
		-- 버프가 걸려있을 경우 스킬1 사용
		if 1 == CreatureAI.IsApplyBuff("Effect_MP_NightChickQMEX_N_2") then
			count = CreatureAI.GetTargetCount("skill_slot_1")
			if count > 0 then
				-- 기동형 우선으로 스킬1 사용
				CreatureAI.SetTarget_ActorClass("skill_slot_1", 2)
			else
				CreatureAI.SetTarget("skill_slot_2", "self")
			end
		else
			CreatureAI.SetTarget("skill_slot_2", "self")
		end
	else
		-- 스킬1을 사용하고, 불가능할 경우 스킬2 사용
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
			-- 기동형 우선으로 스킬1 사용
			CreatureAI.SetTarget_ActorClass("skill_slot_1", 2)
		else
			CreatureAI.SetTarget("skill_slot_2", "self")
		end
	end
end
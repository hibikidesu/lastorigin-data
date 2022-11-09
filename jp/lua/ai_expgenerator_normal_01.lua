



function Process()
	-- 피격 당하기 전까지 스킬2 사용
	if 0 == CreatureAI.IsAttacked() then		
		if 1 == CreatureAI.IsLiveOurTeam() then
			CreatureAI.SetTarget("skill_slot_2", "self")
		else
			CreatureAI.SetTarget("skill_slot_1", "self")
		end
	else
		CreatureAI.SetTarget("skill_slot_1", "self")
	end
end
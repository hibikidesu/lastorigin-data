



function Process()

	-- 자신이 전열인 경우 스킬1을 우선적으로 사용
	pos = CreatureAI.GetGridPos()
	if 0 == pos % 3  then
	
		-- 스킬1 사정 거리에 적이 존재하면 스킬1 사용
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
			
			-- 기동형 우선으로 스킬1 사용
			CreatureAI.SetTarget_ActorClass("skill_slot_1", 2)
			
		else
			-- 아군이 살아있는 경우 스킬2를 우선적으로 사용
			if 1 == CreatureAI.IsLiveOurTeam() then
				CreatureAI.SetTarget("skill_slot_2", "ourteam")
			else
				CreatureAI.Wait()
			end	
		end
	else
		-- 아군이 살아있는 경우 스킬2를 우선적으로 사용
		if 1 == CreatureAI.IsLiveOurTeam() then
			CreatureAI.SetTarget("skill_slot_2", "ourteam")
		else
			-- 스킬1 사정 거리에 적이 존재하면 스킬1 사용
			count = CreatureAI.GetTargetCount("skill_slot_1")
			if count > 0 then
				
				-- 기동형 우선으로 스킬1 사용
				CreatureAI.SetTarget_ActorClass("skill_slot_1", 2)
			else
				CreatureAI.Wait()
			end
		end
	end
end
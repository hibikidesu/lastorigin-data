


-- 서버에서 스킬 선택 시 호출되는 함수  
function Process()

	-- 아군이 살아있는 경우
	if 1 == CreatureAI.IsLiveOurTeam() then
		-- 자신이 한 번이라도 공격당한 경우 자폭
		if 1 == CreatureAI.IsAttacked() then
			count = CreatureAI.GetTargetCount("skill_slot_2")
			if 0 < count then
				-- 경장 >> 중장 >> 가까운 순으로 공격
				if 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_2", 0) then
					return
				elseif 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_2", 1) then
					return
				else
					CreatureAI.SetTarget_Near("skill_slot_2")
				end
			else
				count = CreatureAI.GetTargetCount("skill_slot_1")
				if 0 < count then
					-- 경장 >> 중장 >> 가까운 순으로 공격
					if 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 0) then
						return
					elseif 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 1) then
						return
					else
						CreatureAI.SetTarget_Near("skill_slot_1")
					end
				else
					CreatureAI.Wait()
				end
			end
		else
			CreatureAI.Wait()
		end
	else
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if 0 < count then
			-- 경장 >> 중장 >> 가까운 순으로 공격
			if 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 0) then
				return
			elseif 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 1) then
				return
			else
				CreatureAI.SetTarget_Near("skill_slot_1")
			end
		else
			CreatureAI.Wait()
		end
	end
end 
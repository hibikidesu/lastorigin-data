


-- 서버에서 스킬 선택 시 호출되는 함수  
function Process()

	count = CreatureAI.GetTargetCount("skill_slot_1")
	if 0 < count then
		-- 기동 >> 경장 >> 가까운 순으로 공격
		if 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 2) then
			return
		elseif 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 0) then
			return
		else
			CreatureAI.SetTarget_Near("skill_slot_1")
		end
	else
		-- 아군이 살아있을 경우 스킬1만 사용
		if CreatureAI.IsLiveOurTeam() == 1 then
			CreatureAI.Wait()
		else
			-- 혼자만 남은 경우, 스킬1 사용 불가능할 경우 스킬2 사용
			count = CreatureAI.GetTargetCount("skill_slot_2")
			if 0 < count then
				-- 기동 >> 경장 >> 가까운 순으로 공격
				if 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_2", 2) then
					return
				elseif 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_2", 0) then
					return
				else
					CreatureAI.SetTarget_Near("skill_slot_2")
				end
			else
				CreatureAI.Wait()
			end
		end
	end
end

	
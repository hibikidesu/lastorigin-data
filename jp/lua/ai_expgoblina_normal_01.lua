



function Process()
	-- 스킬1로 타격 가능한 적이 복수일 경우 가장 경장형 > 중장형 순으로 스킬1 사용
	count = CreatureAI.GetTargetCount("skill_slot_1")
	if count > 1 then
		if 1 == CreatureAI.SetTarget_ActorClassAndRowInCnt_By_Near("skill_slot_1", 0, 2) then 
			return
		elseif 1 == CreatureAI.SetTarget_ActorClassAndRowInCnt_By_Near("skill_slot_1", 1, 2) then 
			return
		elseif 1 == CreatureAI.SetTarget_RowInCnt_By_Near("skill_slot_1", 2) then
			return
		else
			CreatureAI.SetTarget_ActorClass("skill_slot_1", 0)
		end
	else
		-- 스킬2 사용 가능 여부 파악
		count = CreatureAI.GetTargetCount("skill_slot_2")
		if count > 0 then
			-- 기동형 우선으로 스킬2 사용
			CreatureAI.SetTarget_ActorClass("skill_slot_2", 2)
		else
			-- 스킬2 사용 가능 위치로 이동
			pos = CreatureAI.MoveToUseSkillPos("skill_slot_2")
			if -1 == pos then
				-- 스킬1 사용 가능 위치로 이동하고, 못 찾으면 대기
				pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
				if -1 == pos then 
					CreatureAI.Wait()
				else
					CreatureAI.Move(pos)
				end
			else
				CreatureAI.Move(pos)
			end
		end
	end
end

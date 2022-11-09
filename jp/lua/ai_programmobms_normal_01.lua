



function Process()
	-- 동일 행에 적이 2명 이상 있을 경우 스킬2 우선 사용, 아닐 경우 스킬1 사용
	count = CreatureAI.GetTargetCount("skill_slot_2")
	if count > 0 then
	
		-- 적 캐릭터가 두명 이상 배치된 행중 가장 가까운 열의 대상에게 스킬2 사용
		if 1 == CreatureAI.SetTarget_RowInCnt_By_Near("skill_slot_2", 2) then
			return
			
		-- 해당 행이 없을 경우 스킬1 사용 가능 여부 파악
		else
			count = CreatureAI.GetTargetCount("skill_slot_1")
			if count > 0 then
				-- 가장 가까운 캐릭터에게 스킬1 사용
				CreatureAI.SetTarget_Near("skill_slot_1")
			else
				-- 가장 멀리있는 캐릭터에게 스킬2 사용
				CreatureAI.SetTarget("skill_slot_2", "backend")
			end
		end
	else
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
			-- 가장 가까운 캐릭터에게 스킬1 사용
				CreatureAI.SetTarget_Near("skill_slot_1")
		else
			-- 스킬1 사용 가능 위치로 이동
			pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
			if -1 == pos then
				-- 스킬2 사용 가능 위치로 이동하고, 못 찾으면 대기
				pos = CreatureAI.MoveToUseSkillPos("skill_slot_2")
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
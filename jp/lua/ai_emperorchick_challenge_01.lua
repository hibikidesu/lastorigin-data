



function Process()

	if CreatureAI.GetHPPer() < 50 then
		-- 스킬2 사정 거리 내에 적이 복수일 경우 스킬2를 사용하고, 아닐 경우 SubProcess 호출
		count = CreatureAI.GetTargetCount("skill_slot_2")
		if count > 1 then
		
			-- 적 캐릭터가 두명 이상 배치된 행중 가장 가까운 열의 대상에게 스킬2 사용
			if 1 == CreatureAI.SetTarget_RowInCnt_By_Near("skill_slot_2", 2) then
				return
				
			-- 가까운 대상에게 스킬 사용
			else
				CreatureAI.SetTarget_Near("skill_slot_2")
			end
		else
			SubProcess()
		end
	else
		SubProcess()
	end
end

function SubProcess()
	-- 스킬1의 사정 거리에 적 캐릭터가 존재하는지 확인하고, 아닐 경우 스킬 사용 가능 위치를 찾아 이동
	count = CreatureAI.GetTargetCount("skill_slot_1")
	if count > 0 then
		
		-- 적 캐릭터가 두명 이상 배치된 행중 가장 가까운 열의 대상에게 스킬1 사용
		if 1 == CreatureAI.SetTarget_RowInCnt_By_Near("skill_slot_1", 2) then
			return
		else
			-- 가까운 대상에게 스킬 사용
			CreatureAI.SetTarget_Near("skill_slot_1")
		end
	else
		-- 스킬2 사용 가능 여부 파악
		count = CreatureAI.GetTargetCount("skill_slot_2")
		if count > 0 then
	
			-- 적 캐릭터가 두명 이상 배치된 행중 가장 가까운 열의 대상에게 스킬2 사용
			if 1 == CreatureAI.SetTarget_RowInCnt_By_Near("skill_slot_2", 2) then
				return
				
			-- 가까운 대상에게 스킬 사용
			else
				CreatureAI.SetTarget_Near("skill_slot_2")
			end
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
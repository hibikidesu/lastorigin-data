



function Process()

	-- 스킬2 디버프를 보유한 대상이 있을 경우 스킬1을 사용하고, 불가능할 경우 SubProcess 호출
	-- 적 중에 스킬2 디버프가 걸려있는 대상이 있는지 확인
	if 1 == CreatureAI.IsApplyBuffTarget("Effect_MP_CenturionCF_N_2") then	
		
		-- 스킬1의 사정 거리에 적 캐릭터가 존재하는지 확인
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
		
			-- 스킬2 디버프가 걸린 적에게 공격 가능할 경우 스킬1 사용
			if 1 == CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_CenturionCF_N_2") then
				return

			-- 적 캐릭터가 두명 이상 배치된 행중 가장 가까운 열의 대상에게 스킬1 사용
			elseif 1 == CreatureAI.SetTarget_RowInCnt_By_Near("skill_slot_1", 2) then
				return
				
			-- 거리가 먼 대상에게 스킬 사용
			else
				CreatureAI.SetTarget("skill_slot_1", "backend")
			end
		else
			SubProcess()
		end
	else
		SubProcess()
	end
end 

function SubProcess()

	-- 사정 거리 내에 적이 있는 경우 스킬2 사용
	-- 스킬2의 사정 거리에 적 캐릭터가 존재하는지 확인
    count = CreatureAI.GetTargetCount("skill_slot_2")
	if count > 0 then
	
		-- 적 캐릭터가 두명 이상 배치된 행중 가장 가까운 열의 대상에게 스킬2 사용
		if 1 == CreatureAI.SetTarget_RowInCnt_By_Near("skill_slot_2",2) then
			return
			
		-- 랜덤 대상에게 스킬2 사용
		else
			CreatureAI.SetTarget("skill_slot_2", "backend")
		end

	-- 스킬2 사정 거리 내에 적이 없는 경우 각 스킬 사용 가능 위치를 찾아 이동하고, 이동 위치가 없을 경우 대기
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
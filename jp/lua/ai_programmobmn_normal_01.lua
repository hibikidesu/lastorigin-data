



function Process()
	
	-- 표식이 부여된 상태일 경우 스킬2 우선 사용
	if 1 == CreatureAI.IsApplyBuffTarget("Effect_MP_ProgramMobTT_N_1") or 1 == CreatureAI.IsApplyBuffTarget("Effect_MP_ProgramMobMS_N_1") then
	
		-- 표식이 부여된 적에게 공격 가능할 경우 스킬2 사용
		if 1 == CreatureAI.SetTarget_ApplyBuff("skill_slot_2", "Effect_MP_ProgramMobTT_N_1") then
			return
		elseif 1 == CreatureAI.SetTarget_ApplyBuff("skill_slot_2", "Effect_MP_ProgramMobMS_N_1") then
			return
		else
			SubProcess()
		end
		
	-- 과열이 부여된 상태일 경우 스킬1 우선 사용
	elseif 1 == CreatureAI.IsApplyBuffTarget("Effect_MP_ProgramMobTS_N_2") then
	
		-- 과열이 부여된 적에게 공격 가능할 경우 스킬2 사용
		if 1 == CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_ProgramMobTS_N_2") then
			return
		else
			SubProcess()
		end
	else
		SubProcess()
	end
end

function SubProcess()
	-- 스킬2 사용 가능 여부 확인
	count = CreatureAI.GetTargetCount("skill_slot_2")
	if count > 0 then
		-- 적이 복수로 존재하는 행의 중장형 > 경장형 > 가까운 순으로 스킬2 사용
		if 1 == CreatureAI.SetTarget_ActorClassAndRowInCnt_By_Near("skill_slot_2", 1, 2) then 
			return
		elseif 1 == CreatureAI.SetTarget_ActorClassAndRowInCnt_By_Near("skill_slot_2", 0, 2) then 
			return
		elseif 1 == CreatureAI.SetTarget_RowInCnt_By_Near("skill_slot_2", 2) then
			return
		else
			CreatureAI.SetTarget_ActorClass("skill_slot_2", 1)
		end
	else
		-- 스킬1 사용 가능 여부 확인
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
			-- 경장형 > 중장형 > 가까운 대상 순으로 스킬1 사용
			if 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 0) then
				return
			elseif 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 1) then
				return
			else
				CreatureAI.SetTarget_ActorClass("skill_slot_1", 0)
			end
		else
			-- 스킬2 사용 가능 위치로 이동
			pos = CreatureAI.MoveToUseSkillPos("skill_slot_2")
			if -1 == pos then
				-- 스킬1사용 가능 위치로 이동하고, 못 찾으면 대기
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

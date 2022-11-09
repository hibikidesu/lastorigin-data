



function Process()
	
	-- 표식이 부여된 상태일 경우 스킬1 우선 사용
	if 1 == CreatureAI.IsApplyBuffTarget("Effect_MP_ProgramMobTT_N_1") or 1 == CreatureAI.IsApplyBuffTarget("Effect_MP_ProgramMobMS_N_1") then
	
		-- 표식이 부여된 적에게 공격 가능할 경우 스킬1 사용
		if 1 == CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_ProgramMobTT_N_1") then
			return
		elseif 1 == CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_ProgramMobMS_N_1") then
			return
		else
			SubProcess()
		end
	-- 침수가 부여된 상태일 경우 스킬2 우선 사용
	elseif 1 == CreatureAI.IsApplyBuffTarget("Effect_MP_ProgramMobMT_N_1") or 1 == CreatureAI.IsApplyBuffTarget("Effect_MP_ProgramMobMS_N_1") then
	
		-- 침수가 부여된 적에게 공격 가능할 경우 스킬2 사용
		if 1 == CreatureAI.SetTarget_ApplyBuff("skill_slot_2", "Effect_MP_ProgramMobMT_N_1") then
			return
		elseif 1 == CreatureAI.SetTarget_ApplyBuff("skill_slot_2", "Effect_MP_ProgramMobMS_N_1") then
			return
		else
			SubProcess()
		end
	else
		SubProcess()
	end
end 

-- 디버프에 걸린 적이 없거나 해당 적을 공격할 수 없는 상태일 경우, 스킬2 > 스킬1 > 이동 > 대기 순으로 처리
function SubProcess()
	
	-- 스킬2의 사정 거리에 적 캐릭터가 존재하는지 확인
	count = CreatureAI.GetTargetCount("skill_slot_2")
	if count > 0 then
		-- 멀리 있는 적을 우선 공격
		CreatureAI.SetTarget("skill_slot_2", "backend")
	else
		-- 스킬1의 사정 거리에 적 캐릭터가 존재하는지 확인
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
			-- 멀리 있는 적을 우선 공격
			CreatureAI.SetTarget("skill_slot_1", "backend")
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
	
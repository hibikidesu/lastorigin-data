



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
	else
		SubProcess()
	end
end

function SubProcess()
	-- 스킬2 사용 가능 여부 확인 후 기동형 우선으로 공격
	count = CreatureAI.GetTargetCount("skill_slot_2")
	if count > 0 then
		CreatureAI.SetTarget_ActorClass("skill_slot_2", 2)
	else
		-- 스킬1 사용 가능 여부 확인 후 기동형 우선으로 공격
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
			CreatureAI.SetTarget_ActorClass("skill_slot_1", 2)
		else
			-- 대기
			CreatureAI.Wait()
		end
	end
end

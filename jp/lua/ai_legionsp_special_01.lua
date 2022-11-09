



function Process()

	-- 적 중에 스킬1 디버프가 걸려있는 대상이 있는지 확인
	if 1 == CreatureAI.IsApplyBuffTarget("Effect_MP_LegionSPEX_N_1") then								
		
		-- 스킬2의 사정 거리에 적 캐릭터가 존재하는지 확인
		count = CreatureAI.GetTargetCount("skill_slot_2")
		if count > 0 then
			-- 기동형 캐릭터를 우선으로 스킬2 사용
			CreatureAI.SetTarget_ActorClass("skill_slot_2", 2)
		else
			SubProcess()
		end
	else
		SubProcess()
	end
end

function SubProcess()
	
	-- 스킬1 우선 사용
	count = CreatureAI.GetTargetCount("skill_slot_1")
	if count > 0 then
		-- 가장 먼 열의 대상에게 스킬1 사용
		CreatureAI.SetTarget("skill_slot_1", "backend")
	else
		-- 스킬2 사용
		count = CreatureAI.GetTargetCount("skill_slot_2")
		if count > 0 then
			-- 기동형 캐릭터를 우선으로 스킬2 사용
			CreatureAI.SetTarget_ActorClass("skill_slot_2", 2)
		else
			CreatureAI.Wait()
		end
	end
end
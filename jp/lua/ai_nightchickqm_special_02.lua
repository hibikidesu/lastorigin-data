



function Process()

	-- 자신의 위치가 그리드 중앙일 경우 기존과 동일하게 행동
	pos = CreatureAI.GetGridPos()
	if 4 == pos then
		-- 버프가 걸려있을 경우 스킬1 사용
		if 1 == CreatureAI.IsApplyBuff("Effect_MP_NightChickQMEX_N_2") then
			count = CreatureAI.GetTargetCount("skill_slot_1")
			if count > 0 then
				-- 기동형 우선으로 스킬1 사용
				CreatureAI.SetTarget_ActorClass("skill_slot_1", 2)
			else
				CreatureAI.SetTarget("skill_slot_2", "self")
			end
		else
			CreatureAI.SetTarget("skill_slot_2", "self")
		end
	else
		-- 아군이 살아있으면 이동
		if 1 == CreatureAI.IsLiveOurTeam() then
			-- 그리드 위치가 홀수일 경우 마름모 반시계 방향으로 이동
			if 1 == pos % 2 then
				pos = ( pos * 2 + 1 ) % 10
				CreatureAI.Move(pos)
			else
				-- 그리드 위치가 짝수일 경우 사각형 반시계 방향으로 이동
				pos = ( pos * 2 + 6 ) % 10
				CreatureAI.Move(pos)
			end
		else
			-- 혼자 남은 경우 1스킬 위주로 사용
			count = CreatureAI.GetTargetCount("skill_slot_1")
			if count > 0 then
				-- 기동형 우선으로 스킬1 사용
				CreatureAI.SetTarget_ActorClass("skill_slot_1", 2)
			else
				CreatureAI.SetTarget("skill_slot_2", "self")
			end
		end
	end
end 

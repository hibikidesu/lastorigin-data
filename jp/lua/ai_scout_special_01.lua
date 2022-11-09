



function Process()

	-- 자신의 위치가 그리드 중앙일 경우, SubProcess 호출
	pos = CreatureAI.GetGridPos()
	if 4 == pos then
		SubProcess()
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
			-- 혼자 남은 경우 SubProcess 호출
			SubProcess()
		end
	end
end 

function SubProcess()

	-- 33% 확률로 스킬2를 사용하고, 나머지 확률로 스킬1 사용
	if CreatureAI.IsLiveOurTeam() == 1 and CreatureAI.GetRandomValue(100) <= 33 then
		CreatureAI.SetTarget("skill_slot_2", "ourteam")
	else
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
			-- 가장 먼 열의 대상에게 스킬1 사용
			CreatureAI.SetTarget("skill_slot_1", "backend")
		elseif 1 == CreatureAI.IsLiveOurTeam() then
			CreatureAI.SetTarget("skill_slot_2", "ourteam")
		else
			CreatureAI.Wait()
		end
	end
end
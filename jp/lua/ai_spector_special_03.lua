



function Process()

	
	pos = CreatureAI.GetGridPos()
	
	-- 공격 당한 적이 없다면 이동
		if  60 <= CreatureAI.GetHPPer() then
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
			-- 공격 당했다면 SubProcess 호출
			SubProcess()
		end
	end

function SubProcess()

	-- 자신에게 버프가 걸려있으면 스킬1을 사용하고, 아닌 경우 스킬2 사용
	if 1 == CreatureAI.IsApplyBuff("Effect_MP_SpectorMS_EW_2") then
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
			-- 가장 먼 열의 대상에게 스킬1 사용
			CreatureAI.SetTarget("skill_slot_1", "backend")
		else
			CreatureAI.SetTarget("skill_slot_2", "self")
		end
	else
		CreatureAI.SetTarget("skill_slot_2", "self")
	end
end
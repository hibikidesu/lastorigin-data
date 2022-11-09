


-- 서버에서 스킬 선택 시 호출되는 함수  
function Process()
	
	-- 지휘를 받지 않는 경우
	if CreatureAI.IsApplyBuff("Effect_MP_Sirene_EV1_2") ~= 1 then
		pos = CreatureAI.GetGridPos()
		-- 그리드 위치가 홀수일 경우 마름모 반시계 방향으로 이동
		if 1 == pos % 2 then
			pos = ( pos * 2 + 1 ) % 10
			CreatureAI.Move(pos)
		else
			-- 그리드 위치가 짝수일 경우 사각형` 반시계 방향으로 이동
			pos = ( pos * 2 + 6 ) % 10
			CreatureAI.Move(pos)
		end
	else
		-- 1스킬 사용 가능 여부 확인
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if 0 < count and CreatureAI.GetHPPer() <= 25 then 
			-- 경장 >> 중장 >> 가까운 순으로 공격
			if 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 0) then
				return
			elseif 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 1) then
				return
			else
				CreatureAI.SetTarget_Near("skill_slot_1")
			end
		else
			-- 2스킬 사용 가능 여부 확인
			count = CreatureAI.GetTargetCount("skill_slot_2")
			if 0 < count then 
				-- 경장 >> 중장 >> 가까운 순으로 공격
				if 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_2", 0) then
					return
				elseif 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_2", 1) then
					return
				else
					CreatureAI.SetTarget_Near("skill_slot_2")
				end
			else
				CreatureAI.Wait()
			end
		end
	end
end 


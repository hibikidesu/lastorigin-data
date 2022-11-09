


-- 서버에서 스킬 선택 시 호출되는 함수  
function Process()
	
	-- 아군이 살아있을 경우
	if CreatureAI.IsLiveOurTeam() == 1 then
		-- 자신이 전열일 경우 위치 이동 / 전열이 아닐 경우 스킬2 사용
		pos = CreatureAI.GetGridPos()
		if 0 == pos % 3  then
			pos = 8 - pos
			CreatureAI.Move(pos)
		else
			CreatureAI.SetTarget("skill_slot_2", "ourteam")
		end
	else	
		-- 혼자 살아있을 경우 스킬1 사용 여부 확인
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if 0 < count then
			-- 중장 >> 경장 >> 가까운 순으로 공격
			if 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 1) then
				return
			elseif 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 0) then
				return
			else
				CreatureAI.SetTarget_Near("skill_slot_1")
			end
		else
			-- 스킬1 사용 불가능할 경우 대기
			CreatureAI.Wait()
		end
	end
end
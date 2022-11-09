


-- 서버에서 스킬 선택 시 호출되는 함수  
function Process()

	-- 스킬1 사용 가능 여부 확인
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
		CreatureAI.Wait()
	end
end
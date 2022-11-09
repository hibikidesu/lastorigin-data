


-- 서버에서 스킬 선택 시 호출되는 함수  
function Process()

	-- HP가 25% 이상 + 다른 아군이 있고, 발동확률이 50% 일때 
	if CreatureAI.GetHPPer() >= 25 and CreatureAI.IsLiveOurTeam() == 1 and CreatureAI.GetRandomValue(100) <= 50 then
		-- 스킬 2번 선택 
		CreatureAI.SetTarget("skill_slot_2", "ourteam")
	else
		-- 적이 1번 스킬의 사정 거리에 존재 하면 스킬1번 선택하고, 대상은 랜덤 , 100% 발동 
		count = CreatureAI.GetTargetCount("skill_slot_1")
        if count == 0 then 
			-- 적이 1번 스킬의 사정 거리 바깥에 존재하고, HP가 25% 이상 + 다른 아군이 있으면 스킬 2선택,  자신외의 아군을 타겟 
			if CreatureAI.GetHPPer() >= 25 and CreatureAI.IsLiveOurTeam() == 1 then 
				CreatureAI.SetTarget("skill_slot_2", "ourteam")
			else
				-- 적이 1번 스킬의 사정거리 바깥에 존재하면 공격가능열로 이동,  같은열의 랜덤 그리드로 이동 
				pos = CreatureAI.MoveToUseSkillPos("skill_slot_1") -- 같은 열의 스킬공격이 가능한 위치를 알아낸다.
				if -1 == pos then 
					CreatureAI.Wait()-- 이동 불가할 경우 대기한다. 
				else 
					CreatureAI.Move(pos)-- 이동 한다. 
				end 
			end 
		else 
			CreatureAI.SetTarget("skill_slot_1", "random")
			
		end 
	end 
end 
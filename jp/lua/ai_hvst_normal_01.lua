


-- 서버에서 스킬 선택 시 호출되는 함수  
function Process()

	isMoveFront = 1 

	-- 자신이 가장 앞열이 아닐 경우 
	if CreatureAI.GetGridPos() ~= 0 and CreatureAI.GetGridPos() ~= 3 and CreatureAI.GetGridPos() ~= 6 then 
	
		-- 가장 앞열로 이동 
		pos = CreatureAI.MoveToFrontPos()
		if -1 ~= pos then 
			CreatureAI.Move(pos)-- 이동 한다.
		else 
			isMoveFront = 0  -- 이미 앞열이거나 이동할 수 없는 경우 
		end 
	else 
		isMoveFront = 0 -- 이미 앞 열인 경우 
	end 
	
	-- 이미 앞열이거나 이동할 수 없는 경우 
	if isMoveFront == 0 then 
		-- 스킬의 사정거리에 적이 있는지 확인
		count = CreatureAI.GetTargetCount("skill_slot_2")
		if count == 0 then 
			-- 대기 
            pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2") -- 스킬사용이 가능한 위치를 가져옴
			if -1 == pos2 then 
				CreatureAI.Wait()-- 이동 불가할 경우 대기한다. 
			else 
				CreatureAI.Move(pos)-- 이동 한다. 
			end 
		else 
			CreatureAI.SetTarget("skill_slot_2", "random")
		end 
	end 
end 


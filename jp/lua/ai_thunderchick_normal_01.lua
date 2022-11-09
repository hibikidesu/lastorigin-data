


-- 서버에서 스킬 선택 시 호출되는 함수  
function Process()

	isMoveFront = 1 

	-- 자신이 가장 앞열이 아닐 경우 HP 33% 이하
	if CreatureAI.GetGridPos() ~= 0 and CreatureAI.GetGridPos() ~= 3 and CreatureAI.GetGridPos() ~= 6 and CreatureAI.GetHPPer() <= 33 then 
	
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
			-- 적이 1번 스킬의 사정거리에 존재하는 지 확인 
		count = CreatureAI.GetTargetCount("skill_slot_2")
		if count == 0 then 

			-- 적이 2번 스킬의 사정 거리에 존재하는 지 확인 
			count2 = CreatureAI.GetTargetCount("skill_slot_1")
			if count2 == 0 then 
			
				pos = CreatureAI.MoveToUseSkillPos("skill_slot_2") -- 스킬1사용이 가능한 위치를 가져옴
				if -1 == pos then 
				
					pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_1") -- 스킬2사용이 가능한 위치를 가져옴
					
					if -1 == pos2 then 
						 -- 대기 
						CreatureAI.Wait()
					else 
						CreatureAI.Move(pos2)-- 이동 한다. 
					end 
				else 
					CreatureAI.Move(pos)-- 이동 한다. 
				end 
			else 
				-- 1번 스킬로 경장형을 공격
				CreatureAI.SetTarget_ActorClass("skill_slot_1", 0)
			end 
		else
			-- 2번 스킬로 가까운 놈을 공격 
			CreatureAI.SetTarget_Near("skill_slot_2")
		end 
	end 
end 
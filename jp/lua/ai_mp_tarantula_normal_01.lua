



function Process()

	-- 자신이 전열에 위치한 경우 스킬2 위주 사용
	pos = CreatureAI.GetGridPos()
	if 0 == pos % 3  then
	
		-- 스킬1 사정 거리에 적이 존재하면 스킬1 사용
		count = CreatureAI.GetTargetCount("skill_slot_2")
		if count > 0 then
			
			-- 가까운 적한테 스킬2 사용
			CreatureAI.SetTarget_Near("skill_slot_2")
			
		-- 스킬1 사정 거리에 적이 존재하지 않으면 SubProcess 호출
		else
			SubProcess()
		end
	else
		SubProcess()
	end
end 

function SubProcess()

	-- 자신의 HP가 25% 이상이면 스킬1 사용
	if CreatureAI.GetHPPer() >= 25 then
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
			-- 경장형 우선으로 스킬1 사용
			CreatureAI.SetTarget_ActorClass("skill_slot_1", 0)
		else
			-- 스킬1 사용 위치를 찾아 이동하고, 못 찾으면 대기
			pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
			if -1 == pos then 
				CreatureAI.Wait()
			else
				CreatureAI.Move(pos)
			end
		end
	elseif CreatureAI.GetGridPos() ~= 0 and CreatureAI.GetGridPos() ~= 3 and CreatureAI.GetGridPos() ~= 6 then
			pos = CreatureAI.MoveToFrontPos()
			if -1 ~= pos then 
				CreatureAI.Move(pos)-- 이동 한다.
			else 
				count = CreatureAI.GetTargetCount("skill_slot_1")
				if count > 0 then
				-- 경장형 우선으로 스킬1 사용
					CreatureAI.SetTarget_ActorClass("skill_slot_1", 0)
				else
					pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
					if -1 == pos then
						CreatureAI.Wait()
					else
						CreatureAI.Move(pos)
					end
				end
			end
	else
		CreatureAI.Wait()
	end
end

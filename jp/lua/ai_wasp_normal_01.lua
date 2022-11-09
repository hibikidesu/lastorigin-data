


-- 서버에서 스킬 선택 시 호출되는 함수  
function Process()

	-- 적이 2번스킬 사정거리에 존재하는지 여부 
	existTargetInDistance = 0 
	count = CreatureAI.GetTargetCount("skill_slot_2")
	if count ~= 0 then 
		existTargetInDistance = 1 
	end 
	

	-- hp 가 25% 이하이면서, 적이 2번 스킬의 사정거리에 존재할 경우 
	if CreatureAI.GetHPPer() < 25 and existTargetInDistance then
		-- 스킬 2 선택 
		CreatureAI.SetTarget_Near("skill_slot_2")
	else
		count2 = CreatureAI.GetTargetCount("skill_slot_1") -- 스킬1사용이 가능한 위치를 가져옴
		if 0 == count2 then 
			pos = CreatureAI.MoveToUseSkillPos("skill_slot_1") -- 스킬1사용이 가능한 위치를 가져옴
			if -1 == pos then 
			
				pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2") -- 스킬2사용이 가능한 위치를 가져옴
				
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
			CreatureAI.SetTarget_Near("skill_slot_1")
		end 
	end 
end 
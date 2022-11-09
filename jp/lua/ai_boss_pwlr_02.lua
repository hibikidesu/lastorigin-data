


-- 서버에서 스킬 선택 시 호출되는 함수  
function Process()

	-- 적이 1번 스킬의 사정거리에 존재하는 지 확인 (75%)
	count = CreatureAI.GetTargetCount("skill_slot_1")
	if count == 0 then 

		-- 적이 2번 스킬의 사정 거리에 존재하는 지 확인 
		count2 = CreatureAI.GetTargetCount("skill_slot_2")
		if count2 == 0 then 
		
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
			-- 2번 스킬로 뒤에 있는 대상을 공격 
			CreatureAI.SetTarget("skill_slot_2", "backend")
		end 
	else 
	-- Effect_MP_Predator_B0208_2 버프 이펙트에 걸린 대상에게 스킬 1번 사용 
        if CreatureAI.IsApplyBuffTarget("Effect_MP_Predator_B0208_2") == 1 then  
            CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_Predator_B0208_2")
            return 
        else 
			-- 1번 스킬로 무작위 대상을 공격 
			CreatureAI.SetTarget_ActorClass("skill_slot_1", 0)
		end 
	end 
end 
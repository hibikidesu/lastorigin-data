



function Process()

	-- 자신이 업그레이드 상태면 2스킬 사용
	if CreatureAI.IsApplyBuff("Effect_MP_NightChickS_C_2") == 1 then
	
		-- 스킬1 사정 거리에 적이 존재하면 스킬1 사용
		count = CreatureAI.GetTargetCount("skill_slot_2")
		if count > 0 then
			
			-- 기동형 우선으로 스킬2 사용
			CreatureAI.SetTarget_ActorClass("skill_slot_2", 2)
			
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
			-- 가장 뒤 녀석에게 스킬1 사용
			CreatureAI.SetTarget("skill_slot_1", "backend")
		else
			-- 스킬1 사용 위치를 찾아 이동하고, 못 찾으면 대기
			pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
			if -1 == pos then 
				CreatureAI.Wait()
			else
				CreatureAI.Move(pos)
			end
		end
	else
		count = CreatureAI.GetTargetCount("skill_slot_2")
		if count > 0 then
				-- 기동형 우선으로 스킬2 사용
			CreatureAI.SetTarget_ActorClass("skill_slot_2", 2)
		else
			pos = CreatureAI.MoveToUseSkillPos("skill_slot_2")
			if -1 == pos then
				CreatureAI.Wait()
			else
				CreatureAI.Move(pos)
			end
		end
	end
end

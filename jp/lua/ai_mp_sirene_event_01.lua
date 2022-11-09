



function Process()

	-- 자신이 전열에 위치한 경우 스킬1 위주 사용
	pos = CreatureAI.GetGridPos()
	if 0 == pos % 3  then
	
		-- 스킬1 사정 거리에 적이 존재하면 스킬1 사용
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
			
			-- 기동형 우선으로 스킬1 사용
			CreatureAI.SetTarget_ActorClass("skill_slot_1", 2)
			
		-- 스킬1 사정 거리에 적이 존재하지 않으면 SubProcess 호출
		else
			SubProcess()
		end
	else
		SubProcess()
	end
end 

function SubProcess()

	-- 아군이 살아있고 빙결 코팅 상태가 아니면 스킬2 사용
	if 1 == CreatureAI.IsLiveOurTeam() and CreatureAI.IsApplyBuff("Effect_MP_Sirene_EV1_2") ~= 1 then
		CreatureAI.SetTarget("skill_slot_2", "random")
	else
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
			-- 기동형 우선으로 스킬1 사용
			CreatureAI.SetTarget_ActorClass("skill_slot_1", 2)
		else
			-- 스킬1 사용 위치를 찾아 이동하고, 못 찾으면 대기
			pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
			if -1 == pos then 
				CreatureAI.Wait()
			else
				CreatureAI.Move(pos)
			end
		end
	end
end

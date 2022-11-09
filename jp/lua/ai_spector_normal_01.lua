



function Process()

	-- 자신이 전열인 경우 스킬1 위주로 사용하고, 불가능한 경우 SubProcess 호출
	pos = CreatureAI.GetGridPos()
	if 0 == pos % 3  then
	
		-- 스킬1 사정 거리에 적이 존재하면 스킬1 사용
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
		
			-- 적 캐릭터가 두명 이상 배치된 행중 가장 가까운 열의 대상에게 스킬1 사용
			if 1 == CreatureAI.SetTarget_RowInCnt_By_Near("skill_slot_1", 2) then
				return
			else
				-- 기동형 우선으로 스킬1 사용
				CreatureAI.SetTarget_ActorClass("skill_slot_1", 2)
			end
		else
			SubProcess()
		end
	else
		SubProcess()
	end
end 

function SubProcess()

	-- 아군이 살아있는 경우 스킬2 위주로 사용하고, 아닌 경우 스킬1 사용 위치로 이동
	if 1 == CreatureAI.IsLiveOurTeam() then
		CreatureAI.SetTarget("skill_slot_2", "self")
		
	-- 스킬1 사용 위치를 찾아 이동하고, 못 찾으면 대기
	else
		pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
		if -1 == pos then 
			CreatureAI.Wait()
		else
			CreatureAI.Move(pos)
		end
	end
end
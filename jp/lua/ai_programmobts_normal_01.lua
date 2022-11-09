



function Process()

	-- 자신이 전열에 위치한 경우
	pos = CreatureAI.GetGridPos()
	if 0 == pos % 3  then
	
		-- 스킬1 디버프가 걸려있는 대상 파악
		if 1 == CreatureAI.IsApplyBuffTarget("Effect_MP_ProgramMobTS_N_1") then	
			
			-- 스킬2 사용 가능 여부 파악
			count = CreatureAI.GetTargetCount("skill_slot_2")
			if count > 0 then
				
				-- 스킬1 디버프가 걸려있는 대상에게 스킬2 사용
				if 1 == CreatureAI.SetTarget_ApplyBuff("skill_slot_2", "Effect_MP_ProgramMobTS_N_1") then
					return
				
				-- 해당 대상에게 사용 불가능할 경우 가장 먼 대상에게 스킬2 사용
				else
					CreatureAI.SetTarget("skill_slot_2", "backend")
				end
			
			-- 스킬2 사용이 불가능할 경우 스킬1 사용
			else
				-- 스킬1 사용 가능 여부 파악
				count = CreatureAI.GetTargetCount("skill_slot_1")
				if count > 0 then
					-- 가장 가까운 대상에게 스킬1 사용
					CreatureAI.SetTarget_Near("skill_slot_1")
				-- 스킬1 사용이 불가능할 경우 대기
				else
					CreatureAI.Wait()
				end
			end
		
		-- 스킬1 디버프가 걸려있지 않은 경우 SubProcess 호출
		else
			SubProcess()
		end
	
	-- 자신이 전열이 아닌 경우 SubProcess 호출
	else
		SubProcess()
	end
end

-- 스킬1을 우선적으로 사용하고, 불가능할 경우 스킬2 사용하는 SubProcess
function SubProcess()
	
	-- 스킬1 사용 가능 여부 파악
	count = CreatureAI.GetTargetCount("skill_slot_1")
	if count > 0 then
		-- 가장 가까운 대상에게 스킬1 사용
		CreatureAI.SetTarget_Near("skill_slot_1")
		
	else
		-- 스킬2 사용 가능 여부 파악
		count = CreatureAI.GetTargetCount("skill_slot_2")
		if count > 0 then
			-- 가장 먼 대상에게 스킬2 사용
			CreatureAI.SetTarget("skill_slot_2", "backend")
		
		-- 모든 스킬 사용이 불가능할 경우 스킬1 사용 가능 위치로 이동
		else
			pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
			if -1 == pos then
				
				-- 스킬2 사용 가능 위치로 이동하고, 못 찾으면 대기
				pos = CreatureAI.MoveToUseSkillPos("skill_slot_2")
				if -1 == pos then 
					CreatureAI.Wait()
				else
					CreatureAI.Move(pos)
				end
			else
				CreatureAI.Move(pos)
			end
		end
	end
end 
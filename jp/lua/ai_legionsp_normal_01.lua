



function Process()

	-- 적 중에 스킬1 디버프가 걸려있는 대상이 있는지 확인
	if 1 == CreatureAI.IsApplyBuffTarget("Effect_MP_LegionSP_N_1") then								
		
		-- 스킬2의 사정 거리에 적 캐릭터가 존재하는지 확인
		count = CreatureAI.GetTargetCount("skill_slot_2")
		if count > 0 then
		
			-- 스킬1 디버프가 걸린 적에게 공격 가능할 경우 스킬2 사용
			if 1 == CreatureAI.SetTarget_ApplyBuff("skill_slot_2", "Effect_MP_LegionSP_N_1") then
				return
			
			-- 중장형 캐릭터를 우선으로 스킬2 사용
			else
				CreatureAI.SetTarget_ActorClass("skill_slot_2", 1)
			end
		else
			-- 스킬1 사정 거리 내에 적이 있을 경우 스킬1 사용
			count = CreatureAI.GetTargetCount("skill_slot_1")
			if count > 0 then
		
				-- 적 캐릭터가 두명 이상 배치된 행중 가장 가까운 열의 대상에게 스킬1 사용
				if 1 == CreatureAI.SetTarget_RowInCnt_By_Near("skill_slot_1", 2) then
					return
					
				-- 중장형 캐릭터를 우선으로 스킬1 사용
				else
					CreatureAI.SetTarget_ActorClass("skill_slot_1", 1)
				end
			else
				-- 스킬1 사용 가능 위치로 이동
				pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
				if -1 == pos then
				
					-- 스킬2 사용 가능 위치로 이동
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
	
	-- 스킬1 사정 거리 내에 적이 있을 경우 스킬1 사용
	else
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if count > 0 then
		
			-- 적 캐릭터가 두명 이상 배치된 행중 가장 가까운 열의 대상에게 스킬1 사용
			if 1 == CreatureAI.SetTarget_RowInCnt_By_Near("skill_slot_1", 2) then
				return
				
			-- 중장형 캐릭터를 우선으로 스킬1 사용
			else
				CreatureAI.SetTarget_ActorClass("skill_slot_1", 1)
			end
		
		-- 스킬2의 사정 거리에 적 캐릭터가 존재하는지 확인		
		else 
			count = CreatureAI.GetTargetCount("skill_slot_2")
			if count > 0 then
				-- 중장형 우선 공격
				CreatureAI.SetTarget_ActorClass("skill_slot_2", 1)
		
			-- 스킬2 사정 거리 내에 적이 없는 경우 각 스킬 사용 가능 위치를 찾아 이동하고, 이동 위치가 없을 경우 대기
			else
			
				-- 스킬1 사용 가능 위치로 이동
				pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
				if -1 == pos then
				
					-- 스킬2 사용 가능 위치로 이동
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
end
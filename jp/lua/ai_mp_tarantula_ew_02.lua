


function Process() 

        -- 자폭 준비 상태일 시 자폭 
    if CreatureAI.IsApplyBuff("Effect_MP_Tarantula_EW2_31") == 1 then
	
		count = CreatureAI.GetTargetCount("skill_slot_2")
			if count > 0 then
				
					CreatureAI.SetTarget_Near("skill_slot_2")
			else
				pos1 = CreatureAI.MoveToUseSkillPos("skill_slot_2")
				if -1 == pos1 then
					CreatureAI.Wait()
				else
					CreatureAI.Move(pos1)
				end
			end
        
    else
        count = CreatureAI.GetTargetCount("skill_slot_1")
				if count > 0 then
				
					CreatureAI.SetTarget_Near("skill_slot_1")
				else
					pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_1")
					if -1 == pos2 then
						CreatureAI.Wait()
					else
						CreatureAI.Move(pos2)
					end
				end
    end
end

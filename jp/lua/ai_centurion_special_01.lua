


function Process() 

    -- 버프에 걸린 대상이 있는지 검사하고, 없으면 스킬2를 사용 
    if 1 ~= CreatureAI.IsApplyBuffTarget("Effect_MP_CenturionEX_N_2") then 
        
		count = CreatureAI.GetTargetCount("skill_slot_2")
        if count > 0 then
            CreatureAI.SetTarget_Near("skill_slot_2")
		else
			SubProcess()
        end
	else
		SubProcess()
    end 
end 

function SubProcess()

	-- 1 번 스킬의 사정거리에 있는지 검사해서 버프에 걸린 대상 >> 멀리 있는 대상에게 스킬1 사용
    count = CreatureAI.GetTargetCount("skill_slot_1")
	if count > 0 then 
		if CreatureAI.IsApplyBuffTarget("Effect_MP_CenturionEX_N_2") == 1 then  
			CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_CenturionEX_N_2")
		else
			CreatureAI.SetTarget_Near("skill_slot_1")
		end
	else
		count = CreatureAI.GetTargetCount("skill_slot_2")
        if count > 0 then
			CreatureAI.SetTarget_Near("skill_slot_2")
		else
			pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
			if -1 == pos then 
				pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")
				if -1 == pos2 then 
					CreatureAI.Wait()
				else 
					CreatureAI.Move(pos2)
				end 
			else 
				CreatureAI.Move(pos)
			end
		end
    end
end



function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

        -- 아군이 살아있고 방어 태세 일때 80%확률로 2스 사용
    if CreatureAI.IsApplyBuff("Effect_MP_PhalangitesH_N_4") == 1 and 20 <= CreatureAI.GetRandomValue(100) then
					
        CreatureAI.SetTarget("skill_slot_2", "self")
				
    else
       
		--방어 태세가 아닐 때 1스 사용
	   SubProcess()
	   
    end 
end 


-- 1스 사용(기동 우선)
function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget_ActorClass("skill_slot_1", 2)
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
end

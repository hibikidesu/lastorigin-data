


function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")
now_pos = CreatureAI.GetGridPos()

        -- 내가 전열이고 아군이 살아있을 시 2스만 사용
    if 0 == now_pos % 3 and CreatureAI.IsLiveOurTeam == 0 then
					
        CreatureAI.SetTarget("skill_slot_2", "self")
				
    else
       
		
	   SubProcess()
	   
    end 
	
end 


-- 1스 사용(기동 우선)
function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget("skill_slot_1", "near")
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
end

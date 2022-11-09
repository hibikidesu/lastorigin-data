



function Process() 

pos = CreatureAI.MoveToFrontPos()	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

        -- 1스 사용
    if 	count > 0 then	
					
		CreatureAI.SetTarget("skill_slot_1", "AtkHighest")
				
    else
       --1스 사거리에 적 없으면 2스 사용
	   SubProcess()
	   
    end 
end 



--2스 사용
function SubProcess()

	if 	count2 > 0 then	
					
		CreatureAI.SetTarget("skill_slot_2", "ourteam")
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
	
end
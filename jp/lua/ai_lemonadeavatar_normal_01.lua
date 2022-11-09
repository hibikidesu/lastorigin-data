



function Process() 

pos = CreatureAI.MoveToFrontPos()	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

        -- 2스 사용
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


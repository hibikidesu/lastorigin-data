function Process() 

pos = CreatureAI.MoveToFrontPos()	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

        -- 1스 사용
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

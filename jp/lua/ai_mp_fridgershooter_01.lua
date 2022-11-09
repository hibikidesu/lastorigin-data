


function Process() 

pos = CreatureAI.MoveToFrontPos()	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")



    -- 70% 확률로 2스 사용
    if  count2 > 0 and 30 <= CreatureAI.GetRandomValue(100) then
					
        CreatureAI.SetTarget("skill_slot_2", "near")
				
    else
       
		-- 1스 사용
	   SubProcess()
	   
    end 
end

	
-- 1스 사용
function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget("skill_slot_1", "HPLow")
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
	
end

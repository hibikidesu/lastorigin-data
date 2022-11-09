

function Process() 

pos = CreatureAI.GetGridPos()
pos2 = CreatureAI.MoveToFrontPos()	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")
     
	--1스 사용
	if 	count > 0 then	
					
		CreatureAI.SetTarget("skill_slot_1", "near")
		
	else
		--전열인데 1스를 못쓰는 상황이면 2스 사용
		if 0 == pos or 3 == pos or 6 == pos  then
				
		CreatureAI.SetTarget("skill_slot_2", "self")
				
		else
		--전열 이동		
		CreatureAI.Move(pos2)
				
		end
		
    end
	 
end 
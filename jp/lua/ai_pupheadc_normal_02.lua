
function Process()

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")
now_pos = CreatureAI.GetGridPos()

	-- 중열 또는 후열일 경우 2스 사용
	if 1 == now_pos % 3 or 2 == now_pos % 3 then	
		
		SubProcess2()
	   
		else
		
		SubProcess()
		
		
		
		end
		
	end 

	
-- 1스 사용
function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget_ActorClass("skill_slot_1", 0)
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
	
end


--2스 사용
function SubProcess2()

	if 	count2 > 0 then	
					
		CreatureAI.SetTarget("skill_slot_2","backend")
		
	else
		
		if -1 == pos2 then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos2)
				
		end
		
    end
	
end


function Process()

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")
now_pos = CreatureAI.GetGridPos()

	-- 자신이 전열에 위치할 경우 1스 사용
	if 0 == now_pos % 3 then	
		
	   SubProcess()
	   
		else
		--2스 사용
		CreatureAI.SetTarget("skill_slot_2", "self")
		
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
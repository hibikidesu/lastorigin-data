
function Process()

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")
now_pos = CreatureAI.GetGridPos()

	-- 체력이 60%이상일 경우 1스만 사용
	if 60 <= CreatureAI.GetHPPer() then	
		
		SubProcess()
	   
		else
		
			--40%확률로 2스 사용 
			if 70 <= CreatureAI.GetRandomValue(100) then
		
			SubProcess2()
		
			else
		
			SubProcess()
		
			end
		
		end
		
	end 

	
-- 1스 사용
function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget_ActorClass("skill_slot_1", 1)
		
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
					
		CreatureAI.SetTarget_ActorClass("skill_slot_2", 1)
		
	else
		
		if -1 == pos2 then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos2)
				
		end
		
    end
	
end

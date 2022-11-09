


function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

    -- 체력이 70%이상일 경우, 1스만 사용
	if 70 <= CreatureAI.GetHPPer() then
	
		SubProcess()
	
	else
		
		-- 위에 해당 안될 경우 40%확률로 2스 사용 
		if 60 <= CreatureAI.GetRandomValue(100) then
		
		SubProcess2()
		
		else
		
		SubProcess()
		
		end
		
	end
	
end 


-- 1스 사용
function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget("skill_slot_1","HPLow")
		
	else
		
		if -1 == pos then 
				
			CreatureAI.Wait()
				
		else
				
			CreatureAI.Move(pos)
				
		end
		
    end
	
end


-- 2스 사용
function SubProcess2()

	if 	count2 > 0 then	
					
		CreatureAI.SetTarget("skill_slot_2","HPLow")
		
	else
		
		if -1 == pos2 then 
				
			CreatureAI.Wait()
				
		else
				
			CreatureAI.Move(pos2)
				
		end
		
    end
	
end


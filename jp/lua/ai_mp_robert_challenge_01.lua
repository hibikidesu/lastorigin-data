

function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

    -- 체력이 70%이상일 경우, 1스만 사용
	if 70 <= CreatureAI.GetHPPer() then
	
		SubProcess()
	
	else
		
		-- 체력이 70%이하인 상태에서 약점 분석(최대)상태일 시 2스만 사용 
		if CreatureAI.IsApplyBuff("Effect_MP_Robert_Challenge1_58") == 1 then
			
		SubProcess2()
			
		else
		
			-- 체력이 70%이하인 상태에서 2스 최대가 아닐 시 10%확률로 2스만 사용
			if  90 <= CreatureAI.GetRandomValue(100) then
		
				SubProcess2()
		
			else
			
				SubProcess()
			
			end
		
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


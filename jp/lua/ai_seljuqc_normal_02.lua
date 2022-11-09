


function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

    -- 증가 장갑 상태일 경우 2스 사용
	if CreatureAI.IsApplyBuff("Effect_MP_SeljuqA_SA1_4") == 1 or
		CreatureAI.IsApplyBuff("Effect_MP_SeljuqA_SA2_4") == 1 or
		CreatureAI.IsApplyBuff("Effect_MP_SeljuqA_SA3_4") == 1 or
		CreatureAI.IsApplyBuff("Effect_MP_SeljuqA_SA4_4") == 1 or
		CreatureAI.IsApplyBuff("Effect_MP_SeljuqA_SA5_4") == 1  then
	
		SubProcess2()
	
	else
		--증가 장갑 상태가 아닐경우 70%확률로 1스 사용
		if 30 <= CreatureAI.GetRandomValue(100) then
			
		SubProcess()
		
		else
		
		SubProcess2()
		
		end
				
	end
	
end 


-- 1스 사용
function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget("skill_slot_1","near")
		
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
					
		CreatureAI.SetTarget("skill_slot_2","backend")
		
	else
		
		if -1 == pos2 then 
				
			CreatureAI.Wait()
				
		else
				
			CreatureAI.Move(pos2)
				
		end
		
    end
	
end


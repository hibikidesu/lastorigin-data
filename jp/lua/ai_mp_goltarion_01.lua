



function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

        -- 2스 버프 자신에게 안걸려있으면 2스 사용
    if	CreatureAI.IsApplyBuff("Effect_MP_Goltarion_N_2") == 0 then
					
        SubProcess2()
				
    else
       --아닐 때 1스 사용
	   SubProcess()
	   
    end 
end 



-- 1스 사용
function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget("skill_slot_1", "random")
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos3)
				
		end
		
    end
	
end



--2스 사용
function SubProcess2()

	if 	count2 > 0 then	
					
		CreatureAI.SetTarget("skill_slot_2", "self")
		
	else
		
		if -1 == pos2 then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos3)
				
		end
		
    end
	
end
	

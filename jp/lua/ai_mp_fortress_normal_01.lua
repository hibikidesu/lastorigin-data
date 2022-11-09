



function Process() 

pos = CreatureAI.MoveToFrontPos()	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

        -- 대상에게 1스 효과가 적용된 경우 2스 사용
    if	CreatureAI.IsApplyBuffTarget("Effect_MP_Fortress_N_1") == 1 then
					
        SubProcess2()
				
    else
       --아닐 때 1스 사용
	   SubProcess()
	   
    end 
end 


-- 1스 사용
function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget("skill_slot_1", "AtkHighest")
		
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
					
		CreatureAI.SetTarget_ApplyBuff("skill_slot_2", "Effect_MP_Fortress_N_1")
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
	
end
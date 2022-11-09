



function Process() 

pos = CreatureAI.MoveToFrontPos()	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

        -- 대상에게 2스 효과가 적용된 경우 1스 사용
    if	CreatureAI.IsApplyBuffTarget("Effect_MP_ScoutAK_N_2") == 1 then
					
        SubProcess()
				
    else
       --아닐 때 2스 사용
	   SubProcess2()
	   
    end 
end 


-- 1스 사용 (중장우선)
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


--2스 사용 (중장우선)
function SubProcess2()

	if 	count2 > 0 then	
					
		CreatureAI.SetTarget_ActorClass("skill_slot_2", 1)
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
	
end
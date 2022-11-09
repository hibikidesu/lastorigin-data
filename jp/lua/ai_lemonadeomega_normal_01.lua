



function Process() 

pos = CreatureAI.MoveToFrontPos()	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

        
    if  CreatureAI.IsApplyBuff("Effect_MP_LemonadeOmega_N_42") == 1 and count > 2 then
					
		SubProcess()
	
	elseif  CreatureAI.IsLiveOurTeam() == 0 then 
	
		SubProcess()
	
	else
	
		SubProcess2()
	   
 		end
	   
	end 



-- 1스 사용
function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget("skill_slot_1","near")
		
	else
		
		SubProcess2()
		
	end
		
end


-- 2스 사용
function SubProcess2()

	if 	CreatureAI.IsLiveOurTeam() == 1 then
					
		CreatureAI.SetTarget("skill_slot_2","self")
		
	else
		
		if -1 == pos then 
				
			CreatureAI.Wait()
				
		else
				
			CreatureAI.Move(pos)
				
		end
		
    end
	
end

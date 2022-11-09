function Process() 

pos = CreatureAI.MoveToFrontPos()	
count2 = CreatureAI.GetTargetCount("skill_slot_2")

        -- 자신에게 패시브2 효과가 적용된 경우 2스 사용
    if	CreatureAI.IsApplyBuff("Effect_MP_Drone_Challenge2_4") == 1 then
					
        SubProcess2()
				
    else
       --아닐 때 대기
	   CreatureAI.Wait()
	   
    end 
end 


--2스 사용
function SubProcess2()

	if 	count2 > 0 then	
					
		CreatureAI.SetTarget("skill_slot_2", "AtkHighest")
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
	
end
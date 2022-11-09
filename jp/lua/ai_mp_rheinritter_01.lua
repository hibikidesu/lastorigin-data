



function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

        -- 적 중에 기동형이 있을 경우 2스 사용
    if	CreatureAI.IsApplyBuff("Effect_MP_RheinRitter_N_32") == 1 then
					
        SubProcess2()
				
    else
       --아닐 때 1스 사용
	   SubProcess()
	   
    end 
end 



-- 1스 사용 (후열우선)
function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget("skill_slot_1", "backend")
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos3)
				
		end
		
    end
	
end



--2스 사용 (기동우선)
function SubProcess2()

	if 	count2 > 0 then	
					
		CreatureAI.SetTarget_ActorClass("skill_slot_2", 2)
		
	else
		--2스 사거리 안될 땐 1스 사용			
		SubProcess()
				
	end
		
end
	

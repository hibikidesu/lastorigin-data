function Process() 

pos = CreatureAI.MoveToFrontPos()	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")


--체력 100%일 경우 2스 사용 
  if 100 <= CreatureAI.GetHPPer() then	
		
		SubProcess()
	   
		else
		
			--1스 사용 (중장우선)
			if count > 0 then
		
			CreatureAI.SetTarget_ActorClass("skill_slot_1", 1)
		
			else
		
			SubProcess()
		
			end
		
		end
		
	end 



-- 2스 사용
function SubProcess()

	if 	count2 > 0 then	
					
		CreatureAI.SetTarget("skill_slot_2", "ourteam")
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
	
end

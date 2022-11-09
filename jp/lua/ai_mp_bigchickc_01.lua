



function Process() 

pos = CreatureAI.MoveToFrontPos()	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

        -- 체력이 45% 이상일 때 2스 사용
    if 45 <= CreatureAI.GetHPPer() then	
		
		SubProcess2()
	
		
    else
       --아닐 때 1스 사용
	   SubProcess()
	   
	end 

end



-- 1스 사용 (경장>중장우선)
function SubProcess()

	if 	count > 0 then	
					
		if 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 0) then
					return
				elseif 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 1) then
					return
				else
					CreatureAI.SetTarget_Near("skill_slot_1")
				end
		
	else
	
		SubProcess2()
	
		end
		
	end
	

--2스 사용 (중장>경장우선)
function SubProcess2()

	if 	count2 > 0 then	
					
		if 1 == CreatureAI.SetTarget_ActorClass("skill_slot_2", 1) then
					return
				elseif 1 == CreatureAI.SetTarget_ActorClass("skill_slot_2", 0) then
					return
				else
					CreatureAI.SetTarget_Near("skill_slot_2")
				end
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
	
end
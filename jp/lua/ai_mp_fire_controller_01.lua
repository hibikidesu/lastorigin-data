
function Process()

	count1 = CreatureAI.GetTargetCount("skill_slot_1")
	count2 = CreatureAI.GetTargetCount("skill_slot_2")



	
	if 	CreatureAI.IsApplyBuff("Effect_MP_Ship_Controller_B09_5") == 1 then 
		
		SubProcess2()
		
	else
	
		SubProcess1()
	
	end 

end

--1스 사용
function SubProcess1()

	if 1 >= CreatureAI.GetRoundCount() then

	if count1 > 0 then	
		
		CreatureAI.SetTarget("skill_slot_1","self")
		
	
		else
		
		
	CreatureAI.Wait()
	
	end
	
	end
end


--2스 사용
function SubProcess2()

	if 	count2 > 0 then	
		
		--공격력 제일 높은 대상에게 스킬 사용
		CreatureAI.SetTarget("skill_slot_2","self")
		
	else
		
		CreatureAI.wait()
		
    end
	
end
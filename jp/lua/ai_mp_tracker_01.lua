
function Process()

	pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
	pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")		
	count = CreatureAI.GetTargetCount("skill_slot_1")
	count2 = CreatureAI.GetTargetCount("skill_slot_2")
	Skill2 = 0


--현재 상태 체크
	if 	CreatureAI.GetApplyBuffCount("Effect_MP_Tracker_N_5") == 1 or
		CreatureAI.GetApplyBuffCount("Effect_MP_Tracker_N_5") == 2 
		then 

		Skill2 = 0
		SubProcess()
		
	else
	
		if CreatureAI.GetApplyBuffCount("Effect_MP_Tracker_N_5") == 3 or
		CreatureAI.GetApplyBuffCount("Effect_MP_Tracker_N_5") == 4 or
		CreatureAI.GetApplyBuffCount("Effect_MP_Tracker_N_5") == 5
		then 
		
			Skill2 = 1
			SubProcess()
						
		else
		
			if CreatureAI.IsApplyBuff("Effect_MP_Tracker_N_51") == 1 then
			
				Skill2 = 2
				SubProcess()
			
			else
			
				SubProcess3()
			
			end
			
		end		
	
	end
	
end 

--현재 상태에 따라 2스 사용 확률
-- 0일경우 10%
-- 1일경우 20%
-- 2일경우 30%
function SubProcess()

	if Skill2 == 0 and 90 <= CreatureAI.GetRandomValue(100) then
	
		SubProcess2()
			
	else
	
		if Skill2 == 1 and 80 <= CreatureAI.GetRandomValue(100) then
		
			SubProcess2()
		
		else
		
			if Skill2 == 2 and 70 <= CreatureAI.GetRandomValue(100) then
		
				SubProcess2()
		
			else
			
				SubProcess3()
			
			end
			
		end
		
	end	
	
end

--2스 사용
function SubProcess2()

	if 	count2 > 0 then	
					
		CreatureAI.SetTarget("skill_slot_2","HPLow")
		
	else
		
		SubProcess3()
		
    end
	
end

--1스 사용
function SubProcess3()

	if 	count > 0 then	
					
		CreatureAI.SetTarget("skill_slot_1","HPLow")
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
	
end

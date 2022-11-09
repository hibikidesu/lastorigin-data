
function Process()
	
	pos = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
	pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_1")
	count = CreatureAI.GetTargetCount("skill_slot_2")
	count2 = CreatureAI.GetTargetCount("skill_slot_1")
	
	-- 파워부스팅 1,2 단계일 경우 무조건 2스만 사용
	if CreatureAI.IsApplyBuff("Effect_MP_NestGuardian_TU2_4") == 1 or CreatureAI.IsApplyBuff("Effect_MP_NestGuardian_TU2_41") == 1 then			
					
		SubProcess()
		
	else
		
		--파워부스팅 3단계일 경우 60%확률로 2스 사용, 아닐 경우 1스 사용
		if CreatureAI.IsApplyBuff("Effect_MP_NestGuardian_TU2_42") == 1 and 40 <= CreatureAI.GetRandomValue(100) then
		
			SubProcess()
			
		else
		
			SubProcess2()
			
		end	
		
	end
		
end

--기본적으로 2스를 사용하되 폭주 상태일 시 1스 사용
function SubProcess()

	if 	count > 0 then	
					
		if CreatureAI.IsApplyBuff("Effect_MP_NestGuardian_TU2_52") == 0 then
		
		CreatureAI.SetTarget("skill_slot_2","ourteam")
		
		else
		
		SubProcess2()
		
		end
				
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
end

--1스 사용 
function SubProcess2()

		if count2 > 0 then
			
			CreatureAI.SetTarget("skill_slot_1","AtkHighest")
			
		else
			
			if -1 == pos2 then 
				
			CreatureAI.Wait()
				
			else
				
			CreatureAI.Move(pos2)
				
			end
											
		end
end
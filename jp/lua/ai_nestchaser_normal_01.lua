
function Process()
	
	pos = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
	pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
	count = CreatureAI.GetTargetCount("skill_slot_2")
	count2 = CreatureAI.GetTargetCount("skill_slot_1")
	
	-- 파워부스팅 1단계 상황 시 30% 확률로 2스 사용
	if CreatureAI.IsApplyBuff("Effect_MP_NestChaser_N_4") == 1 and 70 <= CreatureAI.GetRandomValue(100) then			
					
		SubProcess()
		
	else
		
		-- 파워부스팅 2단계 상황 시 45% 확률로 2스 사용
		if CreatureAI.IsApplyBuff("Effect_MP_NestChaser_N_41") == 1 and 55 <= CreatureAI.GetRandomValue(100) then
		
			SubProcess()
			
		else
			
			-- 파워부스팅 3단계 상황 시 55% 확률로 2스 사용
			if CreatureAI.IsApplyBuff("Effect_MP_NestChaser_N_42") == 1 and 45 <= CreatureAI.GetRandomValue(100) then
			
				SubProcess()
				
			else	
			
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
			
		end	
		
	end
		
end

function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget_Near("skill_slot_2")
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
end
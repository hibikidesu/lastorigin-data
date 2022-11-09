
function Process()
	
	pos = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
	pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_1")
	pos3 = CreatureAI.GetGridPos()	
	count = CreatureAI.GetTargetCount("skill_slot_2")
	count2 = CreatureAI.GetTargetCount("skill_slot_1")
		
		
	if 3 == pos3 or 4 == pos3  then	
			
	-- 2스 봉인일 경우 1스 사용
		if CreatureAI.IsApplyBuff("Effect_MP_Nest_TU2_5") == 1 then

			SubProcess2()
			
		else
			
			-- 2스 봉인이 아닌 상황, 파워부스팅 1단계 상황, 60% 확률로 2스 사용
			if CreatureAI.IsApplyBuff("Effect_MP_Nest_TU2_33") == 1   and 40 <= CreatureAI.GetRandomValue(100) then			
							
				SubProcess()
				
			else
				-- 2스 봉인이 아닌 상황, 파워부스팅 2단계 상황, 30% 확률로 2스 사용
				if CreatureAI.IsApplyBuff("Effect_MP_Nest_TU2_34") == 1 and 70 <= CreatureAI.GetRandomValue(100) then
				
					SubProcess()
					
				else
					-- 2스 봉인이 아닌 상황, 파워부스팅 3단계 상황, 20% 확률로 2스 사용
					if CreatureAI.IsApplyBuff("Effect_MP_Nest_TU2_35") == 1 and 80 <= CreatureAI.GetRandomValue(100) then
					
					SubProcess()
					
					else
										
					SubProcess2()
					
					end
					
				end	
				
			end
					
		end
		
	else
	
		SubProcess3()
		
	end

end


-- 2스 사용 
function SubProcess()

	if 	count > 0  then	
							
		CreatureAI.SetTarget_Near("skill_slot_2")
						
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
	
end

-- 1스 사용
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


-- 3,4 위치가 아닐경우 70% 확률로 앞으로 당김
function SubProcess3()

	if 30 <= CreatureAI.GetRandomValue(100) then
					
		pos3 = 4
		CreatureAI.Move(pos3)
					
	else
					
		SubProcess()		
													
	end

end











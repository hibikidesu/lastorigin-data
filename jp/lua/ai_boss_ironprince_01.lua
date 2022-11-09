


function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")
Target = 0


    -- 2스 준비 완료 상태일 시 2스 사용
	if CreatureAI.IsApplyBuff("Effect_MP_IronPrince_N_4") == 1 then
						
		SubProcess2()
										
	else
       					
		SubProcess()
				   
	end 
		
end 


function SubProcess()

	if 	count > 0 then	
	
							
		CreatureAI.SetTarget("skill_slot_1","HPHighest")
		
		
		
	else
								
		CreatureAI.Wait()
						
    end
end

-- 2스 사용
function SubProcess2()

	if 	count2 > 0 then	
					
		CreatureAI.SetTarget("skill_slot_2", "HPHighest")
		
	else
								
		SubProcess()
						
    end
	
end


-- 1스 사용 / 현재 라운드에 따라 방어력 제일 높은 거, 체력 제일 높은거 우선순위 변환
--function SubProcess()

--	if 	count > 0 then	
	
--		Target = CreatureAI.GetRoundCount()
		
--		if 1 == Target % 2 then
					
--		CreatureAI.SetTarget("skill_slot_1","DefenseHighest")
		
--		else
		
--		CreatureAI.SetTarget("skill_slot_1","HPHighest")
		
--		end
		
--	else
								
--		CreatureAI.Wait()
						
--    end
--end


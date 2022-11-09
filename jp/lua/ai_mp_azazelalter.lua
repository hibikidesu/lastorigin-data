
function Process()

	count1 = CreatureAI.GetTargetCount("skill_slot_1")
	count2 = CreatureAI.GetTargetCount("skill_slot_2")



	--바벨 에너지 충전 완료 시 2스 사용 아닐 시 1스 사용
	if 	CreatureAI.IsApplyBuff("Effect_MP_AzazelAlter_N_51") == 1 then 
		
		SubProcess2()
		
	else
	
		SubProcess1()
	
	end 

end

--1스 사용
function SubProcess1()

	if count1 > 0 then	
		
		CreatureAI.SetTarget("skill_slot_1","random")
		
		--if 50 <= CreatureAI.GetHPPer() then
		
		--방어력 제일 낮은 대상에게 스킬 사용
		--CreatureAI.SetTarget("skill_slot_1","APHighest")
			
		else
		
			--if 30 <= CreatureAI.GetHPPer() < 50 then
			
			--공격력 제일 높은 대상에게 스킬 사용
			--CreatureAI.SetTarget("skill_slot_1","APHighest")
		
			--else
			
			--체력이 제일 낮은 대상에게 스킬 사용
			--CreatureAI.SetTarget("skill_slot_1","HPLow")
		
			--end
			
		--end
		
	CreatureAI.Wait()
	
	end
	
end


--2스 사용
function SubProcess2()

	if 	count2 > 0 then	
		
		--공격력 제일 높은 대상에게 스킬 사용
		CreatureAI.SetTarget("skill_slot_2","random")
		
	else
		
		CreatureAI.wait()
		
    end
	
end
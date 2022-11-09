function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")


		-- 정찰형 인터셉터 연계 : 표식 확인
    if	CreatureAI.IsApplyBuffTarget("Effect_MP_IntercepterARS_N_3") == 1 then	
	
		-- 해당 적에게 2스 사용
        CreatureAI.SetTarget_ApplyBuff("skill_slot_2", "Effect_MP_IntercepterARS_N_3")
	
    else
       
			-- 1스 사거리 확인
		if count > 0 then  
		
				-- 적 캐릭터가 2명 이상 배치된 행 중 가장 가까운 열 대상 2스
			if CreatureAI.SetTarget_RowInCnt_By_Near("skill_slot_2", 2) == 1 then 
				return 
				
			else 
				-- 가까운 대상 1스
				CreatureAI.SetTarget_Near("skill_slot_1") 
				
			end 
			
		else
			-- 그 외에는 대기
			CreatureAI.Wait()
			
		end 
	   
    end 
	
end 


	

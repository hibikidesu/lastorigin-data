function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")

		-- 적 처치 스택 확인
	if  CreatureAI.GetApplyBuffCount("Effect_BR_Vargr_Rage_TU_45") == 1 then
		
		-- 가까운 대상 2스
		CreatureAI.SetTarget_Near("skill_slot_2")

    else
	
			-- 장화 or 천아 버프 체크
		if 	CreatureAI.IsApplyBuffTarget("Effect_BR_JangHwa_N_3") == 1 or CreatureAI.IsApplyBuffTarget("Effect_BR_Cheona_N_3") == 1 then	
	
			-- 장화 천아 감지 시 1번 루틴
			SubProcess()

		else
			-- 그외에는 2번 루틴
			SubProcess2()
	   
		end 
	   
    end 
	
end


-- 장화 천아 루틴
function SubProcess()

	-- 1스 사거리 확인
	if  count == 0 then	
	
	-- 안닿으면 가까운 대상 2스
		CreatureAI.SetTarget_Near("skill_slot_2")
		
	else

		-- 장화 확인
		if CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_BR_JangHwa_N_3") == 1 then        
			return 
		
		-- 천아 확인
		elseif CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_BR_Cheona_N_3") == 1 then       
			return 
		
		-- 그 외에는 무작위 가까운 대상
		elseif CreatureAI.SetTarget_Near("skill_slot_1") == 1 then 
			return 
		
		end
	
	end 	
	
end

-- 2번 루틴
function SubProcess2()

		-- 1스 사거리 확인
	if  count == 0 then	
	
		-- 안닿으면 가까운 대상 2스
		CreatureAI.SetTarget_Near("skill_slot_2")
		
	else

			-- 공격 받은 기록 확인
		if 	CreatureAI.IsAttacked() == 1 then	
	
			-- 자신을 마지막으로 공격한 대상 우선 타격
			target_aid = CreatureAI.GetLastAttackEnemyAID()
			CreatureAI.SetTarget_ActorID("skill_slot_1", target_aid)
		
		else
			-- 그 외에는 가까운 대상 타격
			CreatureAI.SetTarget_Near("skill_slot_1")
		
		end
		
	end	
	
end
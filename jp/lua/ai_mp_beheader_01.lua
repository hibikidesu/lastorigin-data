function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
pos3 = CreatureAI.MoveToFrontPos()
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")


		-- 패3 스택 누적 확인
	if  CreatureAI.GetApplyBuffCount("Effect_MP_Executioner_EW2_31") == 10 then
		
		-- 2스 방어력 가장 높은 대상 타격
		CreatureAI.SetTarget("skill_slot_2","DefenseHighest")

    else
        -- 1스 루틴
	    SubProcess()
	   
    end 
end 

-- 1스 루틴
function SubProcess()

		-- 공격 받은 기록 확인
	if 	CreatureAI.IsAttacked() == 1 then	
	
		-- 자신을 마지막으로 공격한 대상 우선 타격
		target_aid = CreatureAI.GetLastAttackEnemyAID()
		CreatureAI.SetTarget_ActorID("skill_slot_1", target_aid)
		
	else
		-- 그 외에는 공격력이 가장 높은 대상 타격
		CreatureAI.SetTarget("skill_slot_1","AtkHighest")
		
    end
	
end
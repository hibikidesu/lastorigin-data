


function Process() 
    -- 자신이 행동을 이미 하였고, 공격 받은 기록이 있을 경우 자신을 마지막에 공격한 대상에게 스킬 2번을 사용한다. 
    
    if 1 == CreatureAI.IsAction() and 1 == CreatureAI.IsAttacked() and CreatureAI.IsApplyBuffTarget("Effect_MP_Centurion_N_2") ~= 1 then 
        target_aid = CreatureAI.GetLastAttackEnemyAID()

        -- 공격가능한 대상인지 검사 
        if CreatureAI.IsCreatureAI.SetTarget_ActorID("skill_slot_2", target_aid) == 1 then 

            -- 스킬 2번으로 공격한다. 
            CreatureAI.SetTarget_ActorID("skill_slot_2", target_aid)
            return 
        end
    end 

    -- 1 번 스킬의 사정거리에 있는지 검사해서 랜덤 대상으로 스킬 1번을 사용한다. 
    count = CreatureAI.GetTargetCount("skill_slot_1")
    if count > 0 then 
        CreatureAI.SetTarget("skill_slot_1", "random")
        return 
    end 

    -- 적이 모든 스킬의 사정거리 바같에 존재하면 이동하고, 아니면 대기 
    pos = CreatureAI.MoveToUseSkillPos("skill_slot_2")
    if -1 == pos then 
        pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")
        if -1 == pos2 then 
            CreatureAI.Wait()
        else 
            CreatureAI.Move(pos2)
        end 
    else 
        CreatureAI.Move(pos)
    end 


end 



function Process() 


    -- Effect_MP_Legion_N_2 버프 이펙트에 걸린 적 개체가 없음
    if CreatureAI.IsApplyBuffTarget("Effect_MP_Legion_N_2") ~= 1 and CreatureAI.GetRandomValue(100) <= 50 then 

        count = CreatureAI.GetTargetCount("skill_slot_2")
        if count ~= 0 then 

            -- Effect_MP_Centurion_N_2 버프 이펙트에 걸린 대상이 있으면 해당 대상에게 스킬 2번 사용 
            if CreatureAI.IsApplyBuffTarget("Effect_MP_Centurion_N_2") == 1 then     
                CreatureAI.SetTarget_ApplyBuff("skill_slot_2", "Effect_MP_Centurion_N_2")
                return 
            else 
                -- Effect_MP_Legion_N_2 버프 이펙트에 걸린 개체가 없으면 스킬2번을 선택해서 actor class가 2인 대상에게 공격 , 2인 대상이 없으면 랜덤
                CreatureAI.SetTarget_ActorClass("skill_slot_2", 2)
                return 
            end 
        end 
    end 

    -- Effect_MP_Legion_N_2 버프 이펙트에 걸린 적 개체가 있거나, 위의 로직에서 선택되지 않은 경우 


    -- 적이 1번 스킬의 사정거리에 있는 지 존재 
    count = CreatureAI.GetTargetCount("skill_slot_1")
    if count ~= 0 and CreatureAI.GetRandomValue(100) <= 90 then 

        -- Effect_MP_Centurion_N_2 버프 이펙트에 걸린 대상에게 스킬 1번 사용 
        if CreatureAI.IsApplyBuffTarget("Effect_MP_Centurion_N_2") == 1 then  
            CreatureAI.SetTarget_ApplyBuff("skill_slot_1", "Effect_MP_Centurion_N_2")
            return 
        else 

            -- ACTOR_CLASS가 2인 대상 ACTOR_CLASS가 2인 대상이 없는 경우, 랜덤 대상
            CreatureAI.SetTarget_ActorClass("skill_slot_1", 2)
            return 
        end    
    end 

    count = CreatureAI.GetTargetCount("skill_slot_2")
    if count ~= 0 then 
        if CreatureAI.IsApplyBuffTarget("Effect_MP_Centurion_N_2") == 1 and  CreatureAI.IsApplyBuffTarget("Effect_MP_Legion_N_2") == 0 then
            CreatureAI.SetTarget_ApplyBuff("skill_slot_2", "Effect_MP_Centurion_N_2")
            return 
        elseif CreatureAI.IsApplyBuffTarget("Effect_MP_Centurion_N_2") == 0 and CreatureAI.IsApplyBuffTarget("Effect_MP_Legion_N_2") == 0 then 
            CreatureAI.SetTarget_ActorClass("skill_slot_2", 2)
            return
        elseif CreatureAI.IsApplyBuffTarget("Effect_MP_Legion_N_2") == 0 then 
            CreatureAI.SetTarget("skill_slot_2", "random")
            return
        end 
    end 

    -- 이도 저도 아니면 이동 또는 대기 
    pos = CreatureAI.MoveToUseSkillPos("skill_slot_2")
    if -1 == pos then 
        pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_1")
        if -1 == pos2 then 
            CreatureAI.Wait()
        else 
            CreatureAI.Move(pos)
        end 
    else 
        CreatureAI.Move(pos)
    end 
    
end 
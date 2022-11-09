



function Process()

    -- 자신의 HP가 80% 이하 + 자신에게 Effect_MP_Typhoon_B0308_4  또는 Effect_MP_Typhoon_B0308_5 버프 이펙트가  걸려있음
    if CreatureAI.GetHPPer() <= 100 and CreatureAI.IsApplyBuff("Effect_MP_Executioner_TU2_3") == 1 then

        -- ACTOR_CLASS가 2인 대상 중 자신과 가장 가까운 열의 대상으로 한다. 
        if 1 == CreatureAI.SetTarget_ActorClass("skill_slot_2", 0) then
            -- 조건에 맞는 대상을 찾은 경우 
            return 
        else  
            if 1 == CreatureAI.SetTarget_ActorClass("skill_slot_2", 1) then 
                -- 조건에 맞는 대상을 찾은 경우 
                return 
            else
                CreatureAI.SetTarget_Near("skill_slot_2")
                return 
            end 
        end 
    end 

    -- 적이 1번 스킬의 사정 거리에 존재 + 적 캐릭터가 두 명 이상(두명포함) 배치된 행이 있음
    count = CreatureAI.GetTargetCount("skill_slot_1") 
    if count > 0  then 
        -- 적 캐릭터가 두 명 이상 배치된 행 중, 캐릭터의 ACTOR_CLASS가 2인 대상 중 자신과 가장 가까운 열의 대상

        if 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 2) then 
            -- 조건에 맞는 대상을 찾은 경우 
            return 
        elseif 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 1) then 
            -- 조건에 맞는 대상을 찾은 경우 
            return 
        elseif 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 0) then -- 적 캐릭터가 두명 이상 배치된 행중 가장 가까운 열의 대상 
            -- 조건에 맞는 대상을 찾은 경우 
            return 
        elseif 1 == CreatureAI.SetTarget_Near("skill_slot_1") then -- 가장 가까운 녀석을 공격 
            return 
        end 
    end 

    pos = CreatureAI.MoveToUseSkillPos("skill_slot_2")
    if -1 == pos then 
        pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_1")
        if -1 == pos2 then 
            CreatureAI.Wait()
        else 
            CreatureAI.Wait()
        end 
    else 
        CreatureAI.Wait()
    end 
end 
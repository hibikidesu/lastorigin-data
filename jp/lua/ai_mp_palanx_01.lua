



function Process() 

        
    if CreatureAI.GetHPPer() >= 25 and CreatureAI.IsApplyBuff("Effect_MP_Phalangites_N_2") ~= 1 then 
        -- 2 번 스킬의 사정거리에 있는지 검사해서 랜덤 대상으로 스킬 2번을 사용한다. 
        CreatureAI.SetTarget("skill_slot_2", "random")
    else
       
        -- 적이 모든 스킬의 사정거리 바같에 존재하면 이동하고, 아니면 대기 
        count = CreatureAI.GetTargetCount("skill_slot_1")
        if count ~= 0 then 
            CreatureAI.SetTarget_ActorClass("skill_slot_1", 2)
        else 
            pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")
            if -1 == pos then 
                CreatureAI.Wait()
            else 
                CreatureAI.Move(pos)
            end 
        end 
    end 
end 
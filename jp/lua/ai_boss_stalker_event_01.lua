


-- normal state 
function Process()
    
    -- 보스 스킬을 차치스킬이라는 특수성 때문에 한라운드에 여러번 공격못하도록 막는다. 
    if CreatureAI.GetReserveSkillCount() > 0 then 
        return 
    end 

    if CreatureAI.IsCriNextAttack() == 1 then 
        -- 스킬 1번을 사용 ( 평타스킬로 설정 되어 있음 )
        CreatureAI.SetTarget("skill_slot_1", "backend")
    else
        -- 무조건 스킬 2번을 사용한다. ( 차지스킬로 설정되어 있음 )
        CreatureAI.SetTarget("skill_slot_2", "self")
    end 

end 


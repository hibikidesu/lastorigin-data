


function Process() 

        
    if 1 == CreatureAI.IsLiveOurTeam()  then
	
        CreatureAI.SetTarget_Near("skill_slot_1")
    else
       -- 타겟이 존재하는 한 계속 1번 스킬만 쓰게       
	   CreatureAI.SetTarget("skill_slot_2", "random")
	   		
    end
end

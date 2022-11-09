
function Process()

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")
now_pos = CreatureAI.GetGridPos()

	-- 1. 자신이 전열에 위치 2. Effect_NightChickQMSK_N_4 버프가 있을 경우 3. 아군이 없을 경우1스 사용
	if 0 == now_pos % 3  or CreatureAI.IsApplyBuff("Effect_MP_NightChickQMSK_N_4") == 1 or CreatureAI.IsLiveOurTeam == 0 then	
		
	   SubProcess()
	   
		else
		--2스 사용
		CreatureAI.SetTarget("skill_slot_2", "self")
		
		end
		
	end 

-- 1스 사용
function SubProcess()

	if 	count > 0 then	
					
		CreatureAI.SetTarget_ActorClass("skill_slot_1", 0)
		
	else
		
		if -1 == pos then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos)
				
		end
		
    end
	
end


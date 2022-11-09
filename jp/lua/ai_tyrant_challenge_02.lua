

function Process() 

pos = CreatureAI.MoveToUseSkillPos("skill_slot_1")	
pos2 = CreatureAI.MoveToUseSkillPos("skill_slot_2")	
count = CreatureAI.GetTargetCount("skill_slot_1")
count2 = CreatureAI.GetTargetCount("skill_slot_2")
Target = 0
    
	-- 중장형 타겟
    if CreatureAI.IsApplyBuff("Effect_MP_Tyrant_Challenge1_3") == 1 or CreatureAI.IsApplyBuff("Effect_MP_Tyrant_Challenge1_33") == 1 then
					
       Target = 1
	   
	   if CreatureAI.IsApplyBuff("Effect_MP_Tyrant_Challenge1_15") == 1 then
	   
		SubProcess2()
		
		else
		
		
		SubProcess()
		
		
		
		end
		
	else
       
	   --경장형 타겟
	   if CreatureAI.IsApplyBuff("Effect_MP_Tyrant_Challenge1_31") == 1 or CreatureAI.IsApplyBuff("Effect_MP_Tyrant_Challenge1_34") == 1 then
		
	   Target = 2
	   
			if CreatureAI.IsApplyBuff("Effect_MP_Tyrant_Challenge1_15") == 1 then
		
			SubProcess2()
		
			else
		
			
		SubProcess()
		
		
		
			end
	  	   
	   else
		
			--기동형 타겟
			if CreatureAI.IsApplyBuff("Effect_MP_Tyrant_Challenge1_32") == 1 or CreatureAI.IsApplyBuff("Effect_MP_Tyrant_Challenge1_35") == 1 then
		
			Target = 3
			
				if CreatureAI.IsApplyBuff("Effect_MP_Tyrant_Challenge1_15") == 1 then
			
				SubProcess2()
			
				else
			
				
		
		SubProcess()
		
		
			
				end
		
			else
		
			Target = 0
			
				if CreatureAI.IsApplyBuff("Effect_MP_Tyrant_Challenge1_15") == 1 then
			
				SubProcess2()
			
				else
			
				
		
		SubProcess()
		
		
			
				end
				
			end
			
		end
		
	end	
		
end 


-- 1스 사용
function SubProcess()

	if 	count > 0 then	
		
		--중장형
		if Target == 1 then
		
		CreatureAI.SetTarget_ActorClass("skill_slot_1", 1)
		
		else
		
			--경장형
			if Target == 2 then
			
			CreatureAI.SetTarget_ActorClass("skill_slot_1", 0)
			
			else
			
				--기동형
				if Target == 3 then
				
				CreatureAI.SetTarget_ActorClass("skill_slot_1", 2)
				
				else
				
				--없을 시 랜덤
				CreatureAI.SetTarget("skill_slot_1","near")
			
				end
				
			end
		
		end
		
	else
		
		SubProcess2()
		
    end
	
end

-- 2스 사용
function SubProcess2()

	if 	count2 > 0 then	
		
		--중장형
		if Target == 1 then
		
		CreatureAI.SetTarget_ActorClass("skill_slot_2", 1)
		
		else
		
			--경장형
			if Target == 2 then
			
			CreatureAI.SetTarget_ActorClass("skill_slot_2", 0)
			
			else
			
				--기동형
				if Target == 3 then
				
				CreatureAI.SetTarget_ActorClass("skill_slot_2", 2)
				
				else
				
				--없을 시 랜덤
				CreatureAI.SetTarget("skill_slot_2","near")
			
				end
				
			end
		
		end
		
	else
		
		if pos2 == -1 then 
				
		CreatureAI.Wait()
				
		else
				
		CreatureAI.Move(pos2)
				
		end
		
    end
	
end
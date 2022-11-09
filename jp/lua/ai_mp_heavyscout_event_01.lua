


-- 서버에서 스킬 선택 시 호출되는 함수  
function Process()
	
	-- 아군이 살아있을 경우
	if CreatureAI.IsLiveOurTeam() == 1 then	
		-- 자신에게 "Effect_MP_HeavyScout_N_2" 버프가 걸려있지 않을 경우 스킬2 사용
		if 1 == CreatureAI.IsApplyBuff("Effect_MP_HeavyScout_N_2") then 
			CreatureAI.SetTarget("skill_slot_2", "self")
		else
			-- 자신에게 버프가 걸려있을 경우 대기
			CreatureAI.Wait()
		end
	else
		-- 혼자 살아있을 경우 스킬1 사용 여부 확인
		count = CreatureAI.GetTargetCount("skill_slot_1")
		if 0 < count then
			-- 중장 >> 경장 >> 가까운 순으로 공격
			if 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 1) then
				return
			elseif 1 == CreatureAI.SetTarget_ActorClass_By_Near("skill_slot_1", 0) then
				return
			else
				CreatureAI.SetTarget_Near("skill_slot_1")
			end
		else
			-- 스킬1 사용 불가능할 경우 대기
			CreatureAI.Wait()
		end
	end
end
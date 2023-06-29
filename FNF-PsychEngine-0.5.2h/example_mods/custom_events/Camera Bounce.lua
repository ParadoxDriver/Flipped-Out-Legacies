function onCreate()
local enabled = false
end

function onEvent(n,v1,v2)
	if v1 == 'true' then
		enabled = true
	elseif v1 == 'false' then
		enabled = false
	end
end

local angleshit = 0;
local anglevar = 0;

function onBeatHit()
	if enabled == true then
			if curBeat % 2 == 0 then
				angleshit = anglevar;
			else
				angleshit = -anglevar;
		end
			setProperty('camHUD.angle',angleshit*3)
			setProperty('camGame.angle',angleshit*3)
			doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
			doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
			doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
			doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
		else
			setProperty('camHUD.angle',0)
			setProperty('camHUD.x',0)
			setProperty('camHUD.x',0)
		end
	if enabled == false then
		--debugPrint('no enableado')
	end
end

function onStepHit()
	if enabled == true then
		if curBeat < 9000 then
			if curStep % 4 == 0 then
				doTweenY('rrr', 'camHUD', -12, stepCrochet*0.002, 'circOut')
				doTweenY('rtr', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
			end
			if curStep % 4 == 2 then
				doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
				doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
			end
		end
	elseif enabled == false then
                  setProperty('camHUD.y',0)
		  setProperty('camGame.scroll.y',0)
		--debugPrint('no enableado')
	end
end
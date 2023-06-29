function onEvent(name, value1, value2)
	if name == 'Bopping HUD' then

		v1 = value1
		v2 = value2
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		setProperty('camHUD.angle', v1*5)
		doTweenAngle('hudTween', 'camHUD', 0, 0.8, 'backOut')
                setProperty('camHUD.angle', v2*0)
	else
		setProperty('camHUD.angle', v1*-4)
		doTweenAngle('hudTween', 'camHUD', 0, 0.8, 'backOut')
                setProperty('camHUD.angle', v2*-0)
	end
end
IntroTextSize = 19
IntroSubTextSize = 27
IntroTagColor = '8CA77F'
IntroTagWidth = 15

function onCreate()
	makeLuaSprite('JukeBox', 'empty', -550-IntroTagWidth, 140)
	makeGraphic('JukeBox', 470, 105, '000000')
	setProperty('JukeBox.alpha', 0.6)
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)
	
	makeLuaText('JukeBoxText', 'SHOCK-SHANKED - [MASHUP]', 500, -550-IntroTagWidth, 160)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroSubTextSize)
        setTextColor('JukeBoxText', '8CA77F')
	addLuaText('JukeBoxText', true)
	
	makeLuaText('JukeBoxText2', 'MASHUP BY SERAS VICTORIA', 500, -550-IntroTagWidth, 200)
	setTextAlignment('JukeBoxText2', 'left')
	setObjectCamera('JukeBoxText2', 'other')
	setTextSize('JukeBoxText2', IntroSubTextSize)
        setTextColor('JukeBoxText2', '8CA77F')
	addLuaText('JukeBoxText2', true)
end

function onCountdownTick(swagCounter)
if swagCounter == 1 then
	doTweenX('MoveInOne', 'JukeBox', 0, 0.9, 'expoInOut')
	doTweenX('MoveInThree', 'JukeBoxText', 10, 0.9, 'expoInOut')
	doTweenX('MoveInFour', 'JukeBoxText2', 10, 0.9, 'expoInOut')
	
	runTimer('JukeBoxWait', 3, 1)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutOne', 'JukeBox', -520, 0.5, 'expoInOut')
		doTweenX('MoveOutTwo', 'JukeBoxText', -520, 0.5, 'expoInOut')
		doTweenX('MoveOutThree', 'JukeBoxText2', -450, 0.5, 'expoInOut')

	end
end
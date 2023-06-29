IntroTextSize = 20
IntroSubTextSize = 20
IntroTagColor = 'E80A0A'
IntroTagWidth = 15
Name = 'Massacre'
author = 'The Blaster'

function onCreate()
	makeLuaSprite('JukeBox', 'empty', -425-IntroTagWidth, 35)
	makeGraphic('JukeBox', 420, 130, '000000')
	setProperty('JukeBox.alpha', 0.6)
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)

        makeLuaSprite('JukeBoxTag', 'empty', -300-IntroTagWidth, 35)
	makeGraphic('JukeBoxTag', 15+IntroTagWidth, 130, IntroTagColor)
	setObjectCamera('JukeBoxTag', 'other')
	setProperty('JukeBoxTag.alpha', 0)
	addLuaSprite('JukeBoxTag', true)
	
	makeLuaText('JukeBoxText', 'Now Playing:', 300, -305-IntroTagWidth, 40)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
        setTextColor('JukeBoxText', 'E80A0A')
	addLuaText('JukeBoxText', true)
	
	makeLuaText('JukeBoxSubText', Name, 300, -305-IntroTagWidth, 40)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
        setTextColor('JukeBoxSubText', 'E80A0A')
	addLuaText('JukeBoxSubText', true)
	
	makeLuaText('JukeBoxText2', 'Mashup:', 300, -305-IntroTagWidth, 70)
	setTextAlignment('JukeBoxText2', 'left')
	setObjectCamera('JukeBoxText2', 'other')
	setTextSize('JukeBoxText2', IntroTextSize)
        setTextColor('JukeBoxText2', 'E80A0A')
	addLuaText('JukeBoxText2', true)
	
	makeLuaText('JukeBoxSubText2', author, 300, -305-IntroTagWidth, 70)
	setTextAlignment('JukeBoxSubText2', 'left')
	setObjectCamera('JukeBoxSubText2', 'other')
	setTextSize('JukeBoxSubText2', IntroSubTextSize)
        setTextColor('JukeBoxSubText2', 'E80A0A')
	addLuaText('JukeBoxSubText2', true)
	
	makeLuaText('JukeBoxText3', 'Original Song [kapow]:', 300, -305-IntroTagWidth, 100)
	setTextAlignment('JukeBoxText3', 'left')
	setObjectCamera('JukeBoxText3', 'other')
	setTextSize('JukeBoxText3', IntroTextSize)
        setTextColor('JukeBoxText3', 'E80A0A')
	addLuaText('JukeBoxText3')

        makeLuaText('JukeBoxSubText3', 'Seberster', 300, -305-IntroTagWidth, 100)
	setTextAlignment('JukeBoxSubText3', 'left')
	setObjectCamera('JukeBoxSubText3', 'other')
	setTextSize('JukeBoxSubText3', IntroSubTextSize)
        setTextColor('JukeBoxSubText3', 'E80A0A')
	addLuaText('JukeBoxSubText3', true)

        makeLuaText('JukeBoxText4', 'Original Song [Defeat]:', 300, -305-IntroTagWidth, 130)
	setTextAlignment('JukeBoxText4', 'left')
	setObjectCamera('JukeBoxText4', 'other')
	setTextSize('JukeBoxText4', IntroTextSize)
        setTextColor('JukeBoxText4', 'E80A0A')
	addLuaText('JukeBoxText4')

        makeLuaText('JukeBoxSubText4', 'Rareblin', 300, -305-IntroTagWidth, 130)
	setTextAlignment('JukeBoxSubText4', 'left')
	setObjectCamera('JukeBoxSubText4', 'other')
	setTextSize('JukeBoxSubText4', IntroSubTextSize)
        setTextColor('JukeBoxSubText4', 'E80A0A')
	addLuaText('JukeBoxSubText4', true)
end

function onSongStart()
	doTweenX('MoveInOne', 'JukeBoxTag', 390, 1, 'expoInOut')
	doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'expoInOut')
	doTweenX('MoveInThree', 'JukeBoxText', 10, 1, 'expoInOut')
	doTweenX('MoveInFour', 'JukeBoxSubText', 160, 1, 'expoInOut')
	doTweenX('MoveInFive', 'JukeBoxText2', 10, 1, 'expoInOut')
	doTweenX('MoveInSix', 'JukeBoxSubText2', 100, 1, 'expoInOut')
	doTweenX('MoveInSeven', 'JukeBoxText3', 10, 1, 'expoInOut')
	doTweenX('MoveInEight', 'JukeBoxSubText3', 280, 1, 'expoInOut')
        doTweenX('MoveInNine', 'JukeBoxText4', 10, 1, 'expoInOut')
	doTweenX('MoveInTen', 'JukeBoxSubText4', 295, 1, 'expoInOut')
	
	runTimer('JukeBoxWait', 2.5, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutOne', 'JukeBoxTag', -520, 1.5, 'expoInOut')
		doTweenX('MoveOutTwo', 'JukeBox', -520, 1.5, 'expoInOut')
		doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.5, 'expoInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'expoInOut')
		doTweenX('MoveOutFive', 'JukeBoxText2', -450, 1.5, 'expoInOut')
		doTweenX('MoveOutSix', 'JukeBoxSubText2', -450, 1.5, 'expoInOut')
		doTweenX('MoveInSeven', 'JukeBoxText3', -450, 1.5, 'expoInOut')
		doTweenX('MoveInEight', 'JukeBoxSubText3', -450, 1.5, 'expoInOut')
                doTweenX('MoveInNine', 'JukeBoxText4', -450, 1.5, 'expoInOut')
		doTweenX('MoveInTen', 'JukeBoxSubText4', -450, 1.5, 'expoInOut')
	end
end
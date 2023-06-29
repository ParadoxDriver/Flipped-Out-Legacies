function onCreatePost()
	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Time Left')

        setProperty('timeBarBG.visible', false);
	setProperty('timeBar.visible', false);
	setProperty('timeTxt.visible', false);

        makeLuaSprite('newTimeBar', 'TimeBar-Skins/timeBarAlt', 100, getProperty('timeBarBG.y'));
	setObjectCamera('newTimeBar', 'hud');
	scaleObject('newTimeBar', 1.08, 1);
	addLuaSprite('newTimeBar', true);
		
	makeLuaSprite('greenBar', nil, 102, getProperty('timeBarBG.y')+4.5);
	makeGraphic('greenBar', 425, 10, 'E80A0A');
	setObjectCamera('greenBar', 'hud');
	addLuaSprite('greenBar', true);

	makeLuaText("nametext", songName, 600, 108, getProperty('timeTxt.y') + 6);
	setTextSize('nametext', 15);
	addLuaText("nametext");
	setTextAlignment('nametext', 'left');
        setTextColor('nametext', 'E80A0A');
	setTextFont('nametext', 'vrc.ttf');
	setProperty('nametext.visible', true);

end

function onUpdate()

        setProperty('greenBar.scale.x', getProperty("songPercent"))
    	setProperty('greenBar.x', 0 - 108.5 + (getProperty("songPercent") * 210))
end

function onCountdownStarted()

        setTextString('botplayTxt', 'Be_Impostor.exe');
end

function onStepHit()
        if curStep == 256 then

       setProperty('camGame.visible', false);
end

       if curStep == 272 then

       setProperty('camGame.visible', true);
end

       if curStep == 1424 then
 
       setProperty('camGame.visible', false);
end

       if curStep == 1440 then

       setProperty('camGame.visible', true);
end

       if curStep == 1760 then

       setProperty('defaultCamZoom', 0.70);
end

       if curStep == 1824 then

        setProperty('defaultCamZoom', 0.80);
end

       if curStep == 1888 then

        setProperty('defaultCamZoom', 0.86);
end

       if curStep == 1953 then

       setProperty('camGame.visible', false);
       setProperty('camHUD.visible', false);
end
end

function opponentNoteHit()
 health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end
end

function onEndSong()
       setPropertyFromClass('ClientPrefs', 'timeBarType', 'Time Elapsed')
end
--codigo hecho por v.nitro
--codigo modificado por paradox

local val = 60
local tag = {'notesLeft1', 'notesDown1', 'notesUp1', 'notesRight1', 'notesLeft2', 'notesDown2', 'notesUp2', 'notesRight2'}

function onCreate()
--background epilepsy
	makeLuaSprite('blackBGalt', '', -750, -300);
	makeGraphic('blackBGalt', 3840, 2160, '000000');
	addLuaSprite('blackBGalt', false);
	setProperty('blackBGalt.alpha', 0);
        screenCenter('blackBGalt', 'xy');

        makeLuaSprite('whitebg', '', 0, 0);
	setScrollFactor('whitebg', 0, 0);
	makeGraphic('whitebg', 3840, 2160, 'ffffff');
	addLuaSprite('whitebg', false);
	setProperty('whitebg.alpha', 0);
	screenCenter('whitebg', 'xy');

        makeLuaSprite('blackbg', '', 0, 0);
	setScrollFactor('blackbg', 0, 0);
	makeGraphic('blackbg', 3840, 2160, '000000');
	addLuaSprite('blackbg', false);
	setProperty('blackbg.alpha', 0);
	screenCenter('blackbg', 'xy');

--Sexy Spotlight
        makeLuaSprite('light', 'spotlight', -50, -50);
        setProperty('light.alpha', 0);
	setProperty('light.scale.x', 1.4);
	setProperty('light.scale.y', 1.2);
        setObjectOrder('light', getObjectOrder('dadGroup') + 1);
	addLuaSprite('light', false);

--Credits Text
        makeLuaText('engineText', "Cover By V.Nitro", 0, 2, 700);
        setTextAlignment('engineText', 'left');
        setTextSize('engineText', 17);
        setTextBorder('engineText', 1, '000000');
        setTextColor('engineText', '278EC9');
        setObjectCamera('engineText', 'hud');
        addLuaText('engineText');

--Lyrics lol
        makeLuaText('LyricAbajo','',1280,screenWidth/2 - 200,screenHeight/2 + 175);
        setTextSize('LyricAbajo', 20, '000000');
        setTextAlignment('LyricAbajo','center'); 
        setTextColor('LyricAbajo', 'FF0000')
        setObjectCamera('LyricAbajo', 'other')
        setProperty('LyricAbajo.antialiasing',false)
        setProperty('LyricAbajo.alpha', '0');
        addLuaText('LyricAbajo');

--Start Screen 
        makeLuaSprite('Start', '', 0, 0);
	makeGraphic('Start',1280,720,'000000');
	setObjectCamera('Start', 'other');
        setProperty('Start.alpha', 1);
	addLuaSprite('Start', true);

--Character List oh yea
        addCharacterToList('taki-white', 'Dad');
	addCharacterToList('bf-fliqpy-white', 'Bf');
end

local bg = 'FrenzyScreen'

local allowCountdown = false

function onStartCountdown()
    if not allowCountdown then
	    return Function_Stop
	end

	if allowCountdown then
	    return Function_Continue
	end
end

function onCreatePost()
      makeLuaSprite('loadingBG', 'loading/'..bg, 0, 0)
      addLuaSprite('loadingBG', true)
      screenCenter('loadingBG', 'xy');
      setProperty('loadingBG.scale.x', 1.0)
      setProperty('loadingBG.scale.y', 1.0)
      setObjectCamera('loadingBG', 'camOther')

      makeAnimatedLuaSprite('bfRun', 'loading/loading_Time_bf', -170, 270)
      addAnimationByPrefix('bfRun', 'anim', 'bf running', 24, true)
      addLuaSprite('bfRun', true);
      setProperty('bfRun.scale.x', 0.3)
      setProperty('bfRun.scale.y', 0.3)
      setObjectCamera('bfRun','camOther')

       runTimer('fadeTimer', 6.0, 1)

      makeLuaSprite('indicator', 'youplay', 140, 140);
      setObjectCamera('indicator', 'hud');
      scaleObject('indicator', 1, 1);
      addLuaSprite('indicator', false);
      setProperty('indicator.alpha', 0);

if downscroll then
      makeLuaSprite('indicator', 'youplay-downscroll', 140, 420);
      setObjectCamera('indicator', 'hud');
      scaleObject('indicator', 1, 1);
      addLuaSprite('indicator', false);
      setProperty('indicator.alpha', 0);
end

if downscroll and middlescroll then

      setProperty('indicator.x', 90);
end
end

function onSongStart()
        doTweenAlpha('graphicAlpha', 'Start', 0, 5, 'linear');
end

function onUpdate (elapsed)
	local currentBeat = (getPropertyFromClass('Conductor', 'songPosition') / 1000) * (bpm/val)

	if curStep >= 128 and curStep < 152 or curStep >= 160 and curStep < 184 or curStep >= 192 and curStep < 216 or curStep >= 224 and curStep < 248 then
		modChart2(0, 7, 1.2, 1.2, currentBeat)
	end

	if curStep >= 152 and curStep < 160 or curStep >= 216 and curStep < 224 then
		modChart2(0, 7, 5, 5, currentBeat)
	end

	if curStep >= 184 and curStep < 192 then
		modChart2(0, 7, -5, -5, currentBeat)

	end

	if curStep >= 248 and curStep < 256 then
		modChart2(0, 7, 5, 0.5, currentBeat)
	end

	if curStep == 256 or curStep == 624 or curStep == 888 or curStep == 1776 or curStep == 2048 then
		for i=0,7 do
			noteTweenAngle(tag[i + 1],  i, 0, 0.6, 'circInOut')
		end
	end

	if curStep >= 384 and curStep < 512 or curStep >= 640 and curStep < 768 or curStep >= 1408 and curStep < 1536 then
		modChart(0, 7, 0, 1, 0, 0.25, currentBeat)
	end

	if curStep >= 512 and curStep < 624 or curStep >= 768 and curStep < 888 or curStep >= 1536 and curStep < 1664 then
		for i=0,7 do
			setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x') + 1 * math.cos((currentBeat + i * 0.25) * math.pi))
		end
	end

	if curStep >= 1664 and curStep < 1728 then
		modChart2(0, 7, 2, 2, currentBeat)
	end

	if curStep >= 1728 and curStep < 1776 then
		modChart2(0, 7, 1, 1, currentBeat)
	end

	if curStep >= 896 and curStep < 1152 or curStep >= 1920 and curStep < 2048 then
		modChart2(0, 7, 0.5, 0.2, currentBeat)
	end

end

function onStepHit()
	if curStep == 1 then
                changeColor('white')
                showCounterHud(false)
		showHealthBar(false)
		dadStrumsAlpha(0);
		bfStrumsAlpha(0);
        end

        if curStep == 10 then
                doTweenAlpha('lyricAlpha', 'LyricAbajo', 1, 0.8, 'linear');
		setProperty('LyricAbajo.x', 20);
	        setTextString('LyricAbajo', "WARNING!\nThis song has special effects which includes\na small brief pattern of flashing lights.");
	end

        if curStep == 100 then
                doTweenAlpha('lyricAlpha', 'LyricAbajo', 0, 1, 'linear');
        end

	if curStep >= 128 and curStep < 130 then
		bfStrumsAlpha(1);
		doTweenZoom('zoom', 'camGame', 0.9, 0.01, 'circInOut');
	end

	if curStep == 192 then
		dadStrumsAlpha(1);
                doTweenAlpha('graphicAlpha', 'Start', 4, 22, 'linear');
	end

	if curStep == 248 then
		defaultStrumY(0)
	end

	if curStep == 256 then
                changeColor('normal')
                showCounterHud(true)
		showHealthBar(true)
		defaultStrumX()
                doTweenAlpha('graphicAlpha', 'Start', 0, 0.4, 'linear');
	end

        if curStep == 384 then
                changeColor('black')
                showCounterHud(false)
		showHealthBar(false)
              --setPropertyFromClass('ClientPrefs', 'camZooms', false)
                doTweenZoom('zoom', 'camGame', 1.2, 7, 'sineInOut');
                setProperty('defaultCamZoom', 1.2);
	end

        if curStep == 448 then
                doTweenZoom('zoom', 'camGame', 0.64, 7, 'sineInOut');
                setProperty('defaultCamZoom', 0.64);
        end

        if curStep == 496 or curStep == 624 then
		flash('white')
	end

        if curStep == 500 or curStep == 628 then
		flash('black')
	end
	
	if curStep == 504 or curStep == 632 then
		flash('white')
	end
	
	if curStep == 508 then
		flash('black')
	end

       if curStep == 512 then
                changeColor('white')
                doTweenX('player', 'boyfriend', 970, 0.5, 'cubeOut');
                doTweenX('opponent', 'dad', 100, 0.5, 'cubeOut');
        end

        if curStep == 640 then
                changeColor('black')
                doTweenX('player', 'boyfriend', 1000, 0.5, 'cubeOut');
                doTweenAlpha('bfAlpha', 'boyfriend', 0, 0.5);
                doTweenX('opponent', 'dad', -10, 0.5, 'cubeOut');
                bfStrumsAlpha(0);
                doTweenZoom('zoom', 'camGame', 0.85, 10, 'sineInOut');
		setProperty('defaultCamZoom', 0.85);
	end

        if curStep == 700 then
                bfStrumsAlpha(1);
                dadStrumsAlpha(0);
                changeColor('white')
                setProperty('cameraSpeed', 3)
                doTweenAlpha('dadAlpha', 'dad', 0, 0.001);
		setProperty('boyfriend.alpha', 1);
        end

        if curStep == 704 then
                setProperty('cameraSpeed', 1)
        end

        if curStep == 760 then
                setProperty('cameraSpeed', 100)
        end

        if curStep == 768 then
                setProperty('dad.alpha', 1);
                setProperty('boyfriend.alpha', 0);
                bfStrumsAlpha(0);
                dadStrumsAlpha(1);
	 end

        if curStep == 769 then
                setProperty('cameraSpeed', 1)
        end

        if curStep == 828 then
                setCharacterX('bf', -700);
                setProperty('boyfriend.alpha', 1);
                bfStrumsAlpha(1);
                dadStrumsAlpha(0);
	end

        if curStep == 887 then
             --setPropertyFromClass('ClientPrefs', 'camZooms', true)
               doTweenAlpha('graphicAlpha', 'Start', 1, 0.7, 'linear');
        end

        if curStep == 896 then
               changeColor('normal')
               setCharacterX('bf', 1000);
               doTweenAlpha('graphicAlpha', 'Start', 0, 0.7, 'linear');
               dadStrumsAlpha(1);
               showCounterHud(true)
	       showHealthBar(true)
        end

	if curStep == 256 or curStep == 624 or curStep == 888 or curStep == 1280 or curStep == 1776 or curStep == 2048 then
		val = 120
	end

	if curStep == 322 or curStep == 1346 or curStep == 1858 then
		triggerEvent('Add Camera Zoom', '', '0.01');
	end

	if curStep == 326 or curStep == 1350 or curStep == 1862 then
		triggerEvent('Add Camera Zoom', '', '0.01');
	end

	if curStep == 330 or curStep == 1354 or curStep == 1866 then
		triggerEvent('Add Camera Zoom', '', '0.01');
	end

	if curStep == 334 or curStep == 1358 or curStep == 1870 then
		triggerEvent('Add Camera Zoom', '', '0.01');
	end

	if curStep == 338 or curStep == 1362 or curStep == 1874 then
		triggerEvent('Add Camera Zoom', '', '0.01');
	end

	if curStep == 342 or curStep == 1366 or curStep == 1878 then
		triggerEvent('Add Camera Zoom', '', '0.01');
	end

	if curStep == 346 or curStep == 1370 or curStep == 1882 then
		triggerEvent('Add Camera Zoom', '', '0.01');
	end

	if curStep == 350 or curStep == 1374 or curStep == 1886 then
		triggerEvent('Add Camera Zoom', '', '0.01');
	end

	if curStep >= 352 and curStep < 367 or curStep >= 1376 and curStep < 1391 or curStep >= 1888 and curStep < 1903 then
		triggerEvent('Add Camera Zoom', '', '0.01');
	end

	if curStep == 384 or curStep == 640 or curStep == 1408 then
		val = 60
	end

	if curStep == 896 or curStep == 1920 then
		val = 240
	end

	if curStep == 1152 then
                setProperty('camGame.visible', false);
		showHealthBar(false)
		dadStrumsAlpha(0);
		bfStrumsAlpha(0);
	end

	if curStep == 1920 then
                setProperty('defaultCamZoom', 0.80);
		showHealthBar(false)
                showCounterHud(false)
                setProperty('light.alpha', 0.45);
		bfStrumsAlpha(0);
	end

	if curStep == 2048 then
                setProperty('defaultCamZoom', 0.65);
                setProperty('light.alpha', 0);
		showHealthBar(true)
		dadStrumsAlpha(0);
	end

	if curStep == 2072 then
		showHealthBar(false)
	end

        if curStep == 2081 then
                doTweenAlpha('lyricAlpha', 'LyricAbajo', 1, 0.2, 'linear');
		setProperty('LyricAbajo.x', 20);
                setTextColor('LyricAbajo', '278EC9');
	        setTextString('LyricAbajo', "Taki, we officially welcome you to FeverTown church.");
	end

        if curStep == 2109 then
                doTweenAlpha('lyricAlpha', 'LyricAbajo', 0, 0.2, 'linear');
        end

	if curStep == 1280 then
                setProperty('camGame.visible', true);
                changeColor('black')
		showHealthBar(true)
		dadStrumsAlpha(1);
		bfStrumsAlpha(1);
	end

	if curStep == 1392 then
                changeColor('white')
                showHealthBar(false)
                showCounterHud(false)
                dadStrumsAlpha(0);
		bfStrumsAlpha(0);
                doTweenAlpha('dadAlpha', 'dad', 0, 0.01);
                doTweenAlpha('bfAlpha', 'boyfriend', 0, 0.01);
		doTweenZoom('zoom', 'camGame', 0.9, 0.01, 'circInOut');
		setProperty('defaultCamZoom', 0.9);
	end

	if curStep == 1408 then
                dadStrumsAlpha(1);
		bfStrumsAlpha(1);
                setProperty('cameraSpeed', 100)
                setProperty('dad.alpha', 1);
                setProperty('boyfriend.alpha', 1);
		setProperty('defaultCamZoom', 1.1);
	end

        if curStep == 1409 then
                setProperty('cameraSpeed', 1) 
        end

        if curStep == 1472 then
                setProperty('cameraSpeed', 100)
        end

        if curStep == 1473 then
                setProperty('cameraSpeed', 1)
        end

        if curStep == 1536 then
                setProperty('cameraSpeed', 100)
        end

        if curStep == 1537 then
                setProperty('cameraSpeed', 1)
        end

	if curStep == 1578 then
		doTweenAlpha('SignOutAlpha', 'indicator', 1, 0.8, 'linear');
	end

	if curStep == 1599 then
		doTweenAlpha('SignInAlpha', 'indicator', 0, 1.5, 'linear');
	end

        if curStep == 1600 then
                setProperty('cameraSpeed', 100)
                setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0);
                setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1);
                setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2);
                setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3);
                setPropertyFromGroup('playerStrums', 4, 'x', defaultOpponentStrumX4);

                setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 + 0);
                setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 + 0);
                setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 + 0);
                setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 + 0);
                setPropertyFromGroup('opponentStrums', 4, 'x', defaultPlayerStrumX4 + 0);
        end

        if curStep == 1601 then
                setProperty('cameraSpeed', 1)
        end

        if curStep >= 1600 and curStep < 1786 then 
                doTweenX('player', 'boyfriend', 670, 17, 'cubeOut'); 
        end

	if curStep == 1664 then
		setProperty('dad.x', 1280)
		setProperty('dad.y', 500)
		setProperty('dad.alpha', 0.5)
	end
	
	if curStep == 1728 then
		setProperty('dad.alpha', 0)
	end

        if curStep == 1785 then
		doTweenAlpha('graphicAlpha', 'Start', 1, 0.7, 'linear');
        end 

        if curStep == 1787 then
                defaultStrumX()
		defaultStrumY(0)
        end

	if curStep == 1791 then
		doTweenAlpha('SignHello', 'indicator', 1, 0.8, 'linear');
		setProperty('indicator.x', 790);
	end

	if curStep == 1815 then
		doTweenAlpha('SignGoodbye', 'indicator', 0, 1.5, 'linear');
	end

        if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
        if curStep == 192 then
		dadStrumsAlpha(0.5);
                doTweenAlpha('graphicAlpha', 'Start', 4, 22, 'linear');
	end
        if curStep == 768 then
                setProperty('dad.alpha', 1);
                setProperty('boyfriend.alpha', 0);
                bfStrumsAlpha(0);
                dadStrumsAlpha(0.5);
	 end
         if curStep == 896 then
                changeColor('normal')
                setCharacterX('bf', 1000);
                doTweenAlpha('graphicAlpha', 'Start', 0, 0.7, 'linear');
                dadStrumsAlpha(0.5);
                showCounterHud(true)
        end
        if curStep == 1280 then
                setProperty('camGame.visible', true);
                changeColor('black')
		showHealthBar(true)
		dadStrumsAlpha(0.5);
		bfStrumsAlpha(1);
	end
	if curStep == 1408 then
                dadStrumsAlpha(0.5);
		bfStrumsAlpha(1);
                setProperty('cameraSpeed', 100)
                setProperty('dad.alpha', 1);
                setProperty('boyfriend.alpha', 1);
		setProperty('defaultCamZoom', 1.1);
	end
	if curStep == 1791 then
		doTweenAlpha('SignHello', 'indicator', 1, 0.8, 'linear');
		setProperty('indicator.x', 480);
	end
        end

        if curStep == 1792 then
                changeColor('normal')
                showHealthBar(true)
                showCounterHud(true)
                setProperty('defaultCamZoom', 0.65)
                setProperty('dad.x', -10)
		setProperty('dad.y', 240)
		setProperty('dad.alpha', 1)
		doTweenAlpha('graphicAlpha', 'Start', 0, 0.7, 'linear');
        end
end

function  onBeatHit()
	if curStep >= 256 and curStep < 350 or curStep >= 640 and curStep < 886 or curStep >= 1280 and curStep < 1374 or curStep >= 1792 and curStep < 1886 or curStep >= 1408 and curStep < 1772 then
		triggerEvent('Add Camera Zoom', '', '0.01');
	end

	if curStep >= 384 and curStep < 622 or curStep >= 1024 and curStep < 1150 then
		triggerEvent('Add Camera Zoom', '0.02', '');
	end
end

function onTimerCompleted(tag) -- bye bye loading screen
    if tag == 'fadeTimer' then
	    doTweenAlpha('delete', 'loadingBG', 0, 0.5, 'backIn')
            doTweenAlpha('remove', 'bfRun', 0, 0.5, 'backIn')
		allowCountdown = true
		startCountdown()
	
	end
end

function onTweenCompleted(tag)
  if tag == 'delete' then
	    removeLuaSprite('loadingBG', true)	
	end

    if tag == 'remove' then
            removeLuaSprite('bfRun', true)	
       end

    if tag == 'SignGoodbye' then
        removeLuaSprite('indicator', true);
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('health') > 0.0143 then
		setProperty('health', getProperty('health') - 0.0143);
	end
end

function modChart(s, e, x1, y1, x2, y2, beat)
	for i = s, e do
		setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x') + x1 * math.sin((beat + i * x2) * math.pi))
		setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y') + y1 * math.cos((beat + i * y2) * math.pi))
	end
end

function modChart2(s, e, x, y, beat)
	for i = s, e do
		setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x') + x * math.cos((beat + i * 0.25) * math.pi))
		setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y') + y * math.cos((beat + i * 0.25) * math.pi))
	end
end

function flash(idk)
	       setProperty('dad.alpha', 1);
	       setProperty('bf.alpha', 1);
	       doTweenAlpha('idkAlpha', 'blackBGalt', 1, 0.01);
	if idk == 'black' then
		changeColor('black')
		doTweenAlpha('dadAlpha', 'dad', 0, 0.5);
		doTweenAlpha('bfAlpha', 'boyfriend', 0, 0.5);
		doTweenAlpha('blackAlpha', 'blackbg', 0, 0.5);
	end
	if idk == 'white' then
		changeColor('white')
		setProperty('dad.alpha', 1);
		setProperty('boyfriend.alpha', 1);
		doTweenAlpha('dadAlpha', 'dad', 0, 0.5);
		doTweenAlpha('bfAlpha', 'boyfriend', 0, 0.5);
		doTweenAlpha('whiteAlpha', 'whitebg', 0, 0.5);
	end
end

function changeColor(eywq)
	if eywq == 'black' then
		setProperty('blackbg.alpha', 1);
		setProperty('whitebg.alpha', 0);
		setProperty('blackBGalt.alpha', 0);
                setProperty('table.alpha', 0);
                setProperty('campfire.alpha', 0);
		triggerEvent('Change Character', 'dad', 'taki-white');
		triggerEvent('Change Character', 'bf', 'bf-fliqpy-white');
		doTweenColor('dadColor', 'dad', 'FFFFFF', 0.01);
		doTweenColor('bfColor', 'boyfriend', 'FFFFFF', 0.01);
	end
	if eywq == 'white' then
		setProperty('whitebg.alpha', 1);
		setProperty('blackBGalt.alpha', 0);
		setProperty('blackbg.alpha', 0);
                setProperty('table.alpha', 0);
                setProperty('campfire.alpha', 0);
		triggerEvent('Change Character', 'dad', 'taki-white');
		triggerEvent('Change Character', 'bf', 'bf-fliqpy-white');
                doTweenColor('dadColor', 'dad', '000000', 0.01);
		doTweenColor('bfColor', 'boyfriend', '000000', 0.01);
	end
	if eywq == 'normal' then
		triggerEvent('Change Character', 'dad', 'Taki');
		triggerEvent('Change Character', 'bf', 'bf-fliqpy-fever');
                setProperty('table.alpha', 1);
                setProperty('campfire.alpha', 1);
		setProperty('whitebg.alpha', 0);
		setProperty('blackbg.alpha', 0);
	end
	doTweenAlpha('dadAlpha', 'dad', 1, 0.05);
	doTweenAlpha('bfAlpha', 'boyfriend', 1, 0.05);
end


function showHealthBar(bool)
if hideHud == false then
        setProperty('healthBarWithAnim.visible', bool);
	setProperty('feverHB.visible', bool);
	setProperty('healthBar.visible', bool);
	setProperty('healthBarBG.visible', bool);
	setProperty('iconP1.visible', bool);
	setProperty('iconP2.visible', bool);
        setProperty('healthText.visible', bool);
        setProperty('songWM.visible', bool);
	setProperty('kadescore.visible', bool);
        setProperty('funnicube.visible', bool);
end
end

function showCounterHud(bool)
        setProperty('timeCool.visible', bool);
        setProperty('timeTxt.visible', bool);
        setProperty('timeBar.visible', bool);
        setProperty('timeBarBG.visible', bool);
        setProperty('ratings.visible', bool);
        setProperty('engineText.visible', bool);

        setProperty('underlay.visible', bool);
        setProperty('ComboText.visible', bool);
        setProperty('SicksText.visible', bool);
        setProperty('GoodsText.visible', bool);
        setProperty('BadsText.visible', bool);
        setProperty('ShitsText.visible', bool);
        setProperty('MissText.visible', bool);
end

function dadStrumsAlpha(a)
	for i = 0, getProperty('opponentStrums.length') - 1 do
		setPropertyFromGroup('opponentStrums', i, 'alpha', a);
	end
end

function bfStrumsAlpha(a)
	for i = 0, getProperty('playerStrums.length') - 1 do
		setPropertyFromGroup('playerStrums', i, 'alpha', a);
	end
end

function defaultStrumX()
	setPropertyFromGroup('strumLineNotes', 0, 'x', defaultOpponentStrumX0)
	setPropertyFromGroup('strumLineNotes', 1, 'x', defaultOpponentStrumX1)
	setPropertyFromGroup('strumLineNotes', 2, 'x', defaultOpponentStrumX2)
	setPropertyFromGroup('strumLineNotes', 3, 'x', defaultOpponentStrumX3)
	setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0)
	setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1)
	setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2)
	setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3)
end

function defaultStrumY(int)
	setPropertyFromGroup('strumLineNotes', 0, 'y', defaultOpponentStrumY0+ int)
	setPropertyFromGroup('strumLineNotes', 1, 'y', defaultOpponentStrumY1+ int)
	setPropertyFromGroup('strumLineNotes', 2, 'y', defaultOpponentStrumY2+ int)
	setPropertyFromGroup('strumLineNotes', 3, 'y', defaultOpponentStrumY3+ int)
	setPropertyFromGroup('strumLineNotes', 4, 'y', defaultPlayerStrumY0+ int)
	setPropertyFromGroup('strumLineNotes', 5, 'y', defaultPlayerStrumY1+ int)
	setPropertyFromGroup('strumLineNotes', 6, 'y', defaultPlayerStrumY2+ int)
	setPropertyFromGroup('strumLineNotes', 7, 'y', defaultPlayerStrumY3+ int)
end


function onGameOver()
        setProperty('LyricAbajo.alpha', '0');
end
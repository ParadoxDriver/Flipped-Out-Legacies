--codigo hecho por v.nitro
--codigo modificado por paradox

function onCreate()
        makeLuaSprite('shadow', 'vinetca', -640, -300);
        setObjectCamera('shadow', 'hud'); 
        setProperty('shadow.scale.x', 0.5);
        setProperty('shadow.scale.y', 0.6);
        setProperty('shadow.alpha', 0);
        addLuaSprite('shadow', false);

        setObjectOrder('shadow', 1);

        makeLuaText('engineText', "Cover By V.Nitro", 0, 2, 700);
        setTextAlignment('engineText', 'left');
        setTextSize('engineText', 17);
        setTextBorder('engineText', 1, '000000');
        setTextColor('engineText', '278EC9');
        setObjectCamera('engineText', 'hud');
        addLuaText('engineText');

        makeLuaText('LyricAbajo','',1280,screenWidth/2 - 200,screenHeight/2 + 175);
        setTextSize('LyricAbajo', 20, '000000');
        setTextAlignment('LyricAbajo','center'); 
        setTextColor('LyricAbajo', '278EC9');
        setObjectCamera('LyricAbajo', 'other');
        setProperty('LyricAbajo.antialiasing',false);
        setProperty('LyricAbajo.alpha', 0);
        addLuaText('LyricAbajo');
end

function onCountdownStarted()
	doTweenZoom('zoom', 'camGame', 0.9, 0.01, 'circInOut');
        setProperty('defaultCamZoom', 0.9);
	setProperty('camHUD.visible', false);
end

local val = 120
function onUpdate (elapsed)
	local currentBeat = (getPropertyFromClass('Conductor', 'songPosition') / 1000) * (bpm/val)

	if curStep >= 119 and curStep < 375 then
		modChart(0, 3, 25, 5, currentBeat, false)
	end

	if curStep >= 384 and curStep < 448 then
		modChart(0, 3, 5, 25, currentBeat, true)
	end

	if curStep >= 456 and curStep < 504 then
		modChart(4, 7, 5, 25, currentBeat, true)
	end

	if curStep >= 512 and curStep < 768 then
		modChart(0, 7, 12.5, 2, currentBeat, false)
	end

	if curStep >= 768 and curStep < 1024 then
		modChart(0, 3, 25, 5, currentBeat, false)
	end

	if curStep >= 1024 and curStep < 1088 then
		modChart(0, 7, 25, 5, currentBeat, false)
	end

	if curStep >= 1088 and curStep < 1120 then
		modChart(0, 7, 50, 5, currentBeat, true)
	end

	if curStep >= 1152 and curStep < 1408 then
		modChart(0, 7, 12.5, 0, currentBeat, false)
	end

	if curStep >= 1536 and curStep < 1598 then
		modChart(0, 7, 25, 0, currentBeat, true)
	end

	if curStep >= 1598 and curStep < 1632 then
		modChart(0, 7, 50, 0, currentBeat, true)
	end

	if curStep >= 1664 and curStep < 1920 then
		modChart(0, 7, 12.5, 0, currentBeat, false)
	end
end

function onStepHit()
        if curStep == 93 then
                setProperty('defaultCamZoom', 0.65);
        end

	if curStep == 96 then
		--setPropertyFromClass('ClientPrefs', 'camZooms', false)
	end

	if curStep == 129 then
		setProperty('camHUD.visible', true);
	end

	if curStep == 384 then
		bfStrumsAlpha(0);
	end

	if curStep == 448 then
		bfStrumsAlpha(1);
	end

	if curStep == 456 then
		dadStrumsAlpha(0);
	end

	if curStep == 504 then
		doTweenZoom('zoom', 'camGame', 0.9, 0.01, 'circInOut');
		setProperty('defaultCamZoom', 0.9);
	end

	if curStep == 512 then
		dadStrumsAlpha(1);
		val = 240;
		showHealthBar(false);
		--setPropertyFromClass('ClientPrefs', 'camZooms', true)
	end

	if curStep == 756 then
		--setPropertyFromClass('ClientPrefs', 'camZooms', false)
	end

	if curStep == 768 then
		val = 120;
		showHealthBar(true);
	end

	if curStep == 1088 then
		val = 60;
	end

	if curStep == 1152 then
		val = 240;
		showHealthBar(false);
		--setPropertyFromClass('ClientPrefs', 'camZooms', true)
	end

	if curStep == 1408 then
		setProperty('defaultCamZoom', 0.65);
		showHealthBar(true);
		--setPropertyFromClass('ClientPrefs', 'camZooms', false)
	end

	if curStep == 1472 then
		dadStrumsAlpha(0);
		showHealthBar(false);
	end

        if curStep == 1475 then
		doTweenAlpha('shadowAlpha', 'shadow', 4, 0.5, 'linear');
                doTweenAlpha('lyricAlpha', 'LyricAbajo', 1, 0.5, 'linear');
                setProperty('LyricAbajo.x', -5);
                setTextSize('LyricAbajo', 22, '000000');
	        setTextString('LyricAbajo', "*Angry Bear Sounds*");
                setProperty('defaultCamZoom', 0.95);
	end

        if curStep >= 1475 and curStep < 1536 then
                cameraShake('camGame', 0.0006, 0.4)
                cameraShake('camHUD', 0.0006, 0.4)
        end

	if curStep == 1536 then
                doTweenAlpha('shadowAlpha', 'shadow', 0, 0.5, 'linear');
                doTweenAlpha('lyricAlpha', 'LyricAbajo', 0, 0.5, 'linear');
                setProperty('defaultCamZoom', 0.65);
		dadStrumsAlpha(1);
		showHealthBar(true);
		val = 120;
	end

        if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
        if curStep == 512 then
		dadStrumsAlpha(0.5);
		val = 240;
		showHealthBar(false);
		--setPropertyFromClass('ClientPrefs', 'camZooms', true)
	end

        if curStep == 1536 then
		dadStrumsAlpha(0.5);
		showHealthBar(true);
		val = 120;
	end
        end

	if curStep == 1598 then
		val = 60;
	end

	if curStep == 1664 then
		val = 240;
		showHealthBar(false);
		--setPropertyFromClass('ClientPrefs', 'camZooms', true)
	end

	if curStep == 1920 then
		showHealthBar(true);
		--setPropertyFromClass('ClientPrefs', 'camZooms', false)
		dadStrumsAlpha(0);
		bfStrumsAlpha(0);
	end

	if curStep == 1984 then
		showHealthBar(false);
	end

	if curStep == 2014 then
		doTweenZoom('zoom', 'camGame', 1, 0.01, 'circInOut');
		setProperty('defaultCamZoom', 1);
	end

	if curStep == 2044 then
		setProperty('defaultCamZoom', 0.65);
	end

	if curStep >= 512 and curStep < 756 or curStep >= 1152 and curStep < 1408 or curStep >= 1664 and curStep < 1920 then
		setProperty('defaultCamZoom', 0.65);
	end
end

function  onBeatHit()
	if curStep >= 512 and curStep < 756 or curStep >= 1152 and curStep < 1408 or curStep >= 1664 and curStep < 1920 then
		triggerEvent('Add Camera Zoom', '0.015', '0');
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 128 and getProperty('health') > 0.0143 then
		setProperty('health', getProperty('health') - 0.0143);
	end
end

local tag = {'notesLeft1', 'notesDown1', 'notesUp1', 'notesRight1', 'notesLeft2', 'notesDown2', 'notesUp2', 'notesRight2'}
function modChart(s, e, x, y, beat, angle)
	for i = s, e do
		setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x') + (x/10) * math.sin((beat + i * 50) * math.pi))
		setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y') + (y/10) * math.cos((beat + i * 0.25) * math.pi))

		if angle then
			noteTweenAngle(tag[i + 1], i, 0, 0.6, 'circInOut')
		end
	end
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


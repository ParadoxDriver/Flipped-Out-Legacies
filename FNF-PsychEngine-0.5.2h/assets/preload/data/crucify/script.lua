--codigo hecho por v.nitro
--codigo modificado por paradox

function onCreate()
     makeLuaSprite('Start', '', 0, 0);
     makeGraphic('Start',1280,720,'000000');
     setObjectCamera('Start', 'other');
     setProperty('Start.alpha', 1);
     addLuaSprite('Start', true);

     makeLuaText('engineText', "Cover By V.Nitro", 0, 2, 700);
     setTextAlignment('engineText', 'left');
     setTextSize('engineText', 17);
     setTextBorder('engineText', 1, '000000');
     setTextColor('engineText', 'E80A0A');
     setObjectCamera('engineText', 'hud');
     addLuaText('engineText');
end

function onSongStart()
     doTweenAlpha('graphicAlpha', 'Start', 0, 2, 'quintOut');
end

local val = 60
function onUpdate (elapsed)
	local currentBeat = (getPropertyFromClass('Conductor', 'songPosition') / 1000) * (bpm/val)

	if not getProperty('endingSong') and (curStep >= 0.01 and curStep < 12 or curStep >= 2176 and curStep < 2188) then
		modChart(0, 7, 40, 10, currentBeat, false)
	end

	if curStep >= 16 and curStep < 28 or curStep >= 2192 and curStep < 2204 then
		modChart(0, 7, 40, 10, currentBeat, false)
	end

	if curStep >= 32 and curStep < 44 or curStep >= 2208 and curStep < 2220 then
		modChart(0, 7, 40, 10, currentBeat, false)
	end

	if curStep >= 48 and curStep < 60 or curStep >= 2224 and curStep < 2236 then
		modChart(0, 7, 40, 10, currentBeat, false)
	end

	if curStep >= 64 and curStep < 76 or curStep >= 2240 and curStep < 2252 then
		modChart(0, 7, 40, 10, currentBeat, false)
	end

	if curStep >= 80 and curStep < 92 or curStep >= 2256 and curStep < 2268 then
		modChart(0, 7, 40, 10, currentBeat, false)
	end

	if curStep >= 96 and curStep < 108 or curStep >= 2272 and curStep < 2284 then
		modChart(0, 7, 40, 10, currentBeat, false)
	end

	if curStep >= 112 and curStep < 124 or curStep >= 2288 and curStep < 2300 then
		modChart(0, 7, 40, 10, currentBeat, false)
	end

	if curStep >= 124 and curStep < 126 or curStep >= 2300 and curStep < 2302 then
		defaultStrumX()
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y') + 10 * math.cos((currentBeat + i * 10) * math.pi))
		end
	end

	if curStep >= 128 and curStep < 624 or curStep >= 1152 and curStep < 1648 then
		modChart(0, 3, 25, 5, currentBeat, false)
	end

	if curStep >= 640 and curStep < 896 or curStep >= 1664 and curStep < 2176 then
		modChart(0, 7, 0, 5, currentBeat, false)
	end

	if curStep >= 1024 and curStep < 1152 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y') + 5 * math.cos((currentBeat + i * 5) * math.pi))
		end
	end

	if curStep >= 2302 then
		defaultStrumX()
	end
end

local tag = {'notesLeft1', 'notesDown1', 'notesUp1', 'notesRight1', 'notesLeft2', 'notesDown2', 'notesUp2', 'notesRight2'}
function onStepHit()
	if curStep == 12 or curStep == 44 or curStep == 76 or curStep == 108 or curStep == 2188 or curStep == 2220 or curStep == 2252 or curStep == 2284 then
		defaultStrumX()
		defaultStrumY(120)
		for i = 0, 7 do
			noteTweenY(tag[i + 1], i, getPropertyFromGroup('strumLineNotes', i, 'y') -200, 0.25, 'linear')
		end
	end

	if curStep == 28 or curStep == 60 or curStep == 92 or curStep == 2204 or curStep == 2236 or curStep == 2268 then
		defaultStrumX()
		defaultStrumY(-120)
		for i = 0, 7 do
			noteTweenY(tag[i + 1], i, getPropertyFromGroup('strumLineNotes', i, 'y') +200, 0.25, 'linear')
		end
	end

	if curStep == 16 or curStep == 32 or curStep == 48 or curStep == 64 or curStep == 80 or curStep == 96 or curStep == 112 or curStep == 126 then
		defaultStrumY(0)
	end

	if curStep == 128 or curStep == 1152 then
		val = 120
	end

	if curStep == 640 or curStep == 1664 then
		showHealthBar(false);
		val = 60
	end

	if curStep == 896 or curStep == 2176 then
		showHealthBar(true);
	end

	if curStep == 1528 then
		dadStrumsAlpha(0)
	end

	if curStep == 1558 then
		dadStrumsAlpha(1)
	end

        if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
        if curStep == 1558 then
		dadStrumsAlpha(0.5)
	end
        end

	if curStep == 2192 or curStep == 2208 or curStep == 2224 or curStep == 2240 or curStep == 2256 or curStep == 2272 or curStep == 2288 or curStep == 2302 then
		defaultStrumY(0)
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
			noteTweenAngle(tag[i + 1],  i, 0, 0.6, 'circInOut')
		end
	end
end

function showHealthBar(bool)
if hideHud == false then
        setProperty('healthBarWithAnim.visible', bool);
	setProperty('healthBarBG.visible', bool);
	setProperty('healthBar.visible', bool);
        setProperty('bloodedHB.visible', bool);
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
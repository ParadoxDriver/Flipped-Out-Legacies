function onCreate()
     makeLuaText('engineText', "Mashup By The Blaster", 0, 2, 700);
     setTextAlignment('engineText', 'left');
     setTextSize('engineText', 14);
     setTextBorder('engineText', 1, '000000');
     setObjectCamera('engineText', 'hud');
     setTextFont('engineText', "Five at Freddy's-Regular.ttf");
     setTextColor('engineText', '5F8614');
     addLuaText('engineText');

     makeAnimatedLuaSprite('poop', 'Flippy/Fright/phantom_poopet', 510, -220); -- -150 y-20
     addAnimationByPrefix('poop', 'igotmyeyesonyou', 'phantom_poopet appear', 24, true);
     objectPlayAnimation('poop', 'igotmyeyesonyou', true);
     setObjectCamera('poop', 'other');
     scaleObject('poop', 1.5, 1.3);
     addLuaSprite('poop', true);

     makeAnimatedLuaSprite('bb', 'Flippy/Fright/phantom_bb', 300, 50);
     addAnimationByPrefix('bb', 'haha', 'phantom_bb idle', 24, false);
     setObjectCamera('bb', 'other');
     setProperty('bb.alpha', 0);
     addLuaSprite('bb', true);

     makeAnimatedLuaSprite('cha', 'Flippy/Fright/phantom_chica', 0, 50);
     addAnimationByPrefix('cha', 'idc', 'phantom_chica scare', 24, false);
     setObjectCamera('cha', 'other');
     setProperty('cha.alpha', 0);   
     addLuaSprite('cha', true);

     setProperty('skipCountdown', true)
end

function onCreatePost()
if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then

    setProperty('poop.x', 180);
end

if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

    setPropertyLuaSprite('poop', 'flipY', true);
    setProperty('poop.y', 490);
end
end

function onStepHit()
if curStep == 685 then
    setProperty('defaultCamZoom', 1.2);
    doTweenColor('scoreTxt', 'scoreTxt', 'FF0000', 0.3, 'linear');
    doTweenColor('timeTxt',  'timeTxt', 'FF0000', 0.3, 'linear');
    doTweenColor('timeBar',  'timeBar', 'FF0000', 0.3, 'linear');
    doTweenColor('botplayTxt', 'botplayTxt', 'FF0000', 0.3, 'linear');
    doTweenColor('healthText',  'healthText', 'FF0000', 0.3, 'linear');
    doTweenColor('healthBar', 'healthBar', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FF0000', 0.3, 'linear');
    doTweenColor('songWM', 'songWM', 'FF0000', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FF0000', 0.3, 'linear');
    doTweenColor('engineText',  'engineText', 'FF0000', 0.3, 'linear');

    setProperty('underlay.color', getColorFromHex('FF0000'))
    doTweenColor('ComboText', 'ComboText', 'FF0000', 0.3, 'linear');
    doTweenColor('SicksText',  'SicksText', 'FF0000', 0.3, 'linear');
    doTweenColor('GoodsText',  'GoodsText', 'FF0000', 0.3, 'linear');
    doTweenColor('BadsText', 'BadsText', 'FF0000', 0.3, 'linear');
    doTweenColor('ShitsText',  'ShitsText', 'FF0000', 0.3, 'linear');
    doTweenColor('MissText',  'MissText', 'FF0000', 0.3, 'linear');

    doTweenColor('stageRed', 'aftonSucks', 'FF0000', 0.3);
    doTweenColor('floorRed', 'lol', 'FF0000', 0.3);
    doTweenColor('dadRed', 'dad', 'FF0000', 0.3);
    doTweenColor('bfRed', 'boyfriend', 'FF0000', 0.3);
    doTweenColor('poopRed', 'poop', 'FF0000', 0.3);
    doTweenY('ppoooooppppp', 'poop', -20, 1, 'linear');
end

if curStep == 703 then
    setProperty('defaultCamZoom', 0.9);
    doTweenColor('scoreTxt', 'scoreTxt', '5F8614', 0.3, 'linear');
    doTweenColor('timeTxt',  'timeTxt', '5F8614', 0.3, 'linear');
    doTweenColor('timeBar',  'timeBar', '5F8614', 0.3, 'linear');
    doTweenColor('botplayTxt', 'botplayTxt', '5F8614', 0.3, 'linear');
    doTweenColor('healthText',  'healthText', '5F8614', 0.3, 'linear');
    doTweenColor('healthBar', 'healthBar', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FFFFFF', 0.3, 'linear');
    doTweenColor('songWM', 'songWM', '5F8614', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FFFFFF', 0.3, 'linear');
    doTweenColor('engineText',  'engineText', '5F8614', 0.3, 'linear');

    setProperty('underlay.color', getColorFromHex('5F8614'))
    doTweenColor('ComboText', 'ComboText', '5F8614', 0.3, 'linear');
    doTweenColor('SicksText',  'SicksText', '5F8614', 0.3, 'linear');
    doTweenColor('GoodsText',  'GoodsText', '5F8614', 0.3, 'linear');
    doTweenColor('BadsText', 'BadsText', '5F8614', 0.3, 'linear');
    doTweenColor('ShitsText',  'ShitsText', '5F8614', 0.3, 'linear');
    doTweenColor('MissText',  'MissText', '5F8614', 0.3, 'linear');

    doTweenColor('stageNormal', 'aftonSucks', 'FFFFFF', 0.3);
    doTweenColor('floorNormal', 'lol', 'FFFFFF', 0.3);
    doTweenColor('dadNormal', 'dad', 'FFFFFF', 0.3);
    doTweenColor('bfNormal', 'boyfriend', 'FFFFFF', 0.3);
    doTweenColor('poopNormal', 'poop', 'FFFFFF', 0.3);
    doTweenY('ppoooooppp', 'poop', -220, 1, 'linear');
end

if curStep == 831 then
    doTweenY('ppoooooppppp', 'poop', -20, 1, 'linear');
end

if curStep == 959 then  
    doTweenY('ppoooooppp', 'poop', -220, 1, 'linear');
end

if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
if curStep == 685 then
    setProperty('defaultCamZoom', 1.2);
    doTweenColor('scoreTxt', 'scoreTxt', 'FF0000', 0.3, 'linear');
    doTweenColor('timeTxt',  'timeTxt', 'FF0000', 0.3, 'linear');
    doTweenColor('timeBar',  'timeBar', 'FF0000', 0.3, 'linear');
    doTweenColor('botplayTxt', 'botplayTxt', 'FF0000', 0.3, 'linear');
    doTweenColor('healthText',  'healthText', 'FF0000', 0.3, 'linear');
    doTweenColor('healthBar', 'healthBar', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FF0000', 0.3, 'linear');
    doTweenColor('songWM', 'songWM', 'FF0000', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FF0000', 0.3, 'linear');
    doTweenColor('engineText',  'engineText', 'FF0000', 0.3, 'linear');

    setProperty('underlay.color', getColorFromHex('FF0000'))
    doTweenColor('ComboText', 'ComboText', 'FF0000', 0.3, 'linear');
    doTweenColor('SicksText',  'SicksText', 'FF0000', 0.3, 'linear');
    doTweenColor('GoodsText',  'GoodsText', 'FF0000', 0.3, 'linear');
    doTweenColor('BadsText', 'BadsText', 'FF0000', 0.3, 'linear');
    doTweenColor('ShitsText',  'ShitsText', 'FF0000', 0.3, 'linear');
    doTweenColor('MissText',  'MissText', 'FF0000', 0.3, 'linear');

    doTweenColor('stageRed', 'aftonSucks', 'FF0000', 0.3);
    doTweenColor('floorRed', 'lol', 'FF0000', 0.3);
    doTweenColor('dadRed', 'dad', 'FF0000', 0.3);
    doTweenColor('bfRed', 'boyfriend', 'FF0000', 0.3);
    doTweenColor('poopRed', 'poop', 'FF0000', 0.3);
    doTweenY('ppoooooppppp', 'poop', 280, 1, 'linear');
end

if curStep == 703 then
    setProperty('defaultCamZoom', 0.9);
    doTweenColor('scoreTxt', 'scoreTxt', '5F8614', 0.3, 'linear');
    doTweenColor('timeTxt',  'timeTxt', '5F8614', 0.3, 'linear');
    doTweenColor('timeBar',  'timeBar', '5F8614', 0.3, 'linear');
    doTweenColor('botplayTxt', 'botplayTxt', '5F8614', 0.3, 'linear');
    doTweenColor('healthText',  'healthText', '5F8614', 0.3, 'linear');
    doTweenColor('healthBar', 'healthBar', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FFFFFF', 0.3, 'linear');
    doTweenColor('songWM', 'songWM', '5F8614', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FFFFFF', 0.3, 'linear');
    doTweenColor('engineText',  'engineText', '5F8614', 0.3, 'linear');
 
    setProperty('underlay.color', getColorFromHex('5F8614'))
    doTweenColor('ComboText', 'ComboText', '5F8614', 0.3, 'linear');
    doTweenColor('SicksText',  'SicksText', '5F8614', 0.3, 'linear');
    doTweenColor('GoodsText',  'GoodsText', '5F8614', 0.3, 'linear');
    doTweenColor('BadsText', 'BadsText', '5F8614', 0.3, 'linear');
    doTweenColor('ShitsText',  'ShitsText', '5F8614', 0.3, 'linear');
    doTweenColor('MissText',  'MissText', '5F8614', 0.3, 'linear');

    doTweenColor('stageNormal', 'aftonSucks', 'FFFFFF', 0.3);
    doTweenColor('floorNormal', 'lol', 'FFFFFF', 0.3);
    doTweenColor('dadNormal', 'dad', 'FFFFFF', 0.3);
    doTweenColor('bfNormal', 'boyfriend', 'FFFFFF', 0.3);
    doTweenColor('poopNormal', 'poop', 'FFFFFF', 0.3);
    doTweenY('ppoooooppp', 'poop', 490, 1, 'linear');
end

if curStep == 831 then
    doTweenY('ppoooooppppp', 'poop', 280, 1, 'linear');
end

if curStep == 959 then
    doTweenY('ppoooooppp', 'poop', 490, 1, 'linear');
end
end

if curStep == 1000 then
    defaultStrumX()
    defaultStrumY(0)
end

if curStep == 1040 then
    setProperty('bb.alpha', 1);
    objectPlayAnimation('bb', 'haha', true);
    doTweenAlpha('badboyballon', 'bb', 0, 2.2, 'linear');
end

if curStep == 1048 then
    objectPlayAnimation('bb', 'phantom_bb empty', true);
end

if curStep == 1168 then
    setProperty('bb.alpha', 1);
    objectPlayAnimation('bb', 'haha', true);
    doTweenAlpha('badboyballon', 'bb', 0, 2.2, 'linear');
end

if curStep == 1172 then
    objectPlayAnimation('bb', 'phantom_bb empty', true);
end

if curStep == 1343 then
    objectPlayAnimation('cha', 'idc', true);
    playSound('mechanics/Chica_jumpscare', 1);
    setProperty('cha.alpha', 1);
    doTweenAlpha('chacha', 'cha', 0, 2, 'linear');
end
end


local val = 60
function onUpdate (elapsed)
	local currentBeat = (getPropertyFromClass('Conductor', 'songPosition') / 1000) * (bpm/val)

	if curStep >= 704 and curStep < 829 then
		modChart(0, 3, 25, 5, currentBeat, false)
	end

        if curStep >= 830 and curStep < 959 then
		modChart(4, 7, 25, 5, currentBeat, false)
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
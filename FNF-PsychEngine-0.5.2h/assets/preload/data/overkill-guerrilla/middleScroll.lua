function onCreate()
if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', true);
end

if hideHud == false then
      makeAnimatedLuaSprite('fireHB', 'HealthBar-Skins/healthBarBurn',  0, 0);
      luaSpriteAddAnimationByPrefix('fireHB', 'idle', 'healthbar', 24, false);
      objectPlayAnimation('fireHB', 'idle');
      setObjectCamera('fireHB', 'hud');
      addLuaSprite('fireHB', true);
end
      makeLuaSprite('BlackBords', 'cooloutline', 0, 0);
      setObjectCamera('BlackBords', 'hud');
      setProperty('BlackBords.alpha', 0);
      addLuaSprite('BlackBords', true);

       makeLuaSprite('Start', '', 0, 0);
       makeGraphic('Start',1280,720,'000000');
       setObjectCamera('Start', 'other');
       setProperty('Start.alpha', 1);
       addLuaSprite('Start', true);

       setObjectOrder('BlackBords', 1);
       setProperty('defaultCamZoom', 0.9);
end

function onDestroy()
	if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
		setPropertyFromClass('ClientPrefs', 'middleScroll', false);
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
	end
end

function onCreatePost()
       setTextString('botplayTxt', '[BOTPLAY MODE]');

       setProperty('fireHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));
       setProperty('fireHB.x', getProperty('healthBar.x') - 10);
       setProperty('fireHB.y', getProperty('healthBar.y') - 61);
       setProperty('fireHB.scale.x', getProperty('healthBar.scale.x') - 0.01);
       setProperty('fireHB.scale.y', getProperty('healthBar.scale.y'));
       setObjectOrder('fireHB', 4);
end

function onUpdatePost()
    local  timeElapsed = math.floor(getProperty('songTime')/1000)
    local  timeTotal = math.floor(getProperty('songLength')/1000)

if getPropertyFromClass('ClientPrefs', 'timeBarType') == 'Time Elapsed' then
    setTextString('timeTxt', string.format("%.2d:%.2d", timeElapsed/60%60, timeElapsed%60) .. ' / ' .. string.format("%.2d:%.2d", timeTotal/60%60, timeTotal%60))
end

if getPropertyFromClass('ClientPrefs', 'timeBarType') == 'Time Left' then
    setTextString('timeTxt', string.format("%.2d:%.2d", timeElapsed/60%60, timeElapsed%60) .. ' \\ ' .. string.format("%.2d:%.2d", timeTotal/60%60, timeTotal%60))
end
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end

function onBeatHit()
if curBeat % 1 == 0 then
       objectPlayAnimation('fireHB', 'idle', true);
   end
end

function onCountdownTick(counter)
if counter % 2 == 0 then
       objectPlayAnimation('fireHB', 'idle');
   end
end

function onCountdownStarted()
       setProperty('camHUD.visible', false);

       noteTweenX('bfLEFT', 4, 412, 0.8, 'smootherStepOut');
       noteTweenX('bfDOWN', 5, 524, 0.9, 'smootherStepOut');
       noteTweenX('bfUP', 6, 636, 1, 'smootherStepOut');
       noteTweenX('bfRIGHT', 7, 748, 1.1, 'smootherStepOut');

       noteTweenX('dadLEFT', 0, -150, 0.000000001, 'smootherStepOut');
       noteTweenX('dadDOWN', 1, -150, 0.000000001, 'smootherStepOut');
       noteTweenX('dadUP', 2, 1500, 0.000000001, 'smootherStepOut');
       noteTweenX('dadRIGHT', 3, 1500, 0.000000001, 'smootherStepOut');
end

local defaultNotePos = {};
local shake = 8;

function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x,y})
    end
end

function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor',  'songPosition');

    currentBeat = (songPos / 1000) * (bpm / 320)

    if curStep >= 895 and curStep < 1151 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end
    if curStep == 1151 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end
    if curStep >= 1664 and curStep < 1919 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end
    if curStep == 1919 then 
        for i = 0,7 do
          setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
          setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end
    if curStep >= 2559 and curStep < 3069 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

   if curStep == 3069 then
        for i = 0,7 do
          setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
          setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end
end

function onStepHit()
if curStep == 1 then
       doTweenAlpha('graphicAlpha', 'Start', 0, 15, 'linear');
end

if curStep == 30 then
       doTweenAlpha('graphicAlpha', 'Start', 0, 6, 'linear');
       doTweenZoom('zoom', 'camGame', 0.65, 5.9, 'linear');
       setProperty('defaultCamZoom', 0.65);
end

if curStep == 128 then
       removeLuaSprite('Start',true);
       setProperty('BlackBords.alpha', 1);
       setProperty('camHUD.visible', true);

       noteTweenAlpha('noteBF4', 4, 0, 0.1, 'linear');
       noteTweenAlpha('noteBF5', 5, 0, 0.1, 'linear');
       noteTweenAlpha('noteBF6', 6, 0, 0.1, 'linear');
       noteTweenAlpha('noteBF7', 7, 0, 0.1, 'linear');

--this if for activated hide hud or disabled timebar
       setProperty('timeTxt.alpha', 0);
       setProperty('timeBar.alpha', 0);
       setProperty('timeBarBG.alpha', 0);
       setProperty('timeCool.alpha', 0);

       setProperty('iconP1.alpha', 0);
       setProperty('iconP2.alpha', 0);
       setProperty('healthBar.alpha', 0);
       setProperty('healthBarBG.alpha', 0);
       setProperty('scoreTxt.alpha', 0);

       setProperty('funnicube.visible', false);
       setProperty('fireHB.visible', false);
       setProperty('healthBarWithAnim.visible', false);
       setProperty('bloodedHB.visible', false);
       setProperty('ratings.visible', false);
       setProperty('songWM.visible', false);
       setProperty('healthText.visible', false);

       setProperty('underlay.visible', false);
       setProperty('ComboText.visible', false);
       setProperty('SicksText.visible', false);
       setProperty('GoodsText.visible', false);
       setProperty('BadsText.visible', false);
       setProperty('ShitsText.visible', false);
       setProperty('MissText.visible', false);
end

if curStep == 384 then
       setProperty('BlackBords.alpha', 0);

       noteTweenAlpha('noteBF4', 4, 1, 0.1, 'linear');
       noteTweenAlpha('noteBF5', 5, 1, 0.1, 'linear');
       noteTweenAlpha('noteBF6', 6, 1, 0.1, 'linear');
       noteTweenAlpha('noteBF7', 7, 1, 0.1, 'linear');

       setProperty('funnicube.visible', true);
       setProperty('fireHB.visible', true);
       setProperty('healthBarWithAnim.visible', true);
       setProperty('bloodedHB.visible', true);
       setProperty('ratings.visible', true);
       setProperty('songWM.visible', true);
       setProperty('healthText.visible', true);

       setProperty('timeTxt.alpha', 1);
       setProperty('timeBar.alpha', 1);
       setProperty('timeBarBG.alpha', 1);
       setProperty('timeCool.alpha', 1);

       setProperty('iconP1.alpha', 1);
       setProperty('iconP2.alpha', 1);
       setProperty('healthBar.alpha', 1);
       setProperty('healthBarBG.alpha', 1);
       setProperty('scoreTxt.alpha', 1);

       setProperty('underlay.visible', true);
       setProperty('ComboText.visible', true);
       setProperty('SicksText.visible', true);
       setProperty('GoodsText.visible', true);
       setProperty('BadsText.visible', true);
       setProperty('ShitsText.visible', true);
       setProperty('MissText.visible', true);
end

if curStep == 2432 then
       noteTweenAlpha('noteBF4', 4, 0, 2, 'linear');
       noteTweenAlpha('noteBF5', 5, 0, 2, 'linear');
       noteTweenAlpha('noteBF6', 6, 0, 2, 'linear');
       noteTweenAlpha('noteBF7', 7, 0, 2, 'linear');

       setProperty('funnicube.visible', false);
       setProperty('fireHB.visible', false);
       setProperty('healthBarWithAnim.visible', false);
       setProperty('bloodedHB.visible', false);
       setProperty('ratings.visible', false);
       setProperty('songWM.visible', false);
       setProperty('healthText.visible', false);

       setProperty('timeTxt.alpha', 0);
       setProperty('timeBar.alpha', 0);
       setProperty('timeBarBG.alpha', 0);
       setProperty('timeCool.alpha', 0);

       setProperty('iconP1.alpha', 0);
       setProperty('iconP2.alpha', 0);
       setProperty('healthBar.alpha', 0);
       setProperty('healthBarBG.alpha', 0);
       setProperty('scoreTxt.alpha', 0);

       setProperty('underlay.visible', false);
       setProperty('ComboText.visible', false);
       setProperty('SicksText.visible', false);
       setProperty('GoodsText.visible', false);
       setProperty('BadsText.visible', false);
       setProperty('ShitsText.visible', false);
       setProperty('MissText.visible', false);
end

if curStep == 2497 then
       setProperty('camGame.visible', false);
end

if curStep == 2559 then
       doTweenColor('timeCool', 'timeCool', 'E80A0A', 0.3, 'linear');

       setProperty('timeBar.color', getColorFromHex('E80A0A'))
       setProperty('timeTxt.color', getColorFromHex('E80A0A'))
       setProperty('scoreTxt.color', getColorFromHex('E80A0A'))
       setProperty('botplayTxt.color', getColorFromHex('E80A0A'))
       setProperty('healthText.color', getColorFromHex('E80A0A'))
       setProperty('songWM.color', getColorFromHex('E80A0A'))  
        
       setProperty('underlay.color', getColorFromHex('E80A0A'))
       setProperty('ComboText.color', getColorFromHex('E80A0A'))  
       setProperty('SicksText.color', getColorFromHex('E80A0A'))
       setProperty('GoodsText.color', getColorFromHex('E80A0A'))
       setProperty('BadsText.color', getColorFromHex('E80A0A'))
       setProperty('ShitsText.color', getColorFromHex('E80A0A'))
       setProperty('MissText.color', getColorFromHex('E80A0A'))

       noteTweenAlpha('noteBF4', 4, 1, 0.1, 'linear');
       noteTweenAlpha('noteBF5', 5, 1, 0.1, 'linear');
       noteTweenAlpha('noteBF6', 6, 1, 0.1, 'linear');
       noteTweenAlpha('noteBF7', 7, 1, 0.1, 'linear');

       setProperty('funnicube.visible', true);
       setProperty('fireHB.visible', true);
       setProperty('healthBarWithAnim.visible', true);
       setProperty('bloodedHB.visible', true);
       setProperty('ratings.visible', true);
       setProperty('songWM.visible', true);
       setProperty('healthText.visible', true);

       setProperty('timeTxt.alpha', 1);
       setProperty('timeBar.alpha', 1);
       setProperty('timeBarBG.alpha', 1);
       setProperty('timeCool.alpha', 1);

       setProperty('iconP1.alpha', 1);
       setProperty('iconP2.alpha', 1);
       setProperty('healthBar.alpha', 1);
       setProperty('healthBarBG.alpha', 1);
       setProperty('scoreTxt.alpha', 1);

       setProperty('underlay.visible', true);
       setProperty('ComboText.visible', true);
       setProperty('SicksText.visible', true);
       setProperty('GoodsText.visible', true);
       setProperty('BadsText.visible', true);
       setProperty('ShitsText.visible', true);
       setProperty('MissText.visible', true);
end

if curStep == 2559 then
       setProperty('camGame.visible', true);
end

if curStep == 3072 then
       setProperty('funnicube.visible', false);
       setProperty('fireHB.visible', false);
       setProperty('healthBarWithAnim.visible', false);
       setProperty('bloodedHB.visible', false);
       setProperty('ratings.visible', false);
       setProperty('songWM.visible', false);
       setProperty('healthText.visible', false);

       setProperty('timeTxt.alpha', 0);
       setProperty('timeBar.alpha', 0);
       setProperty('timeBarBG.alpha', 0);
       setProperty('timeCool.alpha', 0);

       setProperty('iconP1.alpha', 0);
       setProperty('iconP2.alpha', 0);
       setProperty('healthBar.alpha', 0);
       setProperty('healthBarBG.alpha', 0);
       setProperty('scoreTxt.alpha', 0);

       setProperty('underlay.visible', false);
       setProperty('ComboText.visible', false);
       setProperty('SicksText.visible', false);
       setProperty('GoodsText.visible', false);
       setProperty('BadsText.visible', false);
       setProperty('ShitsText.visible', false);
       setProperty('MissText.visible', false);
end

if curStep == 3584 then
       setProperty('BlackBords.alpha', 1);

       noteTweenAlpha('noteBF4', 4, 0, 3, 'linear');
       noteTweenAlpha('noteBF5', 5, 0, 3, 'linear');
       noteTweenAlpha('noteBF6', 6, 0, 3, 'linear');
       noteTweenAlpha('noteBF7', 7, 0, 3, 'linear');
end

if curStep == 3966 then
       setProperty('camGame.visible', false);
       setProperty('camHUD.visible', false);
end
end

function opponentNoteHit(id,data,type,sus)
triggerEvent('Screen Shake','0.04,0.009')

health = getProperty('health')
    if getProperty('health') > 0.017 then
       setProperty('health', health- 0.017);
	end
end

function goodNoteHit()--un pequeño bonus de vida por la dificultad
health = getProperty('health')
     setProperty('health', health + 0.004);
end
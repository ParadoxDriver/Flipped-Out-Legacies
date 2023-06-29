function onCreate()
if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', true);
	end

      makeLuaSprite('reference', 'splashes/Jungle-bg', 0, 0);
      setObjectCamera('reference', 'hud');
      setProperty('reference.alpha', 0);
      setProperty('reference.antialiasing', true);
      addLuaSprite('reference', true);

      setObjectOrder('reference', 1);

      makeLuaSprite('Start', '', 0, 0);
      makeGraphic('Start',1280,720,'000000');
      setObjectCamera('Start', 'other');
      setProperty('Start.alpha', 0);
      addLuaSprite('Start', true);
end

function onDestroy()
	if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
		setPropertyFromClass('ClientPrefs', 'middleScroll', false);
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
	end
end

function onCreatePost()
       setTextString('botplayTxt', '[BOTPLAY MODE]');
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

function onCountdownStarted()
       setProperty('camGame.visible', false);

       noteTweenX('bfLEFT', 4, 412, 0.8, 'smootherStepOut');
       noteTweenX('bfDOWN', 5, 524, 0.9, 'smootherStepOut');
       noteTweenX('bfUP', 6, 636, 1, 'smootherStepOut');
       noteTweenX('bfRIGHT', 7, 748, 1.1, 'smootherStepOut');

       noteTweenX('dadLEFT', 0, -150, 0.000000001, 'smootherStepOut');
       noteTweenX('dadDOWN', 1, -150, 0.000000001, 'smootherStepOut');
       noteTweenX('dadUP', 2, 1500, 0.000000001, 'smootherStepOut');
       noteTweenX('dadRIGHT', 3, 1500, 0.000000001, 'smootherStepOut');
end

function onStepHit()
if curStep == 130 then
      setProperty('camGame.visible', true);
end
if curStep == 1154 then
      setProperty('picnic.alpha', 1);
      setProperty('stump.alpha', 1);
      doTweenColor('flakyRussell', 'flakyRussell', '000000', 0.01, 'linear');            								
end
if curStep == 1410 then
      setProperty('picnic.alpha', 0);
      setProperty('stump.alpha', 0);	
      doTweenColor('flakyRussell', 'flakyRussell', 'FFFFFF', 0.01, 'linear');	             								
end
if curStep == 1412 then
      setTextString('botplayTxt', 'Camera Zoom is Gone!');
      doTweenAlpha('ReferenceMoment', 'reference', 0.8, 27, 'linear');
end
if curStep == 1666 then
      setTextString('botplayTxt', '[BOTPLAY MODE]');
      doTweenAlpha('RemoveInReference', 'reference', 0, 0.2, 'linear');

--Strum Player opponent
     noteTweenAlpha('noteBF4', 4, 0, 0.3, 'linear');
     noteTweenAlpha('noteBF5', 5, 0, 0.3, 'linear');
     noteTweenAlpha('noteBF6', 6, 0, 0.3, 'linear');
     noteTweenAlpha('noteBF7', 7, 0, 0.3, 'linear');

--timeBar Settings
     doTweenAlpha('timeTxt.Alpha', 'timeTxt', 0, 0.3, 'linear');
     doTweenAlpha('timeCool.Alpha', 'timeCool', 0, 0.3, 'linear');
     doTweenAlpha('timeBar.Alpha', 'timeBar', 0, 0.3, 'linear');
     doTweenAlpha('timeBarBG.Alpha', 'timeBarBG', 0, 0.3, 'linear');

--healthBar Settings
     doTweenAlpha('songWM.Alpha', 'songWM', 0, 0.3, 'linear');
     doTweenAlpha('healthText.Alpha', 'healthText', 0, 0.3, 'linear');
     doTweenAlpha('iconP1', 'iconP1', 0, 0.3, 'linear');
     doTweenAlpha('iconP2', 'iconP2', 0, 0.3, 'linear');
     doTweenAlpha('healthBarBG', 'healthBarBG', 0, 0.3, 'linear');
     doTweenAlpha('healthBar', 'healthBar', 0, 0.3, 'linear');
     doTweenAlpha('coolHB', 'coolHB', 0, 0.3, 'linear');
     doTweenAlpha('healthBarWithAnim.Alpha', 'healthBarWithAnim', 0, 0.3, 'linear');
     doTweenAlpha('scoreTxt', 'scoreTxt', 0, 0.3, 'linear');
     doTweenAlpha('funnicube', 'funnicube', 0, 0.3, 'linear');

--Legacy Counter 
     doTweenAlpha('ratings', 'ratings', 0, 0.3, 'linear');
     doTweenAlpha('underlay', 'underlay', 0, 0.3, 'linear');
     doTweenAlpha('ComboText', 'ComboText', 0, 0.3, 'linear');
     doTweenAlpha('SicksText',  'SicksText', 0, 0.3, 'linear');
     doTweenAlpha('GoodsText', 'GoodsText', 0, 0.3, 'linear');
     doTweenAlpha('BadsText', 'BadsText', 0, 0.3, 'linear');
     doTweenAlpha('ShitsText', 'ShitsText', 0, 0.3, 'linear');
     doTweenAlpha('MissText',  'MissText', 0, 0.3, 'linear');
end
if curStep == 1914 then
--Strum Player opponent
     noteTweenAlpha('noteBF4', 4, 1, 1.1, 'linear');
     noteTweenAlpha('noteBF5', 5, 1, 1.1, 'linear');
     noteTweenAlpha('noteBF6', 6, 1, 1.1, 'linear');
     noteTweenAlpha('noteBF7', 7, 1, 1.1, 'linear');
end
if curStep == 1925 then
--timeBar Settings
     doTweenAlpha('timeTxt.Alpha', 'timeTxt', 1, 0.5, 'linear');
     doTweenAlpha('timeCool.Alpha', 'timeCool', 1, 0.5, 'linear');
     doTweenAlpha('timeBar.Alpha', 'timeBar', 1, 0.5, 'linear');
     doTweenAlpha('timeBarBG.Alpha', 'timeBarBG', 1, 0.5, 'linear');

--healthBar Settings
     doTweenAlpha('songWM.Alpha', 'songWM', 1, 0.5, 'linear');
     doTweenAlpha('healthText.Alpha', 'healthText', 1, 0.5, 'linear');
     doTweenAlpha('iconP1', 'iconP1', 1, 0.5, 'linear');
     doTweenAlpha('iconP2', 'iconP2', 1, 0.5, 'linear');
     doTweenAlpha('healthBarBG', 'healthBarBG', 1, 0.5, 'linear');
     doTweenAlpha('healthBar', 'healthBar', 1, 0.5, 'linear');
     doTweenAlpha('coolHB', 'coolHB', 1, 0.5, 'linear');
     doTweenAlpha('healthBarWithAnim.Alpha', 'healthBarWithAnim', 1, 0.5, 'linear');
     doTweenAlpha('scoreTxt', 'scoreTxt', 1, 0.5, 'linear');
     doTweenAlpha('funnicube', 'funnicube', 0.5, 0.5, 'linear');

--Legacy Counter 
     doTweenAlpha('ratings', 'ratings', 1, 0.5, 'linear');
     doTweenAlpha('underlay', 'underlay', 0.6, 0.5, 'linear');
     doTweenAlpha('ComboText', 'ComboText', 1, 0.5, 'linear');
     doTweenAlpha('SicksText',  'SicksText', 1, 0.5, 'linear');
     doTweenAlpha('GoodsText', 'GoodsText', 1, 0.5, 'linear');
     doTweenAlpha('BadsText', 'BadsText', 1, 0.5, 'linear');
     doTweenAlpha('ShitsText', 'ShitsText', 1, 0.5, 'linear');
     doTweenAlpha('MissText',  'MissText', 1, 0.5, 'linear');
end 
if curStep == 2194 then
     doTweenAlpha('graphicAlpha', 'Start', 4, 10, 'linear');
end
end

function onTweenCompleted(tag)
    if tag == 'RemoveInReference' then
        removeLuaSprite('reference', true);
    end
end

function onBeatHit()
if curBeat >= 353 and curBeat < 416 then
   if curBeat % 1 == 0 then--scope reference moment
       triggerEvent('Add Camera Zoom', '0.09', '0.09');
     end
   end
end

function noteMiss()
     characterPlayAnim('gf', 'sad', true);
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

    currentBeat = (songPos / 1000) * (bpm / 190)

     if curStep >= 1410 and curStep < 1665 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end
     if curStep == 1665 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end
end
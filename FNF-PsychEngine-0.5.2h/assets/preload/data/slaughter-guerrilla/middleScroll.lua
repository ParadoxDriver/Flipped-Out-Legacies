function onCreate()
if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', true);
end
     makeLuaSprite('shadow', 'vinetca', -640, -300);
     setObjectCamera('shadow', 'hud'); 
     setProperty('shadow.scale.x', 0.5);
     setProperty('shadow.scale.y', 0.6);
     setProperty('shadow.alpha', 0);
     addLuaSprite('shadow', false);

     makeLuaSprite('Start', '', 0, 0);
     makeGraphic('Start',1280,720,'000000');
     setObjectCamera('Start', 'other');
     setProperty('Start.alpha', 1);
     addLuaSprite('Start', true);

     setProperty('skipCountdown', true)
     setObjectOrder('shadow', 1);
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
if curStep == 1 then
     doTweenAlpha('graphicAlpha', 'Start', 0, 160, 'quintOut');
end

if curStep == 119 then
     doTweenAlpha('graphicAlpha', 'Start', 0, 50, 'quintOut');
end 

if curStep == 222 then
     triggerEvent('Solo Boyfriend', '1', '');
end

if curStep == 223 then
     doTweenZoom('zoom', 'camGame', 1.3, 0.7, 'circInOut');
     setProperty('defaultCamZoom', 1.3);
end

if curStep == 479 then
     doTweenZoom('zoom', 'camGame', 0.64, 0.6, 'circInOut');
     setProperty('defaultCamZoom', 0.64);
     triggerEvent('Solo Boyfriend', '0', '');
end

if curStep == 992 then
     setProperty('defaultCamZoom', 0.90);
end

if curStep == 1120 then
     setProperty('defaultCamZoom', 0.65);
end

if curStep == 1248 then
     setProperty('defaultCamZoom', 0.90);
end

if curStep == 1247 then
     setProperty('defaultCamZoom', 0.65);
end

if curStep == 1312 then
     setProperty('defaultCamZoom', 0.90);
end

if curStep == 1375 then
     setProperty('defaultCamZoom', 0.65);
end

if curStep == 1503 then
     setProperty('defaultCamZoom', 0.90);
     doTweenAlpha('shadowAlpha', 'shadow', 0.8, 0.9, 'linear');
end

if curStep == 1760 then
     setProperty('defaultCamZoom', 0.65);
     doTweenAlpha('shadowAlpha', 'shadow', 0, 0.5, 'linear');
end

if curStep == 2008 then
     doTweenAlpha('shadowAlpha', 'shadow', 1, 0.1, 'linear');
     setProperty('defaultCamZoom', 0.95);
end

if curStep == 2017 then
     doTweenAlpha('shadowAlpha', 'shadow', 0, 0.1, 'linear');
     setProperty('defaultCamZoom', 0.65);

     setProperty('timeTxt.visible', false);
     setProperty('timeCool.visible', false);
     setProperty('timeBar.visible', false);
     setProperty('timeBarBG.visible', false);

     setProperty('scoreTxt.visible', false);
     setProperty('funnicube.visible', false);
     setProperty('iconP1.visible', false);
     setProperty('iconP2.visible', false);
     setProperty('healthBarWithAnim.visible', false);
     setProperty('bloodedHB.visible', false);
     setProperty('healthBar.visible', false);
     setProperty('healthBarBG.visible', false);
 
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

if curStep == 2592 then
     setProperty('camHUD.visible', false);
     setProperty('camGame.visible', false);
end
end

function opponentNoteHit()
       health = getProperty('health')
    if getProperty('health') > 0.01 then
       setProperty('health', health- 0.015);
	end
end
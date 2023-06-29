local defaultNotePos = {};
local spin = false;
local arrowMoveX = 15;
local arrowMoveY = 7;
 
function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
end

function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor', 'songPosition');
    currentBeat = (songPos / 1000) * (bpm / 227.5)
    if spin == true then 
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + arrowMoveX * math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*0.25) * math.pi))
        end
    end
	if curStep == 992 then
		spin = true
	end
end

function onCreate()
if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', true);
end
      makeLuaSprite('Start', '', 0, 0);
      makeGraphic('Start',1280,720,'000000');
      setObjectCamera('Start', 'other');
      setProperty('Start.alpha', 1);
      addLuaSprite('Start', true);

      makeLuaSprite('shadow', 'vinetca', -640, -300);
      setObjectCamera('shadow', 'hud'); 
      setProperty('shadow.scale.x', 0.5);
      setProperty('shadow.scale.y', 0.6);
      setProperty('shadow.alpha', 0);
      addLuaSprite('shadow', false);

      setObjectOrder('shadow', 1);
      setProperty('skipCountdown', true)
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
       setProperty('camHUD.visible', false);

       doTweenAlpha('graphicAlpha', 'Start', 0, 150, 'quintOut');

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
if curStep == 119 then
     doTweenAlpha('graphicAlpha', 'Start', 0, 50, 'quintOut');
end 

if curStep == 224 then
     setProperty('camHUD.visible', true);
end 

if curStep == 256 then
     setProperty('defaultCamZoom', 0.95);
end 

if curStep == 481 then
     setProperty('defaultCamZoom', 0.65);
end

if curStep == 736 then
     setProperty('defaultCamZoom', 0.95);
end

if curStep == 992 then
     setProperty('defaultCamZoom', 0.65);
end    

if curStep == 1057 then
     setProperty('defaultCamZoom', 0.85);
end 

if curStep == 1088 then
     setProperty('defaultCamZoom', 0.95);
end  

if curStep == 1120 then
     setProperty('defaultCamZoom', 0.65);
end 

if curStep == 1184 then
     setProperty('defaultCamZoom', 0.85);
end 

if curStep == 1248 then
     setProperty('defaultCamZoom', 0.65);
end 

if curStep == 1312 then
     setProperty('defaultCamZoom', 0.75);
end 

if curStep == 1344 then
     setProperty('defaultCamZoom', 0.85);
end 

if curStep == 1375 then
     setProperty('defaultCamZoom', 0.65);
end

if curStep == 1440 then
     setProperty('defaultCamZoom', 0.75);
end 

if curStep == 1472 then
     setProperty('defaultCamZoom', 0.85);
end  

if curStep == 1503 then
      arrowMoveX = 9;
      arrowMoveY = 5;
      doTweenAlpha('shadowAlpha', 'shadow', 0.8, 0.9, 'linear');
end

if curStep == 1760 then
     arrowMoveX = 15;
     arrowMoveY = 7;
     setProperty('defaultCamZoom', 0.65);
     doTweenAlpha('shadowAlpha', 'shadow', 0, 0.5, 'linear');
end

if curStep == 2002 then
     setProperty('defaultCamZoom', 0.95);
end 

if curStep == 2015 then
     arrowMoveX = 40;
     arrowMoveY = 20;
     setProperty('defaultCamZoom', 0.65);
end   

if curStep >= 2016 and curStep < 2527 then
    cameraShake('hud', 0.0035, 0.4)
    cameraShake('game', 0.0035, 0.4)
end

if curStep == 2080 then
     setProperty('defaultCamZoom', 0.75);
end  

if curStep == 2112 then
     setProperty('defaultCamZoom', 0.85);
end  

if curStep == 2144 then
     setProperty('defaultCamZoom', 0.65);
end 

if curStep == 2208 then
     setProperty('defaultCamZoom', 0.75);
end

if curStep == 2240 then
     setProperty('defaultCamZoom', 0.85);
end 

if curStep == 2271 then
     setProperty('defaultCamZoom', 0.65);
end 

if curStep == 2336 then
     setProperty('defaultCamZoom', 0.75);
end 

if curStep == 2368 then
     setProperty('defaultCamZoom', 0.85);
end  

if curStep == 2400 then
     setProperty('defaultCamZoom', 0.65);
end

if curStep == 2464 then
     setProperty('defaultCamZoom', 0.75);
end       

if curStep == 2496 then
     setProperty('defaultCamZoom', 0.85);
end                
end

function opponentNoteHit()
       health = getProperty('health')
    if getProperty('health') > 0.01 then
       setProperty('health', health- 0.012);
	end
end
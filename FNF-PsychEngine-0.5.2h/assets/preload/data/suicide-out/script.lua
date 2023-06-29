local allowCountdown = false
local warningimage = 'loading/Mechanics/HappyWarning'
local confirmed = 0

function onCreate()
     makeLuaSprite('warningimage', warningimage, 0, 0);
     screenCenter('warningimage', 'xy');
     setObjectCamera('warningimage', 'other');
     addLuaSprite('warningimage', true);

     makeLuaText('engineText', "Mashup By Nuru", 0, 2, 700);
     setTextAlignment('engineText', 'left');
     setTextSize('engineText', 17);
     setTextBorder('engineText', 1, '000000');
     setTextColor('engineText', '4B4B4B');
     setObjectCamera('engineText', 'hud');
     setTextFont('engineText', "Disney.ttf");
     addLuaText('engineText');

     setProperty('camGame.alpha', 0);
     setProperty('camHUD.alpha', 0);
end

function onUpdate()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and confirmed == 0 then
    allowCountdown = true
    runTimer('startcount', 1);
    doTweenAlpha('nomorewarningimage', 'warningimage', 0, 1, sineOut);
    playSound('confirmMenu');
    confirmed = 1
end
end

function onStartCountdown()
 if not allowCountdown then
  return Function_Stop
 end
 if allowCountdown then
  return Function_Continue
 end
end

function onTimerCompleted(tag)
  if tag == 'startcount' then
    startCountdown()
  end
end

local defaultNotePos = {};
local spin = false;
local arrowMoveX = 12;
local arrowMoveY = 7;

function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
        doTweenAlpha('helloGame', 'camGame', 1, 2, 'linear');
end

function onUpdatePost(elapsed)
    songPos = getPropertyFromClass('Conductor', 'songPosition');
    currentBeat = (songPos / 1000) * (bpm / 110)
    if spin == true then 
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + arrowMoveX * math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*0.25) * math.pi))
        end
    end
       if curStep == 320 then
		spin = true
	end
end

function onStepHit()
if curStep == 59 then
     doTweenAlpha('bye','warning',0,3,'cubeOut')
end
if curStep == 64 then
     setProperty('camHUD.alpha', 1);
end
if curStep == 193 then
     setProperty('defaultCamZoom', 0.8);
end
if curStep == 320 then
     setProperty('defaultCamZoom', 0.65);
end
if curStep == 440 then
     triggerEvent('Camera Follow Opponent','1','')
     setProperty('cameraSpeed', 4);
     doTweenAlpha('goodbyeHud', 'camHUD', 0, 0.4, 'linear');
     setObjectCamera('topBar', 'other');
     setObjectCamera('bottomBar', 'other');
end
if curStep == 444 then
     setProperty('defaultCamZoom', 1.5);
end
if curStep == 448 then
     arrowMoveX = 47;
     arrowMoveY = 25;
     setProperty('defaultCamZoom', 0.65);
     setProperty('cameraSpeed', 1);
     triggerEvent('Camera Follow Opponent','0','')
     doTweenAlpha('helloHud', 'camHUD', 1, 0.4, 'linear');
     setObjectCamera('topBar', 'hud');
     setObjectCamera('bottomBar', 'hud');
end
if curStep >= 448 and curStep < 703 then
     triggerEvent('Screen Shake', '0.8, 0.014', '0.8, 0.014')
end
if curStep == 703 then
     arrowMoveX = 12;
     arrowMoveY = 7;
end
if curStep == 831 then
     doTweenAlpha('goodbyeHud', 'camHUD', 0, 2, 'linear');
     doTweenAlpha('goodbyeGame', 'camGame', 0, 2, 'linear');
end
end
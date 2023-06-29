local allowCountdown = false
local warningimage = 'loading/Mechanics/SufferingWarning'
local confirmed = 0

function onCreate()
    makeLuaText('engineText', "Cover By Amirlikesmeat", 0, 2, 520);
    setTextAlignment('engineText', 'left');
    setTextSize('engineText', 17);
    setTextBorder('engineText', 1, '000000');
    setObjectCamera('engineText', 'hud');
    setTextFont('engineText', "Disney.ttf");
    addLuaText('engineText');

    makeLuaSprite('Start', '', 0, 0);
    makeGraphic('Start',1280,720,'000000');
    setObjectCamera('Start', 'other');
    setProperty('Start.alpha', 1);
    addLuaSprite('Start', true);

    makeLuaSprite('warningimage', warningimage, 0, 0);
    screenCenter('warningimage', 'xy');
    setObjectCamera('warningimage', 'other');
    addLuaSprite('warningimage', true);
end

function onCreatePost()
if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
     setProperty('engineText.y', 690);
     setProperty('engineText.x', 520);
end
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
     setProperty('engineText.y', 27);
     setProperty('engineText.x', 520);
end
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
local arrowMoveX = 6;
local arrowMoveY = 14;
 
function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
end

function onUpdatePost(elapsed)
    songPos = getPropertyFromClass('Conductor', 'songPosition');
    currentBeat = (songPos / 1000) * (bpm / 200)
    if spin == true then 
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + arrowMoveX * math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*0.25) * math.pi))
        end
    end
	if curStep == 384 then
		spin = true
	end
end

function onStepHit()
if curStep == 1 then
    doTweenAlpha('graphicAlpha', 'Start', 0, 2, 'quintOut');
    setProperty('camHUD.visible', false);
end
if curStep == 127 then
    setProperty('camHUD.visible', true);
end
if curStep == 384 then 
    setProperty('BackGround.alpha', 0);
    setProperty('GroundBloody.alpha', 1);
end
if curStep == 648 then
     doTweenColor('FlakyPetroleo', 'Flaky', '000000', 0.01, 'linear');	
     doTweenColor('Black Rain', 'rain', '000000', 0.01, 'linear'); 
     doTweenColor('Black Splash', 'splash', '000000', 0.01, 'linear');   
end
if curStep == 776 then
     doTweenColor('FlakyPetroleo', 'Flaky', 'FFFFFF', 0.01, 'linear');
     doTweenColor('Black Rain', 'rain', 'FFFFFF', 0.01, 'linear'); 
     doTweenColor('Black Splash', 'splash', 'FFFFFF', 0.01, 'linear'); 	   
end
end

function noteMiss()
     characterPlayAnim('gf', 'sad', true);
end
local allowCountdown = false
local warningimage = 'loading/Mechanics/SlasherWarning'
local confirmed = 0

function onCreate()
    makeLuaSprite('Start', '', 0, 0);
    makeGraphic('Start',1280,720,'000000');
    setObjectCamera('Start', 'hud');
    setProperty('Start.alpha', 1);
    addLuaSprite('Start', true);

    setObjectOrder('Start', 1);

if isStoryMode then
    makeLuaSprite('warningimage', warningimage, 0, 0);
    screenCenter('warningimage', 'xy');
    setObjectCamera('warningimage', 'other');
    addLuaSprite('warningimage', true);
end
end

function onUpdate()
if isStoryMode then
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and confirmed == 0 then
    allowCountdown = true
    runTimer('startcount', 1);
    doTweenAlpha('nomorewarningimage', 'warningimage', 0, 1, sineOut);
    playSound('confirmMenu');
    confirmed = 1
end
end
end

function onUpdatePost()
if mustHitSection == true then
      setProperty('defaultCamZoom',0.6)
else
       setProperty('defaultCamZoom',0.4)
end
end

function onStartCountdown()
 if not allowCountdown and isStoryMode then
  return Function_Stop
 end
 if allowCountdown and isStoryMode then
  return Function_Continue
 end
end

function onTimerCompleted(tag)
  if tag == 'startcount' then
    startCountdown()
  end
end

function onSongStart()
       doTweenAlpha('graphicAlpha', 'Start', 0, 1, 'lineal');
end

function onStepHit()
if curStep == 96 then
    triggerEvent('Add Camera Zoom', '0.015', '0.03');
end
if curStep == 99 then
    triggerEvent('Add Camera Zoom', '0.015', '0.03');
end
if curStep == 104 then
    triggerEvent('Add Camera Zoom', '-0.015', '-0.03');
end
if curStep == 116 then
    triggerEvent('Add Camera Zoom', '0.015', '0.03');
end
if curStep == 120 then
    triggerEvent('Add Camera Zoom', '0.015', '0.03');
end
if curStep == 122 then
    triggerEvent('Add Camera Zoom', '0.015', '0.03');
end
if curStep == 124 then
    triggerEvent('Add Camera Zoom', '-0.025', '-0.09');
    triggerEvent('Hey!', 'BF', '1');
end
if curStep == 512 then
    triggerEvent('Change Scroll Speed', '0.80', '0.2');
end
if curStep == 640 then
    triggerEvent('Change Scroll Speed', '0.90', '0.2');
end
if curStep == 768 then
    triggerEvent('Change Scroll Speed', '1', '0.2');
end
end

function opponentNoteHit(id,data,type,sus)
triggerEvent('Screen Shake','0.04,0.009')

health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end
end
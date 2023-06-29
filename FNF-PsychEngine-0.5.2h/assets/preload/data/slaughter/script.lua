function onCreate()
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
end

function onSongStart()
     doTweenAlpha('graphicAlpha', 'Start', 0, 5.3, 'lineal');
     setProperty('camHUD.visible', false);
     setObjectCamera('topBar', 'other');
     setObjectCamera('bottomBar', 'other');
end

function onStepHit()
if curStep == 1 then
   --setPropertyFromClass('ClientPrefs', 'camZooms', false)
end
if curStep == 287 then
     setProperty('camHUD.visible', true);
     setObjectCamera('topBar', 'hud');
     setObjectCamera('bottomBar', 'hud');
end
if curStep == 1088 then
     setProperty('defaultCamZoom', 0.75);
end
if curStep == 1120 then
     setProperty('defaultCamZoom', 0.85);
end
if curStep == 1151 then
     setProperty('defaultCamZoom', 0.65);
end
if curStep == 1215 then
     setProperty('defaultCamZoom', 0.75);
end
if curStep == 1247 then
     setProperty('defaultCamZoom', 0.85);
end
if curStep == 1279 then
     setProperty('defaultCamZoom', 0.65);
end
if curStep == 1344 then
     setProperty('defaultCamZoom', 0.75);
end
if curStep == 1375 then
     setProperty('defaultCamZoom', 0.85);
end
if curStep == 1407 then
     setProperty('defaultCamZoom', 0.65);
end
if curStep == 1471 then
     setProperty('defaultCamZoom', 0.75);
end
if curStep == 1503 then
     setProperty('defaultCamZoom', 0.85);
end
if curStep == 1536 then
     doTweenAlpha('shadowAlpha', 'shadow', 0.8, 0.9, 'linear');
     setProperty('defaultCamZoom', 0.65);
end
if curStep == 1791 then
     doTweenAlpha('shadowAlpha', 'shadow', 0, 0.5, 'linear');
end
if curStep == 2112 then
     setProperty('defaultCamZoom', 0.75);
end
if curStep == 2143 then
     setProperty('defaultCamZoom', 0.85);
end
if curStep == 2175 then
     setProperty('defaultCamZoom', 0.65);
end
if curStep == 2239 then
     setProperty('defaultCamZoom', 0.75);
end
if curStep == 2272 then
     setProperty('defaultCamZoom', 0.85);
end
if curStep == 2303 then
     setProperty('defaultCamZoom', 0.65);
end
if curStep == 2367 then
     setProperty('defaultCamZoom', 0.75);
end
if curStep == 2399 then
     setProperty('defaultCamZoom', 0.85);
end
if curStep == 2431 then
     setProperty('defaultCamZoom', 0.65);
end
if curStep == 2496 then
     setProperty('defaultCamZoom', 0.75);
end
if curStep == 2527 then
     setProperty('defaultCamZoom', 0.85);
end
if curStep == 2559 then
     setProperty('defaultCamZoom', 0.65);
end
if curStep == 2618 then
   --setPropertyFromClass('ClientPrefs', 'camZooms', true)
end
if curStep == 2623 then
     setProperty('camHUD.visible', false);
     setProperty('camGame.visible', false);
end
end

function opponentNoteHit()
 health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end
end
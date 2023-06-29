function onCreate()
      makeLuaText('engineText', "FanSong By Armydillo", 0, 2, 700);
      setTextAlignment('engineText', 'left');
      setTextSize('engineText', 17);
      setTextBorder('engineText', 1, '000000');
      setObjectCamera('engineText', 'hud');
      setTextColor('engineText', '53E52C');
      addLuaText('engineText');

      makeLuaSprite('Start', '', 0, 0);
      makeGraphic('Start',1280,720,'000000');
      setObjectCamera('Start', 'other');
      setProperty('Start.alpha', 1);
      addLuaSprite('Start', true);
end

function onSongStart()
    doTweenAlpha('graphicAlpha', 'Start', 0, 1.4, 'quintOut');
end

function onStepHit()
if curStep == 1 then
  --setPropertyFromClass('ClientPrefs', 'camZooms', false)
end
if curStep == 52 then
   setProperty('defaultCamZoom', 0.85);
end
if curStep == 64 then
   setProperty('defaultCamZoom', 0.65);
end
if curStep == 192 then
   doTweenY('CoolBar1', 'topBar', -350, 1.2, 'linear');
   doTweenY('CoolBar2', 'bottomBar', 825, 1.2, 'linear');
end
if curStep == 512 then
   setProperty('defaultCamZoom', 0.85);
   doTweenY('CoolBar1', 'topBar', 0, 0.7, 'linear');
   doTweenY('CoolBar2', 'bottomBar', 625, 0.7, 'linear');
end
if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
if curStep == 512 then
   setProperty('defaultCamZoom', 0.85);
   doTweenY('CoolBar1', 'topBar', -40, 0.7, 'linear');
   doTweenY('CoolBar2', 'bottomBar', 615, 0.7, 'linear');
end
end
if curStep == 576 then
   setProperty('defaultCamZoom', 0.65);
   doTweenY('CoolBar1', 'topBar', -350, 1.2, 'linear');
   doTweenY('CoolBar2', 'bottomBar', 825, 1.2, 'linear');
end
if curStep == 839 then
 --setPropertyFromClass('ClientPrefs', 'camZooms', true)
   doTweenAlpha('graphicAlpha', 'Start', 1, 2.4, 'linear');
end
end

function onBeatHit()
if curBeat >= 17 and curBeat < 112 or curBeat >= 144 and curBeat < 208 then
   if curBeat % 1 == 0 then
       triggerEvent('Add Camera Zoom', '0.09', '0.09');
     end
   end
end
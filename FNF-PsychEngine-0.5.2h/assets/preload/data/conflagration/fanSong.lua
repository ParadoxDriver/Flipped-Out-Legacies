function onCreate()
      makeLuaText('engineText', "FanSong By Silly_Nex", 0, 2, 700);
      setTextAlignment('engineText', 'left');
      setTextSize('engineText', 17);
      setTextBorder('engineText', 1, '000000');
      setObjectCamera('engineText', 'hud');
      setTextColor('engineText', 'E80A0A');
      addLuaText('engineText');

      makeLuaSprite('shadow', 'vinetca', -640, -300);
      setObjectCamera('shadow', 'hud'); 
      setProperty('shadow.scale.x', 0.5);
      setProperty('shadow.scale.y', 0.6);
      setProperty('shadow.alpha', 0);
      addLuaSprite('shadow', false);

      makeLuaSprite('Start', '', 0, 0);
      makeGraphic('Start',1280,720,'000000');
      setObjectCamera('Start', 'hud');
      setProperty('Start.alpha', 1);
      addLuaSprite('Start', true);

      setObjectOrder('shadow', 1);
      setObjectOrder('Start', 1);
      setProperty('skipCountdown', true)
end

function onSongStart()
       doTweenZoom('zoom', 'camGame', 0.80, 0.01, 'circInOut');
       doTweenAlpha('graphicAlpha', 'Start', 0, 5, 'linear');
end

function onStepHit()
if curStep == 1023 then
     doTweenAlpha('shadowAlpha', 'shadow', 0.8, 1.2, 'quintOut');
     setProperty('defaultCamZoom', 0.85);
end
if curStep == 1151 then
     doTweenAlpha('shadowAlpha', 'shadow', 0, 1.2, 'quintOut');
     setProperty('defaultCamZoom', 0.65);
end
end

function opponentNoteHit()
 health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end
end
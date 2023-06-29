function onCreate()
      makeLuaText('engineText', "FanSong By Ezhalt", 0, 2, 700);
      setTextAlignment('engineText', 'left');
      setTextSize('engineText', 17);
      setTextBorder('engineText', 1, '000000');
      setTextColor('engineText', 'E80A0A');
      setObjectCamera('engineText', 'hud');
      addLuaText('engineText');

      makeLuaText('creditsText', "Vocals Edited By Paradox", 0, 1032, 700);
      setTextAlignment('creditsText', 'right');
      setTextSize('creditsText', 17);
      setTextBorder('creditsText', 1, '000000');
      setTextColor('creditsText', 'E80A0A');
      setObjectCamera('creditsText', 'hud');
      addLuaText('creditsText');

      makeLuaSprite('BlackBords', 'cooloutline', 0, 0);
      setObjectCamera('BlackBords', 'hud');
      setProperty('BlackBords.alpha', 1);
      addLuaSprite('BlackBords', true);

      makeLuaSprite('Start', '', 0, 0);
      makeGraphic('Start',1280,720,'000000');
      setObjectCamera('Start', 'hud');
      setProperty('Start.alpha', 1);
      addLuaSprite('Start', true);

      setObjectOrder('BlackBords', 1);
      setObjectOrder('Start', 1);
end

function onStepHit()
if curStep == 1 then
      doTweenAlpha('helloCam', 'Start', 0, 26, 'linear');
end
if curStep == 191 then
      doTweenAlpha('RemoveBords', 'BlackBords', 0, 4.9, 'linear');
end  
if curStep == 897 then
      doTweenAlpha('goodbyeCam', 'Start', 4, 20, 'linear');
      setObjectCamera('Start', 'other');
end 
end

function onTweenCompleted(tag)
 if tag == 'RemoveBords' then
      removeLuaSprite('BlackBords', true);
   end
end


function opponentNoteHit()
health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end
end


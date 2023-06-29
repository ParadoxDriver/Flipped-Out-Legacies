function onCreate()
if isStoryMode then
       makeLuaSprite('warning','loading/Messages/TriggeredError',110,690);
       addLuaSprite('warning',true);
       setProperty('warning.scale.x', 0.70);
       setProperty('warning.scale.y', 0.70);
       setObjectCamera('warning','hud');
end
end

function onUpdate()
if curStep == 1 then
        doTweenY('showup','warning', 250, 5, 'cubeOut');
end
if curStep == 50 then
        doTweenAlpha('bye','warning',0,2,'cubeOut');
end
if curStep == 1160 then
       triggerEvent('Hey!', 'BF', '1');
    end
end
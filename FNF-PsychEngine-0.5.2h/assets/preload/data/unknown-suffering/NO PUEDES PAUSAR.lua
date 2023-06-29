function onCreate()
    makeLuaSprite('NoPauseSatan', 'Flippy/Suicide/satanNoPausar',35,0);
    addLuaSprite('NoPauseSatan', true);
    setObjectCamera('NoPauseSatan', 'other');    
    setProperty('NoPauseSatan.alpha', 0);
    
    makeAnimatedLuaSprite('NoPuedesDetenerte', 'Flippy/Suicide/noPuedesDetenerte', 220, 535);
    addAnimationByPrefix('NoPuedesDetenerte', 'idle', 'No', 24, true);
    addLuaSprite('NoPuedesDetenerte',true);
    setObjectCamera('NoPuedesDetenerte', 'other');  
    setProperty('NoPuedesDetenerte.alpha', 0);
end

function onPause()
    playSound('mechanics/devil_laugh', 0.8)
    setProperty('NoPauseSatan.alpha', 1);
    setProperty('NoPuedesDetenerte.alpha', 1);
    objectPlayAnimation('NoPuedesDetenerte','idle',false);
	runTimer('chauSatan',1);
   return Function_Stop;
end

function onTimerCompleted(tag)
   if tag == 'chauSatan' then
    doTweenAlpha('adiosSatan', 'NoPauseSatan', 0, 0.3, 'linear');
    doTweenAlpha('adiosTxt', 'NoPuedesDetenerte', 0, 0.3, 'linear');
   end
end
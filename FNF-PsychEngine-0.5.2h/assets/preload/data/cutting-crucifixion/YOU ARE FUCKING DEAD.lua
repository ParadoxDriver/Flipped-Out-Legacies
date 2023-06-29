function onCreate()
    GameOverActive = false
    enableEnd = false
    elije = false
end

function onGameOver()
    if not GameOverActive and not enableEnd then
        GameOverActive = true
        cameraFlash('other', 'FF0000', 1.5); 
        playSound('Killer');     
        setProperty("camGame.visible", false);
        setProperty("camHUD.visible", false);
        runTimer('StartDeath', 1.5)
        
        makeAnimatedLuaSprite('retry', 'Deaths/Death-Bloody',400, 260);
	addAnimationByPrefix('retry', 'idle', 'Reset', 24, true);
        addAnimationByPrefix('retry', 'confirm', 'Res', 24, false);
	objectPlayAnimation('retry', 'idle', false);
	scaleObject('retry',0.7,0.7);
	addLuaSprite('retry', true);
	setObjectCamera('retry', 'other');
	setProperty('retry.alpha', 0);

        setPropertyFromClass('lime.app.Application', 'current.window.title', "Friday Night Funkin': Vs Flippy Flipped Out! Legacy Edition - Mi Huevo AAAAA") --For some reason the name of the application does not change with this script :(
end   
    return Function_Stop;
end

function onUpdate(elapsed)
if GameOverActive then
        setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  )
        setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
        setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
        setPropertyFromClass('PlayState', 'instance.vocals.volume', 0)
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
        setPropertyFromClass('PlayState', 'instance.generatedMusic', false)
end

if elije == true and (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1282) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or elije == true and keyJustPressed('accept') then
runTimer('Another Chance', 0.1)
end
if elije == true and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or elije == true and keyJustPressed('back') then
runTimer('adiosP', 0.1)
end
end

function onTimerCompleted(tag)
if tag == 'loopDeathMusic' then 
playSound('lost-Ones',1,'Death')
runTimer('loopDeathMusic', 20)     
end

  if tag == 'StartDeath' then
     elije = true
     doTweenAlpha('holaRetry', 'retry', 1, 1.5, 'linear');
     objectPlayAnimation('retry', 'idle', false);
     playSound('lost-Ones',1,'Death');
end

  if tag == 'Another Chance' then
     elije = false
     stopSound('Death');
     playSound('Hunter_Confirm');
     objectPlayAnimation('retry', 'confirm', false);  
     runTimer('reinicia', 3)     
     runTimer('adiosOther', 2)     
     end

   if tag == 'adiosOther' then
   doTweenAlpha('adiosOther', 'camOther', 0, 1, 'linear');
end

   if tag == 'reinicia' then
      restartSong(true)
    end

    if tag == 'adiosP' then
      elije = false
      exitSong(true)
end
end

function onPause()
    if GameOverActive then
        return Function_Stop
    end
end

function onEndSong()
    if GameOverActive and not enableSong then
     return Function_Stop;
    end
    return Function_Continue;
end
function onCreatePost()
setProperty('debugKeysChart', null); -- prevents key from doing anything

      precacheImage('Effects/NoCharting/FIQPY')
      makeLuaSprite('flip', 'Effects/NoCharting/FIQPY', 0, 0);
      setObjectCamera('flip', 'other');
      addLuaSprite('flip', false);
      setProperty('flip.alpha', 0);
end

function onUpdate()
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then

      setProperty('flip.alpha',1);
      playSound('ChartingPress/lagallinaparaquecruzolacalle'); 

	runTimer('jumpscareWait', 1, 1);
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'jumpscareWait' then
        setProperty('flip.alpha',0);
end
end

function onGameOver()
     setProperty('flip.alpha', 0);
end
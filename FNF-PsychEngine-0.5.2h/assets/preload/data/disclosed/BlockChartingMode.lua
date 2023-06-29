function onCreatePost()
setProperty('debugKeysChart', null); -- prevents key from doing anything

      precacheImage('Effects/NoCharting/screenstatic')
      makeAnimatedLuaSprite('static', 'Effects/NoCharting/screenstatic', 0, 0);
      addAnimationByPrefix('static', 'stat', 'screenSTATIC', 24, true);
      setObjectCamera('static', 'other')
      addLuaSprite('static', true);
      setProperty('static.alpha', 0);

if lowQuality then
      precacheImage('Effects/NoCharting/screenstatic')
      makeAnimatedLuaSprite('static', 'Effects/NoCharting/screenstatic', 0, 0);
      setObjectCamera('static', 'other')
      addLuaSprite('static', true);
      setProperty('static.alpha', 0);
end 
end

function onUpdate()
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then

      setProperty('static.alpha',1);
      playSound('stat'); 
      objectPlayAnimation('static', 'stat');

	runTimer('jumpscareWait', 1, 1);
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'jumpscareWait' then
        setProperty('static.alpha',0);
end
end

function onGameOver()
     setProperty('static.alpha',0);
end
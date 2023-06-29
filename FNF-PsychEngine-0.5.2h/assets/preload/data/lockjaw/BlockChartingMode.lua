function onCreatePost()
setProperty('debugKeysChart', null); -- prevents key from doing anything

     precacheImage('Effects/NoCharting/staticStrip')
     makeAnimatedLuaSprite('static','Effects/NoCharting/staticStrip',400,0);
     addAnimationByPrefix('static', 'oh shit', 'idle', 24, false);
     setProperty('static.alpha',0);
     setObjectCamera('static','other');
     setProperty('static.scale.x', 3.0);
     setProperty('static.scale.y', 1.0);
     addLuaSprite('static',true);

     makeLuaText('Text', '!NO CHARTING¡', 1250, 0, 300)
     setTextColor('Text', 'E80A0A');
     setObjectCamera('Text', 'other');
     setProperty('Text.alpha',0);
     setTextFont('Text', "Impact.ttf");
     setTextSize('Text', 100);
     addLuaText('Text');

if lowQuality then
     precacheImage('Effects/NoCharting/staticStrip')
     makeAnimatedLuaSprite('static','Effects/NoCharting/staticStrip',400,0);
     setProperty('static.alpha',0);
     setObjectCamera('static','other');
     setProperty('static.scale.x', 3.0);
     setProperty('static.scale.y', 1.0);
     addLuaSprite('static',true);

     makeLuaText('Text', '!NO CHARTING¡', 1250, 0, 300)
     setTextColor('Text', 'E80A0A');
     setObjectCamera('Text', 'other');
     setProperty('Text.alpha',0);
     setTextFont('Text', "Impact.ttf");
     setTextSize('Text', 100);
     addLuaText('Text');
end
end

function onUpdate()
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then

      setProperty('static.alpha',0.8);
      setProperty('Text.alpha',1);
      playSound('ChartingPress/StaticAss'); 
      objectPlayAnimation('static', 'oh shit', true);

	runTimer('jumpscareWait', 0.2, 1);
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'jumpscareWait' then
        setProperty('static.alpha',0);
        setProperty('Text.alpha',0);
end
end

function onGameOver()
     setProperty('static.alpha', 0);
     setProperty('Text.alpha',0)
end
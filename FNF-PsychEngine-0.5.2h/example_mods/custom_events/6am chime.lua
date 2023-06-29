function onCreate()
     makeLuaSprite('black', '', 0,0);
     makeGraphic('black',1280,720,'000000');
     setProperty('black.alpha', 0);
     setObjectCamera('black', 'other');
     addLuaSprite('black', true);

     makeAnimatedLuaSprite('glitchy', 'Flippy/Fright/nightBeatGlitch');
     addAnimationByPrefix('glitchy', 'nightglitchlol', 'glitch', 12, true);
     setGraphicSize('glitchy', getProperty('glitchy.width') * 2);
     setObjectCamera('glitchy', 'other');
     setProperty('glitchy.alpha', 0);
     addLuaSprite('glitchy', true);

     makeAnimatedLuaSprite('sixAM', 'Flippy/Fright/6am', 0, 0);
     addAnimationByPrefix('sixAM', 'static', '6am static', 24, true);
     addAnimationByPrefix('sixAM', 'chime', '6am chime', 24, true);
     screenCenter('sixAM', XY);
     setProperty('sixAM.alpha', 0);
     setObjectCamera('sixAM', 'other');
     addLuaSprite('sixAM', true);
end

function onEvent(name, value1, value2)
	if name == '6am chime' then 
		if value1 == '' then
       --setPropertyFromClass('ClientPrefs', 'camZooms', false)
       runTimer('lets fuckin go', 3)
       objectPlayAnimation('glitchy', 'nightglitchlol', true)
       objectPlayAnimation('sixAM', 'static', true);
       doTweenAlpha('AlphaBlack', 'black', 1, 1, 'linear');
       setProperty('sixAM.alpha', 1);
end
end
end

function onTimerCompleted(tag, loops, loopsLeft) 
      if tag == 'lets fuckin go' then
          runTimer('nightGlitchy', 4);
          setProperty('glitchy.alpha', 1);
          setProperty('glitchy.y', getRandomInt(300,380));
          objectPlayAnimation('glitchy', 'nightglitchlol', true);
          objectPlayAnimation('sixAM', 'chime', true);
     end
       
      if tag == 'nightGlitchy' then
          doTweenAlpha('AlphaGlitchy', 'glitchy', 0, 1, 'linear');
    end
end

function Endsong()
    --setPropertyFromClass('ClientPrefs', 'camZooms', true)
end
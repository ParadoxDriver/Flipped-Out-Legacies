function onCreate()
    makeLuaSprite('blu', '', 0, 0)
    makeGraphic('blu',1280,720,'000000')
    setObjectCamera('blu', 'other')
    addLuaSprite('blu', true)
    
    makeLuaSprite('nighty', 'Flippy/Fright/5thNight', 0, 0)
    screenCenter('nighty', XY)
    setProperty('nighty.visible', false)
    setObjectCamera('nighty', 'other')
    addLuaSprite('nighty', true)
    
    makeAnimatedLuaSprite('glitch', 'Flippy/Fright/newNightGlitch', 0, 0)
    addAnimationByPrefix('glitch', 'stupid static', 'newNightGlitch glitch', 22, false)
    setProperty('glitch.visible', false)
    setObjectCamera('glitch', 'other')
    addLuaSprite('glitch', true)    
end

function onEvent(name, value1, value2)
	if name == 'New Night' then
		if value1 == '' then
          runTimer('GoodBye Night', 3)
          setProperty('nighty.visible', true)
          setProperty('glitch.visible', true)
          objectPlayAnimation('glitch', 'stupid static', true)
         end
     end
end

function onTimerCompleted(tag, loops, loopsLeft)
      if tag == 'GoodBye Night' then
         doTweenAlpha('alphado', 'nighty', 0, 2.4, 'linear')
     end
end
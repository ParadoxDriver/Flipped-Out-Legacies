function onEvent(name, value1, value2)
	if name == 'Red Flash Camera' then
        duration = tonumber(value1);

if getPropertyFromClass('ClientPrefs', 'flashing') == true then
	   makeLuaSprite('red', '', 0, 0);
           makeGraphic('red',1280,720,'ff0000')
	   addLuaSprite('red', true);
           setObjectCamera('red', 'other');
	   doTweenAlpha('red.alpha', 'red', 0, duration, 'linear');
      end
   end
end
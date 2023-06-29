-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'FlashUnHud' then
		colour = tonumber(value2);
		duration = tonumber(value1);

if getPropertyFromClass('ClientPrefs', 'flashing') == true then
		if colour == 0 then
			makeLuaSprite('black', '', 0, 0);
                        makeGraphic('black',1280,720,'000000');
			setObjectCamera('black', 'other');
			addLuaSprite('black', true);
			doTweenAlpha('black.alpha', 'black', 0, duration, 'linear');
		end
		if colour == 1 then
			makeLuaSprite('flash', '', 0, 0);
                        makeGraphic('flash',1280,720,'ffffff');
			setObjectCamera('flash', 'other');
			addLuaSprite('flash', true);
			doTweenAlpha('flash.alpha', 'flash', 0, duration, 'linear');
                  end
	    end
      end
end
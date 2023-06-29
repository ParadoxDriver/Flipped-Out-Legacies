local allowCountdown = false;
local playWarning = false;
local warningimage = 'loading/Mechanics/TriggeredGuerrillaWarning'
local confirmed = 0;

function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('floppy');
                allowCountdown = true;
                playWarning = true;
		return Function_Stop;
elseif playWarning then
		runTimer('startWarning', 0);
		playWarning = false;
		return Function_Stop;
	end
       if allowCountdown then
	return Function_Continue;
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startWarning' then
		setProperty('warningimage.alpha', 1)
	end
        if tag == 'startcount' then
                 startCountdown()
        end
end

function onCreate()
   makeLuaSprite('warningimage', warningimage, 0, 0);
   screenCenter('warningimage', 'xy');
   setObjectCamera('warningimage', 'other');
   setProperty('warningimage.alpha', 0);
   addLuaSprite('warningimage', true);
end

function onUpdate()
if isStoryMode then
   if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and confirmed == 0 then
   runTimer('startcount', 1);
   doTweenAlpha('nomorewarningimage', 'warningimage', 0, 1, sineOut);
   playSound('confirmMenu');
   confirmed = 1
end
end
end
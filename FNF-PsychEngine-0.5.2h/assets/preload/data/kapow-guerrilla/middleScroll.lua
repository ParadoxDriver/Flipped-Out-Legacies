function onCreate()
if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', true);
	end
end

function onDestroy()
	if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
		setPropertyFromClass('ClientPrefs', 'middleScroll', false);
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
	end
end

function onCreatePost()
       setTextString('botplayTxt', '[BOTPLAY MODE]');
end

function onUpdatePost()
    local  timeElapsed = math.floor(getProperty('songTime')/1000)
    local  timeTotal = math.floor(getProperty('songLength')/1000)

if getPropertyFromClass('ClientPrefs', 'timeBarType') == 'Time Elapsed' then
    setTextString('timeTxt', string.format("%.2d:%.2d", timeElapsed/60%60, timeElapsed%60) .. ' / ' .. string.format("%.2d:%.2d", timeTotal/60%60, timeTotal%60))
end

if getPropertyFromClass('ClientPrefs', 'timeBarType') == 'Time Left' then
    setTextString('timeTxt', string.format("%.2d:%.2d", timeElapsed/60%60, timeElapsed%60) .. ' \\ ' .. string.format("%.2d:%.2d", timeTotal/60%60, timeTotal%60))
end
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end

function onCountdownStarted()
       noteTweenX('bfLEFT', 4, 412, 0.8, 'smootherStepOut');
       noteTweenX('bfDOWN', 5, 524, 0.9, 'smootherStepOut');
       noteTweenX('bfUP', 6, 636, 1, 'smootherStepOut');
       noteTweenX('bfRIGHT', 7, 748, 1.1, 'smootherStepOut');

       noteTweenX('dadLEFT', 0, -150, 0.000000001, 'smootherStepOut');
       noteTweenX('dadDOWN', 1, -150, 0.000000001, 'smootherStepOut');
       noteTweenX('dadUP', 2, 1500, 0.000000001, 'smootherStepOut');
       noteTweenX('dadRIGHT', 3, 1500, 0.000000001, 'smootherStepOut');
end

function onBeatHit()
if curBeat >= 97 and curBeat < 152 or curBeat >= 160 and curBeat < 184 or curBeat >= 192 and curBeat < 248 or curBeat >= 256 and curBeat < 312 or curBeat >= 320 and curBeat < 344 or curBeat >= 351 and curBeat < 440 or curBeat >= 448 and curBeat < 472 or curBeat >= 480 and curBeat < 504 or curBeat >= 512 and curBeat < 536  then
    if curBeat % 1 == 0 then
      triggerEvent('Add Camera Zoom', '0.06', '0.06');
  end
end
end

function opponentNoteHit()
 health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end
end
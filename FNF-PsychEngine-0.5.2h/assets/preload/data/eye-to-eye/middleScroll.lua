function onCreate()
if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', true);
end

       makeLuaText('engineText', "Cover By V.Nitro", 0, 2, 700);
       setTextAlignment('engineText', 'left');
       setTextSize('engineText', 17);
       setTextBorder('engineText', 1, '000000');
       setObjectCamera('engineText', 'hud');
       setTextColor('engineText', 'C8DDAE');
       addLuaText('engineText');
end

function onDestroy()
	if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
		setPropertyFromClass('ClientPrefs', 'middleScroll', false);
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
	end
end

function onUpdate()
for i = 0, getProperty('grpNoteSplashes.length')-1 do
        setPropertyFromGroup('grpNoteSplashes', i, 'alpha', 0.56)
    end
for i = 4,7 do
	setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.56)
end
        setPropertyFromGroup('notes', 4, 'alpha', 0.56)
        setPropertyFromGroup('notes', 5, 'alpha', 0.56)
        setPropertyFromGroup('notes', 6, 'alpha', 0.56)
        setPropertyFromGroup('notes', 7, 'alpha', 0.56)
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
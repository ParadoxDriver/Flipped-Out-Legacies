function onCreate()
    makeLuaText('engineText', "Cover and Remix By Cephonster", 0, 2, 700);
    setTextAlignment('engineText', 'left');
    setTextSize('engineText', 17);
    setTextBorder('engineText', 1, '000000');
    setTextColor('engineText', 'E80A0A');
    setObjectCamera('engineText', 'hud');
    addLuaText('engineText');

    setProperty('skipCountdown', true)
end

function onStepHit()
if curStep == 1056 then
   setTextColor('engineText', '647864');--flashback color
end
if curStep == 1312 then
   setTextColor('engineText', 'E80A0A');--normal color
end
if curStep == 2335 then
   setTextColor('engineText', '647864');--flashback color y este ultimo es inecesario lol
end
if curStep == 2593 then
   setTextColor('engineText', 'E80A0A');--normal color
end
end
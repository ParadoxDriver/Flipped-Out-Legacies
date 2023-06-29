function onCreate()
if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', true);
end
       makeLuaText('engineText', "FanSong By 3-G", 0, 2, 700);
       setTextAlignment('engineText', 'left');
       setTextSize('engineText', 17);
       setTextBorder('engineText', 1, '000000');
       setObjectCamera('engineText', 'hud');
       setTextColor('engineText', 'EB5606');
       setTextFont('engineText', "Slasher.ttf");
       addLuaText('engineText');

       makeLuaSprite('Start', '', 0, 0);
       makeGraphic('Start',1280,720,'000000');
       setObjectCamera('Start', 'hud');
       setProperty('Start.alpha', 1);
       addLuaSprite('Start', true);

       setObjectOrder('Start', 1);
       setProperty('skipCountdown', true)
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
       doTweenZoom('zoom', 'camGame', 0.75, 0.1, 'circInOut');

       noteTweenX('bfLEFT', 4, 412, 0.8, 'smootherStepOut');
       noteTweenX('bfDOWN', 5, 524, 0.9, 'smootherStepOut');
       noteTweenX('bfUP', 6, 636, 1,  'smootherStepOut');
       noteTweenX('bfRIGHT', 7, 748, 1.1, 'smootherStepOut');

       noteTweenX('dadLEFT', 0, -150, 0.000000001, 'smootherStepOut');
       noteTweenX('dadDOWN', 1, -150, 0.000000001, 'smootherStepOut');
       noteTweenX('dadUP', 2, 1500, 0.000000001, 'smootherStepOut');
       noteTweenX('dadRIGHT', 3, 1500, 0.000000001, 'smootherStepOut');
end

function onStepHit()
if curStep == 60 then
        doTweenZoom('zoom', 'camGame', 0.4, 15, 'linear');
        setProperty('defaultCamZoom', 0.4);
end
if curStep == 511 then
       setProperty('cameraSpeed', 2.4);
end
if curStep == 767 then
       setProperty('cameraSpeed', 1.5);
end
if curStep == 1279 then
       setProperty('cameraSpeed', 2.4);
end
if curStep == 1535 then
       setProperty('cameraSpeed', 1.5);
end
if curStep == 1796 then
       setObjectCamera('Start', 'other');
       doTweenAlpha('graphicAlpha', 'Start', 4, 19, 'linear');
end
end

local defaultNotePos = {};
local shake = 7;--chile 

function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x,y})
    end
        doTweenAlpha('graphicAlpha', 'Start', 0, 15, 'linear');
end

function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor',  'songPosition');

    currentBeat = (songPos / 1000) * (bpm / 200)

     if curStep >= 512 and curStep < 767 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

    if curStep == 767 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end

    if curStep >= 1280 and curStep < 1535 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

    if curStep == 1535 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end
end
local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('compassCutscene');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

local defaultNotePos = {};
local shake = 4;

function onCreate()
     makeLuaText('engineText', "Remake Vocals By Silly_Nex", 0, 2, 700);
     setTextAlignment('engineText', 'left');
     setTextSize('engineText', 17);
     setTextBorder('engineText', 1, '000000');
     setObjectCamera('engineText', 'hud');
     setTextColor('engineText', 'AFFFA7');
     addLuaText('engineText');
end

function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x,y})
    end
end

function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor',  'songPosition');

    currentBeat = (songPos / 1000) * (bpm / 200)

     if curStep >= 1408 and curStep < 1535 then  
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

    if curStep >= 1568 and curStep < 1600 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

    if curStep == 1600 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end

    if curStep >= 1631 and curStep < 1727 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

    if curStep == 1727 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end

    if curStep >= 1791 and curStep < 1919 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

   if curStep == 1919 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end
end

function onStepHit()
if curStep == 1152 then
     doTweenColor('BadApple', 'stump', '000000', 0.3);
     setTextString('botplayTxt', 'Angry Bear Sounds');
end

if curStep == 1406 then
     triggerEvent('Change FlxTrail Color', 'gf', 'A5004D');
end

if curStep == 1408 then
    doTweenColor('BadApple', 'stump', 'FFFFFF', 0.3);
    triggerEvent('Toggle FlxTrail', 'gf', 'on');
    setTextString('botplayTxt', 'Cam Beat Hit is Gone!');
end

if curStep >= 1409 and curStep < 1535 or curStep >= 1568 and curStep < 1597 or curStep >= 1632 and curStep < 1729 then
      triggerEvent('Add Camera Zoom', '0.015', '0.03');
end

if curStep == 1664 then
      setProperty('cameraSpeed', 2.2);
end

if curStep >= 1791 and curStep < 1805 or curStep >= 1808 and curStep < 1820 or curStep >= 1824 and curStep < 1837 or curStep >= 1841 and curStep < 1852 or curStep >= 1857 and curStep < 1868 or curStep >= 1873 and curStep < 1883 or curStep >= 1888  and curStep < 1900 or curStep >= 1904 and curStep < 1918 then
      triggerEvent('Add Camera Zoom', '0.015', '0.03');--Fast camera moment
      cameraShake('camGame', 0.0005, 0.4)
end

if curStep == 1920 then
      setTextString('botplayTxt', 'BOTPLAY');
      setProperty('cameraSpeed', 1);
end

if curStep == 2456 then
       setProperty('camGame.visible', false);
end
end

function noteMiss()
    characterPlayAnim('gf', 'sad', true);
end
local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('unhingedCutscene');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onCreate()
if hideHud == false then
       makeAnimatedLuaSprite('fireHB', 'HealthBar-Skins/healthBarBurn',  0, 0);
       luaSpriteAddAnimationByPrefix('fireHB', 'idle', 'healthbar', 24, false);
       objectPlayAnimation('fireHB', 'idle');
       setObjectCamera('fireHB', 'hud');
       addLuaSprite('fireHB', true);
end
end

function onCreatePost()
       setProperty('fireHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));
       setProperty('fireHB.x', getProperty('healthBar.x') - 10);
       setProperty('fireHB.y', getProperty('healthBar.y') - 61);
       setProperty('fireHB.scale.x', getProperty('healthBar.scale.x') - 0.01);
       setProperty('fireHB.scale.y', getProperty('healthBar.scale.y'));
       setObjectOrder('fireHB', 4);
end

function onBeatHit()
if curBeat % 1 == 0 then
       objectPlayAnimation('fireHB', 'idle', true);
   end
end

function onCountdownTick(counter)
if counter % 2 == 0 then
       objectPlayAnimation('fireHB', 'idle');
   end
end

local defaultNotePos = {};
local shake = 9;

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

     if curStep >= 1424 and curStep < 1439 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

    if curStep == 1439 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end

    if curStep >= 1552 and curStep < 1567 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

    if curStep == 1567 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end

    if curStep >= 3343 and curStep < 3359 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

    if curStep == 3359 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end

    if curStep >= 3471 and curStep < 3487 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

   if curStep == 3487 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end
end	
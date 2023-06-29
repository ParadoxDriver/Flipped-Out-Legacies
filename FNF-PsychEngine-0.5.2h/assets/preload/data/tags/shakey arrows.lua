local defaultNotePos = {};
local shake = 6;

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

     if curStep >= 1288 and curStep < 1343 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

    if curStep == 1343 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end
end

function onCreate()
	makeLuaSprite('card', 'nothing', -400, 250);
	setObjectCamera('card', 'other');
	addLuaSprite('card');
	scaleObject('card', 0.45, 0.45);

	makeLuaText('songname', 'Song: Tags', '430', -482, 255);
	setTextSize('songname', 24);
	setObjectCamera('songname', 'other');
	setTextColor('songname', 'A4A4A4');
	setTextFont('songname', 'stratum2-medium-webfont.ttf');
	setTextBorder('songname', '0','A4A4A4');
	setObjectOrder('songname', 98);
	addLuaText('songname');

	makeLuaText('desc', 'Song by: Mark E', '460', -517, 290);
	setTextSize('desc', 24);
	setObjectCamera('desc', 'other');
	setTextColor('desc', 'A4A4A4');
	setTextFont('desc', 'stratum2-medium-webfont.ttf');
	setTextBorder('desc', '0','A4A4A4');
	setObjectOrder('desc', 99);
	addLuaText('desc');
end


function onCountdownTick(counter)
	if counter == 0 then
		doTweenX('card','card', '0', 1, 'expoInOut')
		doTweenX('name','songname', '-102', 1, 'expoInOut')
		doTweenX('line1','desc', '-137', 1, 'expoInOut')
		runTimer('cardback', 4)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'cardback' then
		doTweenX('dawg','card', '-400', 1, 'expoInOut')
		doTweenX('andnamowashisnamo','songname', '-462', 1, 'expoInOut')
		doTweenX('lineo1','desc', '-517', 1, 'expoInOut')
	end
end

function onTweenCompleted(tag)
	if tag == 'dawg' then
		removeLuaSprite('dawg', true);
		removeLuaText('desc', true);
		removeLuaText('songname', true);
	end
end
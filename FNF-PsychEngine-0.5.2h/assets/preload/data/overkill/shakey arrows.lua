local defaultNotePos = {};
local shake = 4;

function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x,y})
    end
end

function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor',  'songPosition');

    currentBeat = (songPos / 1000) * (bpm / 280)

     if curStep >= 895 and curStep < 1152 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end
     if curStep == 1152 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end
     if curStep >= 1664 and curStep < 1919 then
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

     if curStep >= 2559 and curStep < 3069 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

     if curStep == 3069 then
        for i = 0,7 do
          setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
          setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end
end
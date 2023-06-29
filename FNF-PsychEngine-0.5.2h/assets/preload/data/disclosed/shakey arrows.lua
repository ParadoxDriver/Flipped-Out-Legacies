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

    currentBeat = (songPos / 1000) * (bpm / 140)

     if curStep >= 839 and curStep < 895 then  
         for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end
     if curStep == 895 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end
     if curStep >= 903 and curStep < 959 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end
     if curStep == 959 then 
        for i = 0,7 do
          setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
          setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end

     if curStep >= 969 and curStep < 1023 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

     if curStep == 1023 then 
        for i = 0,7 do
          setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
          setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end

     if curStep >= 1033 and curStep < 1088 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

     if curStep == 1088 then
        for i = 0,7 do
          setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
          setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end

     if curStep >= 1599 and curStep < 1839 then
        for i = 0,7 do
           setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
           setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
end
end

     if curStep == 1839 then 
        for i = 0,7 do
          setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
          setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
end
end
end
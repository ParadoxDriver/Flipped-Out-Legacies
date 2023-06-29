function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Grenade
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Grenade' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Special-Notes/nadeNotes'); --Change texture
                        setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '-500'); --Default value is: 0.023, health 

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Lets Opponent's instakill notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			else
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Grenade' then
		playSound('mechanics/boomSound', 0.9);
                cameraFlash('hud','FF0000',2,true);
           end
   end

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an fade
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'fade' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Special-Notes/fadeNotes'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'Special-Notes/Splash/Fade Splashes'); --Change note splash texture
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'fade' then
                setProperty('health', getProperty('health')-0.1)
		playSound('mechanics/Fade', 0.9);
                characterPlayAnim('boyfriend', 'singLEFTmiss', true);
		setProperty('boyfriend.specialAnim', true);
                cameraFlash('hud','C69453',3,true);
                ghostmisses = ghostmisses + 1;
		ghostmisses = ghostmisses + 1;
	end
end
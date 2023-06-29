function onCreate()
        --Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length') do
                --Check if the note is an Homicide Grenade
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Homicide Grenade' then
                       setPropertyFromGroup('unspawnNotes', i, 'texture', 'Special-Notes/Genocide Note'); --Change texture

                        setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'Special-Notes/Splash/Smoke Splash'); --Change note splash texture
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Lets Opponent's instakill notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

missAnimations = {'singLEFTmiss', 'singDOWNmiss', 'singUPmiss', 'singRIGHTmiss'}
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Homicide Grenade' then
                if getPropertyFromClass('ClientPrefs','shaking') then
			cameraShake('camHud', 0.0045, 0.9);
		end
                cameraFlash('Game','CE1800',0.9,true);
                triggerEvent('Add Camera Zoom', '0.5', '0.003');
		setProperty('health', getProperty('health')-0.7);
		playSound('mechanics/boomSound', 0.9);
                characterPlayAnim('boyfriend', missAnimations[noteData+1], true);
		setProperty('boyfriend.specialAnim', true);

local animToPlay = '';
		if noteData == 0 then
			animToPlay = 'singLEFTmiss';
		elseif noteData == 1 then
			animToPlay = 'singDOWNmiss';
		elseif noteData == 2 then
			animToPlay = 'singUPmiss';
		elseif noteData == 3 then
			animToPlay = 'singRIGHTmiss';
           end
     end
end	
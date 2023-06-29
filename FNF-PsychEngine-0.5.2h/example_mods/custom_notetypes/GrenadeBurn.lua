poison = false;
drain = 0.004;
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an GrenadeBurn
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'GrenadeBurn' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Special-Notes/burnNotes'); --Change texture

                        setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'Special-Notes/Splash/Burn Splashes'); --Change note splash texture
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

missAnimations = {'singLEFTmiss', 'singDOWNmiss', 'singUPmiss', 'singRIGHTmiss'}
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'GrenadeBurn' then
		playSound('mechanics/burnSound', 0.8);
                drain=drain+0.0023
		runTimer('poisonStop', 1.3);
		poison=true;
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

function onStepHit()
    if poison==true then
		health = getProperty('health')
		setProperty('health', getProperty('health')-drain);
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'poisonStop' then
        poison=false
     end
end
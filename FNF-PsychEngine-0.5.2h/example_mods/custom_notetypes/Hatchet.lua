function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Hatchet
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Hatchet' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Special-Notes/AXETROLLNOTE_assets'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let BF's notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
        makeLuaSprite('RedBords', 'Special-Notes/others/madvignette', 0, 0);
	setObjectCamera('RedBords', 'hud');
	setGraphicSize('RedBords', screenWidth, screenHeight);
	setScrollFactor('RedBords', 0, 0);
	setProperty('RedBords.alpha', 0.0);
	addLuaSprite('RedBords', false);
end

function onCreatePost()
        setObjectOrder('RedBords', true);
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

missAnimations = {'singLEFTmiss', 'singDOWNmiss', 'singUPmiss', 'singRIGHTmiss'}
function goodNoteHit(id, noteData, noteType, isSustainNote)
	 if noteType == 'Hatchet' then
                if getPropertyFromClass('ClientPrefs','shaking') then
			cameraShake('camGame', 0.06, 0.1);
		end
		if flashingLights then
			setProperty('RedBords.alpha', 1.0);
			doTweenAlpha('rue', 'RedBords', 0, 1.5, 'quadInOut');		
		end
                characterPlayAnim('dad', 'singUP', true);
		setProperty('dad.specialAnim', true);
                playSound('mechanics/axe_swing',0.8);
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

function noteMiss(id, noteData, noteType, isSustainNote)
	 if noteType == 'Hatchet' then
		setProperty('health', 0);
                playSound('mechanics/axe_swing',0.8);
                cameraFlash('hud','FF0000',2,true);	 
	  end
    end
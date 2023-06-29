poison = false;
drain = 0.008;

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Toxin Grenade
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Toxin Grenade' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Special-Notes/PosionNotes'); --Change texture
                        setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'Special-Notes/Splash/Posion Splash'); --Change splash texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Lets Opponent's instakill notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end

        makeLuaSprite('toxinvignette', 'Special-Notes/others/ToxinVignette', 0, 0);
	setObjectCamera('toxinvignette', 'hud');
	setGraphicSize('toxinvignette', screenWidth, screenHeight);
	setScrollFactor('toxinvignette', 0, 0);
	setProperty('toxinvignette.alpha', 0);
	addLuaSprite('toxinvignette', false);
end

function onCreatePost()
        setObjectOrder('toxinvignette', true);
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

missAnimations = {'singLEFTmiss', 'singDOWNmiss', 'singUPmiss', 'singRIGHTmiss'}
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Toxin Grenade' then
               if flashingLights then
		      setProperty('toxinvignette.alpha', 1.0);
		      doTweenAlpha('srwhite', 'toxinvignette', 0, 1.5, 'quadInOut');		
	        end
               if getPropertyFromClass('ClientPrefs','shaking') then
			cameraShake('camGame', 0.05, 0.5);
		end
                drain=drain+0.0023
		runTimer('poisonStop', 1.7);
		poison=true;
		playSound('mechanics/BomNuclear', 0.9);
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
function onCreate()
        makeAnimatedLuaSprite('Static', 'Effects/Oversat', 0, 0);
    	addAnimationByPrefix('Static', 'missed', 'overstat', 24, true);
    	setProperty('Static.alpha', 0);
        setProperty('Static.scale.x', 6.5);
	setProperty('Static.scale.y', 6.5);
    	addLuaSprite('Static', true);
    	setObjectCamera('Static', 'other');

	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Really Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Special-Notes/REALLYNOTE_assets'); --Change texture
                        setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'Special-Notes/Splash/Really Splashes'); --Change note splash texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Really Note' then
                runTimer('STATIC', 0.01);
                runTimer('RemoveStatic', 1);
        	playSound('stat');
                ghostmisses = ghostmisses + 1;
		ghostmisses = ghostmisses + 1;
       end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'RemoveStatic' then
setPropertyLuaSprite('Static', 'alpha', 0);
end
if tag == 'STATIC' then
 setPropertyLuaSprite('Static', 'alpha', 1);
    end
end
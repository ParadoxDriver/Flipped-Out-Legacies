function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Scream Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Special-Notes/SCREAMERNOTE_assets'); 
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties

			makeAnimatedLuaSprite('SCREAMER', 'Special-Notes/others/SCREAMER', -100, -90);
			luaSpriteAddAnimationByPrefix('SCREAMER', 'SCREAMER', 'SCREAMER instancia ', 24, true);
			setLuaSpriteCamera('SCREAMER', 'other')
			setPropertyLuaSprite('SCREAMER', 'alpha', 0)
			scaleObject('SCREAMER', 1.5, 1.5);
			addLuaSprite('SCREAMER', true);

			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
if noteType == 'Scream Note'  then
runTimer('SCREAMER', 0.01);
runTimer('SCREAMERRemove2', 1);
playSound('mechanics/static');
ghostmisses = ghostmisses + 1;
ghostmisses = ghostmisses + 1;
end
end


function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'SCREAMERRemove2' then
setPropertyLuaSprite('SCREAMER', 'alpha', 0)
end
if tag == 'SCREAMER' then
 setPropertyLuaSprite('SCREAMER', 'alpha', 1)
    end
end
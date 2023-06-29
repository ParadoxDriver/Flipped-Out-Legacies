function onCreate()
    	makeAnimatedLuaSprite('missStatic', 'Special-Notes/others/hitStatic', 0, 0)
    	addAnimationByPrefix('missStatic', 'missed', 'staticANIMATION', 24, false)
    	setGraphicSize('missStatic', 1366, 768) --getProperty('missStatic.width') * 4
    	setProperty('missStatic.alpha', 0.7)
    	setProperty('missStatic.visible', false)
    	addLuaSprite('missStatic', true)
    	setObjectCamera('missStatic', 'other')

	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Static Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Special-Notes/STATIC_assets'); --Change texture

                       if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Lets Opponent's instakill notes get ignored

                        setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
		else

		        setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);

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
	if noteType == 'Static Note' then
        	playSound('mechanics/hitStatic1')
		objectPlayAnimation('missStatic', 'missed', true)
                ghostmisses = ghostmisses + 1;
		ghostmisses = ghostmisses + 1;
       end
end

function onStepHit()
	if curStep == 1 then
    		setProperty('missStatic.visible', true)
	end
end

function onUpdate(elapsed)
    if getProperty('missStatic.animation.curAnim.finished') and getProperty('missStatic.animation.curAnim.name') == 'missed' then
        setProperty('missStatic.alpha', 0)
    else
        setProperty('missStatic.alpha', 0.9)
        end
    end
end
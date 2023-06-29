function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Blood Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Special-Notes/cammo'); --Change texture
                        setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'Special-Notes/Splash/Blood Splashes'); --Change note splash texture
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored 
                        setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties			
                        precacheImage('Special-Notes/others/blood')
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
function goodNoteHit(id,data,type,sus)
	if type == "Blood Note" then
	  makeAnimatedLuaSprite('popup','Special-Notes/others/blood',getRandomInt(50,900),getRandomInt(50,500))
	  addAnimationByPrefix('popup','bloodsplat','blood',getRandomInt(8,30),false)
	  luaSpritePlayAnimation('popup', 'bloodsplat');
	  addLuaSprite('popup',true)
	  setObjectCamera('popup','hud')
          playSound('mechanics/bloody', 0.8);
     end
end
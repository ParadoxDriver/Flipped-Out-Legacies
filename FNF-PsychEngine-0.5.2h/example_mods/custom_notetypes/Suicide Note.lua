function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Suicide Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Suicide Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Special-Notes/Knifenote'); --Change texture
                         setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'Special-Notes/Splash/Really Splashes'); --Change note splash texture
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let BF's notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
        makeLuaSprite('Vignette', 'Special-Notes/others/madvignette', 0, 0);
	setObjectCamera('Vignette', 'hud');
	setGraphicSize('Vignette', screenWidth, screenHeight);
	setScrollFactor('Vignette', 0, 0);
	setProperty('Vignette.alpha', 0.0);
	addLuaSprite('Vignette', false);
end

function onCreatePost()
        setObjectOrder('madVignette', true);
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Suicide Note' then
              if flashingLights then
			setProperty('Vignette.alpha', 1.0);
			doTweenAlpha('vigtween', 'Vignette', 0, 1.8, 'quadInOut');
		end
          triggerEvent('Add Camera Zoom', '0.4', '0.007');
          characterPlayAnim('dad', 'singRIGHT', true);
	  setProperty('dad.specialAnim', true);
	  characterPlayAnim('boyfriend', 'dodge', true);
	  setProperty('boyfriend.specialAnim', true);
          playSound('mechanics/Warning',0.8);
     end
end
function noteMiss(id,data,noteType,sus)
        if noteType == 'Suicide Note' then
         cameraFlash('hud','FF0000',0.8,true);
         characterPlayAnim('boyfriend', 'at', true);
	 setProperty('boyfriend.specialAnim', true);
         setProperty('health',getProperty('health') - 0.4);
         playSound('mechanics/slash',0.8);
     end
end
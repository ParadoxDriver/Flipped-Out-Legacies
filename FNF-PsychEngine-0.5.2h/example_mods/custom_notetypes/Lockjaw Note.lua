function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Lockjaw Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Special-Notes/LOCKNOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'Special-Notes/Splash/Lock Splashes'); --Change note splash texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let BF's notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
	makeLuaSprite('madVignette', 'Special-Notes/others/madvignette', 0, 0);
	setObjectCamera('madVignette', 'hud');
	setGraphicSize('madVignette', screenWidth, screenHeight);
	setScrollFactor('madVignette', 0, 0);
	setProperty('madVignette.alpha', 0.0);
	addLuaSprite('madVignette', false);
end

function onCreatePost()
        setObjectOrder('madVignette', true);
end

local funny = math.random(2);
tostring(funny);
local ataque = 'attack' .. funny;

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Lockjaw Note' then
		if flashingLights then
			setProperty('madVignette.alpha', 1.0);
			doTweenAlpha('madvigtween', 'madVignette', 0, 1.5, 'quadInOut');		
		end
		characterPlayAnim('dad', 'singRIGHT-alt', true);
		setProperty('dad.specialAnim', true);
		characterPlayAnim('gf', 'sad', true);
		setProperty('gf.specialAnim', true);
		setProperty('iconP1.angle', 45);
		setProperty('iconP2.angle', -45);
		doTweenAngle('iconTween1','iconP1',0,crochet/1000,'cubeOut');
	        doTweenAngle('iconTween2','iconP2',0,crochet/1000,'cubeOut');
		playSound('mechanics/thunder');
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Lockjaw Note' then
		if gimmicks then
		   setProperty('health', getProperty('health')-1);
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
end
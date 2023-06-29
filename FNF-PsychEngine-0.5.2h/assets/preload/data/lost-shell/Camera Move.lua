function onCreate()
      makeLuaSprite('Start', '', 0, 0);
      makeGraphic('Start',1280,720,'000000');
      setObjectCamera('Start', 'other');
      setProperty('Start.alpha', 1);
      addLuaSprite('Start', true);
end

local bg = 'FamilyScreen'

local allowCountdown = false

function onCreatePost()
      makeLuaSprite('loadingBG', 'loading/'..bg, 0, 0);
      addLuaSprite('loadingBG', true);
      screenCenter('loadingBG', 'xy');
      setProperty('loadingBG.scale.x', 0.63);
      setProperty('loadingBG.scale.y', 0.67);
      setObjectCamera('loadingBG', 'camOther');

      makeAnimatedLuaSprite('bfRun', 'loading/loading_Time_bf', -170, 270);
      addAnimationByPrefix('bfRun', 'anim', 'bf running', 24, true);
      addLuaSprite('bfRun', true);
      setProperty('bfRun.scale.x', 0.3);
      setProperty('bfRun.scale.y', 0.3);
      setObjectCamera('bfRun','camOther');

	runTimer('fadeTimer', 6.0, 1)
end

function onStartCountdown() -- No countdown yet
    if not allowCountdown then
	    return Function_Stop
	end

	if allowCountdown then
	    return Function_Continue
	end
end

function onTimerCompleted(tag) -- bye bye loading screen
    if tag == 'fadeTimer' then
	    doTweenAlpha('delete', 'loadingBG', 0, 0.5, 'backIn');
            doTweenAlpha('remove', 'bfRun', 0, 0.5, 'backIn');
		allowCountdown = true
		startCountdown()	
	end
end

function onTweenCompleted(tag) -- everything goes bye bye
    if tag == 'delete' then
	    removeLuaSprite('loadingBG', true)
        end

    if tag == 'remove' then
            removeLuaSprite('bfRun', true)	
       end
end

function onCountdownStarted()
      doTweenZoom('zoom', 'camGame', 0.9, 0.01, 'sineInOut');
      setProperty('defaultCamZoom', 0.9);
      setProperty('camHUD.visible', false);
      setProperty('cameraSpeed', 1);
end

function onStepHit()
       if curStep == 1 then
     doTweenAlpha('graphicAlpha', 'Start', 0, 110, 'quintOut');
end
       if curStep == 6 then
     doTweenZoom('zoom', 'camGame', 0.57, 9.6, 'sineInOut');
     setProperty('defaultCamZoom', 0.57);
end
       if curStep == 20 then
     doTweenAlpha('graphicAlpha', 'Start', 0, 40, 'quintOut');
end
       if curStep == 128 then
     setProperty('camHUD.visible', true);
     setProperty('cameraSpeed', 2.7);
end
end

local defaultNotePos = {i}
local spin = 6 -- how much it moves before going the other direction
 
function onSongStart(i)
    for i = 0, 7 do
        defaultNotePos[i] = {
            getPropertyFromGroup('strumLineNotes', i, 'x'),
            getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
end

function onUpdate(elapsed)
    local songPos = getPropertyFromClass('Conductor', 'songPosition') / 800 --How long it will take.
    
    if curStep >= 0 and curStep < 5000 then
        setProperty("camGame.angle", spin * math.sin(songPos))
        setProperty("camHUD.angle", spin * math.sin(songPos))
    end
    
    if curStep == 5000 then
        setProperty("camGame.angle", 0)
        setProperty("camHUD.angle", 0)
    end
end
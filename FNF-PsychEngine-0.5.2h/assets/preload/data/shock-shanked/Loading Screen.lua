--Script Thanks For Perrobot64

local bg = 'FamilyScreen' -- don't touch this

local allowCountdown = false

function onStartCountdown() -- No countdown yet
    if not allowCountdown then
	    return Function_Stop
	end

	if allowCountdown then
	    return Function_Continue
	end
end

function onCreatePost() -- sprite loading
	makeLuaSprite('loadingBG', 'loading/'..bg, 0, 0)
	addLuaSprite('loadingBG', true)
        screenCenter('loadingBG', 'xy')
        setProperty('loadingBG.scale.x', 0.63)
	setProperty('loadingBG.scale.y', 0.67)
	setObjectCamera('loadingBG', 'camOther')

	makeAnimatedLuaSprite('bfRun', 'loading/loading_Time_bf', -170, 270)
	addAnimationByPrefix('bfRun', 'anim', 'bf running', 24, true)
	addLuaSprite('bfRun', true);
	setProperty('bfRun.scale.x', 0.3)
	setProperty('bfRun.scale.y', 0.3)
	setObjectCamera('bfRun','camOther')

	runTimer('fadeTimer', 6.0, 1)
end

function onTimerCompleted(tag) -- bye bye loading screen
    if tag == 'fadeTimer' then
	    doTweenAlpha('delete', 'loadingBG', 0, 0.5, 'backIn')
            doTweenAlpha('remove', 'bfRun', 0, 0.5, 'backIn')
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
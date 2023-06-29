-- Script by a dumbass you just watched from (HenrySMD)

local healthBarIsFlip = true
local stickThere = false

function onCreatePost()
      makeLuaSprite('Start', '', 0, 0);
      makeGraphic('Start',1280,720,'000000');
      setObjectCamera('Start', 'other');
      addLuaSprite('Start', true);

      makeLuaSprite('indicator', 'youplay', 140, 140);
      setObjectCamera('indicator', 'hud');
      scaleObject('indicator', 1, 1);
      addLuaSprite('indicator', false);
      setProperty('indicator.alpha', 0);

if downscroll then
      makeLuaSprite('indicator', 'youplay-downscroll', 140, 420);
      setObjectCamera('indicator', 'hud');
      scaleObject('indicator', 1, 1);
      addLuaSprite('indicator', false);
      setProperty('indicator.alpha', 0);
end

if downscroll and middlescroll then

      setProperty('indicator.x', 90);
end
end

function onSongStart()
     doTweenAlpha('graphicAlpha', 'Start', 0, 2, 'linear');
end

function onStepHit()
if curStep == 256 then
    doTweenAlpha('SignOutAlpha', 'indicator', 1, 0.8, 'linear');
end
if curStep == 300 then
    doTweenAlpha('SignInAlpha', 'indicator', 0, 1.5, 'linear');
end
end

function onTweenCompleted(tag)
    if tag == 'SignInAlpha' then
        removeLuaSprite('indicator', true);
    end
end

function onUpdate(elapsed)
 if curStep >= 256 then
	if healthBarIsFlip == true then -- if you want to flip the health bar or not (set to true to flip, set false will turn back to normal)
		setProperty('healthBar.flipX', true)

		if getProperty('health') < 2 then
			stickThere = false
		end

		if getProperty('health') >= 2 then
			stickThere = true
		end
	else
		setProperty('healthBar.flipX', false)
	end
end
end

function onUpdatePost()
if curStep >= 256 then
	if healthBarIsFlip == true then
		setProperty('iconP1.flipX', true)
		setProperty('iconP2.flipX', true)

		setProperty('iconP1.x',  285); --this is for the sara hud 
                setProperty('iconP2.x', screenWidth - 430);
          end
     end 
end

function onBeatHit()
if curBeat >= 127 and curBeat < 448 then
   if curBeat % 2 == 0 then
       triggerEvent('Add Camera Zoom', '0.045', '0.09');
     end
   end
end
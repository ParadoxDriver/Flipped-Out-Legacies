--codigo base hecho por stale
--codigo modificado por paradox

local allowCountdown = false
local seenDialogue = false
local endCutscene = false
local playWarning = false;
local warningimage = 'loading/Mechanics/TriggeredWarning'
local confirmed = 0;

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		seenDialogue = true;
		return Function_Stop;
	end
	if isStoryMode and seenDialogue and not endCutscene then
		startVideo('triggeredCutscene');
		removeLuaSprite('dialogueImage10')
                playWarning = true;
		runTimer('endCutscene',47);
		return Function_Stop;
elseif playWarning then
		runTimer('startWarning', 0);
		playWarning = false;
		return Function_Stop;
	end
        if allowCountdown then
	return Function_Continue;
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'forest');
	end
	if tag == 'endCutscene' and isStoryMode then -- Timer completed, play dialogue
		setProperty('inCutscene',false)
		endCutscene = true
  	end
        if tag == 'startWarning' then
		setProperty('warningimage.alpha', 1) -- Timer completed, play Warning
	end
        if tag == 'startcount' then -- Timer completed, start song
                 startCountdown()
        end
end

function onCreate()
if isStoryMode then
        makeLuaSprite('warningimage', warningimage, 0, 0)
        screenCenter('warningimage', 'xy')
        setObjectCamera('warningimage', 'other')
        setProperty('warningimage.alpha', 0)
        addLuaSprite('warningimage', true)

	makeLuaSprite('dialogueImage','dialogue/t1',0,0);
	setObjectCamera('dialogueImage','hud')
	addLuaSprite('dialogueImage',true)
		
	makeLuaSprite('dialogueImage2','dialogue/t2',0,0);
	setObjectCamera('dialogueImage2','hud')
	addLuaSprite('dialogueImage2',true)
	
	makeLuaSprite('dialogueImage3','dialogue/t3',0,0);
	setObjectCamera('dialogueImage3','hud')
	addLuaSprite('dialogueImage3',true)

	makeLuaSprite('dialogueImage4','dialogue/t4',0,0);
	setObjectCamera('dialogueImage4','hud')
	addLuaSprite('dialogueImage4',true)
	
	makeLuaSprite('dialogueImage5','dialogue/t5',0,0);
	setObjectCamera('dialogueImage5','hud')
	addLuaSprite('dialogueImage5',true)

	makeLuaSprite('dialogueImage6','dialogue/t6',0,0);
	setObjectCamera('dialogueImage6','hud')
	addLuaSprite('dialogueImage6',true)
		
	makeLuaSprite('dialogueImage7','dialogue/t7',0,0);
	setObjectCamera('dialogueImage7','hud')
	addLuaSprite('dialogueImage7',true)
	
	makeLuaSprite('dialogueImage8','dialogue/t8',0,0);
	setObjectCamera('dialogueImage8','hud')
	addLuaSprite('dialogueImage8',true)

	makeLuaSprite('dialogueImage9','dialogue/t9',0,0);
	setObjectCamera('dialogueImage9','hud')
	addLuaSprite('dialogueImage9',true)
	
	makeLuaSprite('dialogueImage10','dialogue/t10',0,0);
	setObjectCamera('dialogueImage10','hud')
	addLuaSprite('dialogueImage10',true)

	setProperty('dialogueImage.visible',true)
	setProperty('dialogueImage2.visible',false)
	setProperty('dialogueImage3.visible',false)
	setProperty('dialogueImage4.visible',false)
	setProperty('dialogueImage5.visible',false)
	setProperty('dialogueImage6.visible',false)
	setProperty('dialogueImage7.visible',false)
	setProperty('dialogueImage8.visible',false)
	setProperty('dialogueImage9.visible',false)
	setProperty('dialogueImage10.visible',false)
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count) -- triggered when the next dialogue line starts, 'line' starts with 1
	if count == 1 then
	removeLuaSprite('dialogueImage')
	setProperty('dialogueImage2.visible',true)
	elseif count == 2 then
	removeLuaSprite('dialogueImage2')
	setProperty('dialogueImage3.visible',true)
	elseif count == 3 then
	removeLuaSprite('dialogueImage3')
	setProperty('dialogueImage4.visible',true)
	elseif count == 4 then
	removeLuaSprite('dialogueImage4')
	setProperty('dialogueImage5.visible',true)
	elseif count == 5 then
	removeLuaSprite('dialogueImage5')
	setProperty('dialogueImage6.visible',true)
	elseif count == 7 then
	removeLuaSprite('dialogueImage6')
	setProperty('dialogueImage7.visible',true)
	elseif count == 8 then
	removeLuaSprite('dialogueImage7')
	setProperty('dialogueImage8.visible',true)
	elseif count == 9 then
	removeLuaSprite('dialogueImage8')
	setProperty('dialogueImage9.visible',true)
	elseif count == 10 then
	removeLuaSprite('dialogueImage9')
	setProperty('dialogueImage10.visible',true)
	end
	
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end


function onUpdate() --triggered when you press Space Remove Warning
if isStoryMode then
   if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and confirmed == 0 then
   runTimer('startcount', 1);
   doTweenAlpha('nomorewarningimage', 'warningimage', 0, 1, sineOut);
   playSound('confirmMenu');
   confirmed = 1
end
end
end
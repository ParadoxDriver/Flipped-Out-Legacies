local allowCountdown = false;
local playWarning = false;
local warningimage = 'loading/Mechanics/DisclosedWarning'
local confirmed = 0;

function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('disclosedCutscene');
                allowCountdown = true;
                playWarning = true;
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
	if tag == 'startWarning' then
		setProperty('warningimage.alpha', 1)
	end
        if tag == 'startcount' then
                 startCountdown()
        end
end

function onCreate()
if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
	setPropertyFromClass('ClientPrefs', 'middleScroll', false);
end
       makeLuaSprite('Start', '', 0, 0);
       makeGraphic('Start',1280,720,'000000');
       setObjectCamera('Start', 'other');
       setProperty('Start.alpha', 1);
       addLuaSprite('Start', true);

       makeLuaSprite('warning', 'loading/Messages/Efecto Mandela',110,690);
       addLuaSprite('warning',true);
       setProperty('warning.scale.x', 0.70);
       setProperty('warning.scale.y', 0.70);
       setObjectCamera('warning','other');

if isStoryMode then
       makeLuaSprite('warningimage', warningimage, 0, 0);
       screenCenter('warningimage', 'xy');
       setObjectCamera('warningimage', 'other');
       setProperty('warningimage.alpha', 0);
       addLuaSprite('warningimage', true);
end
end

function onDestroy()
	if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
		setPropertyFromClass('ClientPrefs', 'middleScroll', false);
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
	end
end

function onCountdownStarted()
       setProperty('dadGroup.visible', false);
       setProperty('funnicube.visible', false);
       setProperty('deathHB.visible', false);
       setProperty('healthBarWithAnim.visible', false);
       setProperty('ratings.visible', false);
       setProperty('songWM.visible', false);
       setProperty('healthText.visible', false);

       setProperty('timeTxt.visible', false);
       setProperty('timeBar.visible', false);
       setProperty('timeBarBG.visible', false);
       setProperty('healthText.visible', false);

--this if for activated hide hud
       setProperty('iconP1.alpha', 0);
       setProperty('iconP2.alpha', 0);
       setProperty('healthBar.alpha', 0);
       setProperty('healthBarBG.alpha', 0);
       setProperty('scoreTxt.alpha', 0);

--si lees esto ten un buen dia :)
       setProperty('underlay.visible', false);
       setProperty('ComboText.visible', false);
       setProperty('SicksText.visible', false);
       setProperty('GoodsText.visible', false);
       setProperty('BadsText.visible', false);
       setProperty('ShitsText.visible', false);
       setProperty('MissText.visible', false);
end

local defaultNotePos = {}
local spin = 7 -- how much it moves before going the other direction
 
function onSongStart()
    for i = 0, 7 do
        defaultNotePos[i] = {
            getPropertyFromGroup('strumLineNotes', i, 'x'),
            getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
           doTweenAlpha('graphicAlpha', 'Start', 0, 100, 'quintOut');
    end

function onUpdate(elapsed)
if isStoryMode then
   if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and confirmed == 0 then
   runTimer('startcount', 1);
   doTweenAlpha('nomorewarningimage', 'warningimage', 0, 1, sineOut);
   playSound('confirmMenu');
   confirmed = 1
end
end
    local songPos = getPropertyFromClass('Conductor', 'songPosition') / 1000 --How long it will take.
    
    if curStep >= 576 and curStep < 832 or curStep >= 1216 and curStep < 1583 then 
        setProperty("camHUD.angle", spin * math.sin(songPos))
    end
    
     if curStep == 832 or curStep == 1583 then
        setProperty("camHUD.angle", 0)
    end
    misses = getProperty('songMisses')
	if misses >5 then
		setProperty('health', 0)
    end
end

--function onUpdatePost()
        --setTextString('MissText', 'Miss: 5/ ' .. getProperty('songMisses'))
--end

function onStepHit()
if curStep == 1 then 
        dadStrumsAlpha(0);
end

if curStep == 7 then  
        doTweenY('showup','warning', 250, 5, 'cubeOut')
end

if curStep == 75 then
        doTweenAlpha('bye','warning',0,2,'cubeOut')
end

if curStep == 127 then
        triggerEvent('Sexy Zoom', '1', '');
end

if curStep == 264 then
        bfStrumsAlpha(0);
        triggerEvent('Sexy Zoom', '0', '');
end

if curStep == 320 then
        setProperty('dadGroup.visible', true);
        dadStrumsAlpha(1);
        bfStrumsAlpha(1);

        setProperty('funnicube.visible', true);
        setProperty('deathHB.visible', true);
        setProperty('healthBarWithAnim.visible', true);
        setProperty('ratings.visible', true);
        setProperty('songWM.visible', true);
        setProperty('healthText.visible', true);

        setProperty('timeTxt.visible', true);
        setProperty('timeBar.visible', true);
        setProperty('timeBarBG.visible', true);
        setProperty('healthText.visible', true);

        setProperty('iconP1.alpha', 1);
        setProperty('iconP2.alpha', 1);
        setProperty('healthBar.alpha', 1);
        setProperty('healthBarBG.alpha', 1);
        setProperty('scoreTxt.alpha', 1);
 
        setProperty('underlay.visible', true);
        setProperty('ComboText.visible', true);
        setProperty('SicksText.visible', true);
        setProperty('GoodsText.visible', true);
        setProperty('BadsText.visible', true);
        setProperty('ShitsText.visible', true);
        setProperty('MissText.visible', true);
end 

if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
if curStep == 320 then
        setProperty('dadGroup.visible', true);
        dadStrumsAlpha(0.5);
        bfStrumsAlpha(1);

       setProperty('funnicube.visible', true);
       setProperty('deathHB.visible', true);
       setProperty('healthBarWithAnim.visible', true);
       setProperty('ratings.visible', true);
       setProperty('songWM.visible', true);
       setProperty('healthText.visible', true);

       setProperty('timeTxt.visible', true);
       setProperty('timeBar.visible', true);
       setProperty('timeBarBG.visible', true);
       setProperty('healthText.visible', true);

       setProperty('iconP1.alpha', 1);
       setProperty('iconP2.alpha', 1);
       setProperty('healthBar.alpha', 1);
       setProperty('healthBarBG.alpha', 1);
       setProperty('scoreTxt.alpha', 1);

       setProperty('underlay.visible', true);
       setProperty('ComboText.visible', true);
       setProperty('SicksText.visible', true);
       setProperty('GoodsText.visible', true);
       setProperty('BadsText.visible', true);
       setProperty('ShitsText.visible', true);
       setProperty('MissText.visible', true);
end
end

if curStep == 1600 then
       setTextString('botplayTxt', 'INSANITY');
     --setPropertyFromClass('ClientPrefs', 'camZooms', false)
end

if curStep >= 1600 and curStep < 1839 then
      cameraShake('game', 0.0025, 0.4)
end

if curStep == 1839 then
       setTextString('botplayTxt', 'BOTPLAY');
     --setPropertyFromClass('ClientPrefs', 'camZooms', true)
end

if curStep == 1968 then
       doTweenAlpha('cooloutline', 'BlackBords', 1, 0.4, 'linear');
end

if curStep == 1983 then
       doTweenAlpha('cooloutline', 'BlackBords', 0.85, 0.4, 'linear');
end

if curStep == 2096 then
       doTweenAlpha('cooloutline', 'BlackBords', 1, 0.4, 'linear');
end

if curStep == 2111 then
     --setPropertyFromClass('ClientPrefs', 'camZooms', false)
       doTweenAlpha('cooloutline', 'BlackBords', 0.85, 0.4, 'linear');
end

if curStep == 2496 then
     --setPropertyFromClass('ClientPrefs', 'camZooms', true)
end

if curStep >= 2367 and curStep < 2391 or curStep >= 2399 and curStep < 2422 or curStep >= 2431 and curStep < 2455 or curStep >= 2464 and curStep < 2487 then
      triggerEvent('Add Camera Zoom', '0.015', '0.03');
end

if curStep >= 2496 and curStep < 2624 then
      cameraShake('hud', 0.0035, 0.4)
      cameraShake('game', 0.0035, 0.4)
end

if curStep == 2819 then
      doTweenAlpha('graphicAlpha', 'Start', 4, 20, 'linear');
end
end

function onBeatHit()
if curBeat >= 527 and curBeat < 591 then
   if curBeat % 1 == 0 then
       triggerEvent('Add Camera Zoom', '0.05', '0.05');
     end
   end
end

function dadStrumsAlpha(a)
	for i = 0, getProperty('opponentStrums.length') - 1 do
		setPropertyFromGroup('opponentStrums', i, 'alpha', a);
	end
end

function bfStrumsAlpha(a)
	for i = 0, getProperty('playerStrums.length') - 1 do
		setPropertyFromGroup('playerStrums', i, 'alpha', a);
	end
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.0127);
    end
end
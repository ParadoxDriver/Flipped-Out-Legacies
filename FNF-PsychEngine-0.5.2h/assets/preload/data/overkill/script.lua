function onCreate()
        makeLuaSprite('redbg', '', 0, 0);
        makeGraphic('redbg',1280,720,'FF0000');
	setLuaSpriteScrollFactor('redbg', 1, 1);
        screenCenter('redbg', 'xy');
        setProperty('redbg.scale.x', 5.5);
	setProperty('redbg.scale.y', 5.5);
        setProperty('redbg.alpha', 0);
        addLuaSprite('redbg', false);

        makeLuaSprite('Start', '', 0, 0);
        makeGraphic('Start',1280,720,'000000');
        setObjectCamera('Start', 'other');
        setProperty('Start.alpha', 1);
        addLuaSprite('Start', true);

        makeLuaSprite('BlackBords', 'cooloutline', 0, 0);
        setObjectCamera('BlackBords', 'other');
        setProperty('BlackBords.alpha', 0);
	addLuaSprite('BlackBords', true);

        setProperty('skipCountdown', true)
end

local defaultNotePos = {}
local spin = 6 -- how much it moves before going the other direction
 
function onSongStart()
    for i = 0, 7 do
        defaultNotePos[i] = {
            getPropertyFromGroup('strumLineNotes', i, 'x'),
            getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
end

function onUpdate(elapsed)
    local songPos = getPropertyFromClass('Conductor', 'songPosition') / 1000 --How long it will take.
    
    if curStep >= 3072 and curStep < 3583 then 
        setProperty("camHUD.angle", spin * math.sin(songPos))
    end
    
     if curStep == 3583 then
        setProperty("camHUD.angle", 0)
    end
end

function onCountdownStarted()
      doTweenAlpha('graphicAlpha', 'Start', 0, 11, 'linear');
      setProperty("camHUD.alpha", 0);
end

function onStepHit()
if curStep == 129 then

       setProperty('BlackBords.alpha', 1);
end

if curStep == 384 then

      setProperty('BlackBords.alpha', 0);
      setProperty("camHUD.alpha", 1);
end

if curStep == 2432 then

      noteTweenAlpha('noteDAD0', 0, 0, 2, 'linear');
      noteTweenAlpha('noteDAD1', 1, 0, 2, 'linear');
      noteTweenAlpha('noteDAD2', 2, 0, 2, 'linear');
      noteTweenAlpha('noteDAD3', 3, 0, 2, 'linear');

      noteTweenAlpha('noteBF4', 4, 0, 2, 'linear');
      noteTweenAlpha('noteBF5', 5, 0, 2, 'linear');
      noteTweenAlpha('noteBF6', 6, 0, 2, 'linear');
      noteTweenAlpha('noteBF7', 7, 0, 2, 'linear');

      setProperty('funnicube.visible', false);
      setProperty('healthBarWithAnim.visible', false);
      setProperty('bloodedHB.visible', false);
      setProperty('ratings.visible', false);
      setProperty('songWM.visible', false);
      setProperty('healthText.visible', false);

--this if for activated hide hud or disabled timebar
      setProperty('timeTxt.alpha', 0);
      setProperty('timeBar.alpha', 0);
      setProperty('timeBarBG.alpha', 0);
      setProperty('timeCool.alpha', 0);

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

if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
if curStep == 2560 then

      noteTweenAlpha('noteDAD0', 0, 1, 0.7, 'linear');
      noteTweenAlpha('noteDAD1', 1, 1, 0.7, 'linear');
      noteTweenAlpha('noteDAD2', 2, 1, 0.7, 'linear');
      noteTweenAlpha('noteDAD3', 3, 1, 0.7, 'linear');

      noteTweenAlpha('noteBF4', 4, 1, 0.7, 'linear');
      noteTweenAlpha('noteBF5', 5, 1, 0.7, 'linear');
      noteTweenAlpha('noteBF6', 6, 1, 0.7, 'linear');
      noteTweenAlpha('noteBF7', 7, 1, 0.7, 'linear');

      setProperty('timeBar.color', getColorFromHex('E80A0A'))
      setProperty('timeTxt.color', getColorFromHex('E80A0A'))
      setProperty('scoreTxt.color', getColorFromHex('E80A0A'))
      setProperty('botplayTxt.color', getColorFromHex('E80A0A'))
      setProperty('healthText.color', getColorFromHex('E80A0A'))
      setProperty('songWM.color', getColorFromHex('E80A0A'))  
        
      setProperty('underlay.color', getColorFromHex('E80A0A'))
      setProperty('ComboText.color', getColorFromHex('E80A0A'))  
      setProperty('SicksText.color', getColorFromHex('E80A0A'))
      setProperty('GoodsText.color', getColorFromHex('E80A0A'))
      setProperty('BadsText.color', getColorFromHex('E80A0A'))
      setProperty('ShitsText.color', getColorFromHex('E80A0A'))
      setProperty('MissText.color', getColorFromHex('E80A0A'))
end  
end


if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
if curStep == 2560 then

      noteTweenAlpha('noteDAD0', 0, 0.5, 0.7, 'linear');
      noteTweenAlpha('noteDAD1', 1, 0.5, 0.7, 'linear');
      noteTweenAlpha('noteDAD2', 2, 0.5, 0.7, 'linear');
      noteTweenAlpha('noteDAD3', 3, 0.5, 0.7, 'linear');

      noteTweenAlpha('noteBF4', 4, 1, 0.7, 'linear');
      noteTweenAlpha('noteBF5', 5, 1, 0.7, 'linear');
      noteTweenAlpha('noteBF6', 6, 1, 0.7, 'linear');
      noteTweenAlpha('noteBF7', 7, 1, 0.7, 'linear');

      setProperty('timeBar.color', getColorFromHex('E80A0A'))
      setProperty('timeTxt.color', getColorFromHex('E80A0A'))
      setProperty('scoreTxt.color', getColorFromHex('E80A0A'))
      setProperty('botplayTxt.color', getColorFromHex('E80A0A'))
      setProperty('healthText.color', getColorFromHex('E80A0A'))
      setProperty('songWM.color', getColorFromHex('E80A0A'))  
        
      setProperty('underlay.color', getColorFromHex('E80A0A'))
      setProperty('ComboText.color', getColorFromHex('E80A0A'))  
      setProperty('SicksText.color', getColorFromHex('E80A0A'))
      setProperty('GoodsText.color', getColorFromHex('E80A0A'))
      setProperty('BadsText.color', getColorFromHex('E80A0A'))
      setProperty('ShitsText.color', getColorFromHex('E80A0A'))
      setProperty('MissText.color', getColorFromHex('E80A0A'))
end  
end

if curStep == 2560 then

      setProperty('redbg.alpha', 1);
      setProperty('lights.alpha', 0);
      doTweenColor('flippy', 'dad', '000000', 0.001);
      doTweenColor('tiger', 'boyfriend', '000000', 0.001);
end

if curStep == 2816 then

      setProperty('redbg.alpha', 0);
      setProperty('lights.alpha', 1);
      doTweenColor('flippy', 'dad', 'FFFFFF', 0.001);
      doTweenColor('tiger', 'boyfriend', 'FFFFFF', 0.001);
      setProperty('lights.alpha', 1);

      setProperty('funnicube.visible', true);
      setProperty('healthBarWithAnim.visible', true);
      setProperty('bloodedHB.visible', true);
      setProperty('ratings.visible', true);
      setProperty('songWM.visible', true);
      setProperty('healthText.visible', true);

      setProperty('timeTxt.alpha', 1);
      setProperty('timeBar.alpha', 1);
      setProperty('timeBarBG.alpha', 1);
      setProperty('timeCool.alpha', 1);

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

if curStep >= 2560 and curStep < 3071 then

      triggerEvent('Screen Shake', '0.25, 0.006', '0.25, 0.006');
end

if curStep == 3584 then

      setProperty('BlackBords.alpha', 1);

      doTweenAlpha('funnicube', 'funnicube', 0, 3.2, 'linear');
      doTweenAlpha('scoreTxt', 'scoreTxt', 0, 3.2, 'linear');
      doTweenAlpha('timeTxt',  'timeTxt', 0, 3.2, 'linear');
      doTweenAlpha('timeBar', 'timeBar', 0, 3.2, 'linear');
      doTweenAlpha('timeBarBG', 'timeBarBG', 0, 3.2, 'linear');
 
      doTweenAlpha('underlay', 'underlay', 0, 3.2, 'linear');
      doTweenAlpha('ComboText', 'ComboText', 0, 3.2, 'linear');
      doTweenAlpha('SicksText', 'SicksText', 0, 3.2, 'linear');
      doTweenAlpha('GoodsText', 'GoodsText', 0, 3.2, 'linear');
      doTweenAlpha('BadsText', 'BadsText', 0, 3.2, 'linear');
      doTweenAlpha('ShitsText', 'ShitsText', 0, 3.2, 'linear');
      doTweenAlpha('MissText',  'MissText', 0, 3.2, 'linear');

      doTweenAlpha('ratings', 'ratings', 0, 3.2, 'linear');
      doTweenAlpha('healthText', 'healthText', 0, 3.2, 'linear');
      doTweenAlpha('songWM', 'songWM', 0, 3.2, 'linear');
      doTweenAlpha('iconP1', 'iconP1', 0, 3.2, 'linear');
      doTweenAlpha('iconP2',  'iconP2', 0, 3.2, 'linear');
      doTweenAlpha('bloodedHB', 'bloodedHB', 0, 3.2, 'linear');
      doTweenAlpha('healthBarBG', 'healthBarBG', 0, 3.2, 'linear');
      doTweenAlpha('healthBar', 'healthBar', 0, 3.2, 'linear');
      doTweenAlpha('healthBarWithAnim', 'healthBarWithAnim', 0, 3.2, 'linear');

      noteTweenAlpha('noteDAD0', 0, 0, 3.2, 'linear');
      noteTweenAlpha('noteDAD1', 1, 0, 3.2, 'linear');
      noteTweenAlpha('noteDAD2', 2, 0, 3.2, 'linear');
      noteTweenAlpha('noteDAD3', 3, 0, 3.2, 'linear');

      noteTweenAlpha('noteBF4', 4, 0, 3.2, 'linear');
      noteTweenAlpha('noteBF5', 5, 0, 3.2, 'linear');
      noteTweenAlpha('noteBF6', 6, 0, 3.2, 'linear');
      noteTweenAlpha('noteBF7', 7, 0, 3.2, 'linear');
end
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.0117);
    end
end
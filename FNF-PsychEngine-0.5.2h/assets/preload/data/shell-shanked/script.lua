function onCreate()
     makeLuaSprite('Black', '', 0, 0);
     makeGraphic('Black',1280,720,'000000');
     setObjectCamera('Black', 'other');
     setProperty('Black.alpha', 0);
     addLuaSprite('Black', true);
end

function onStepHit()
if curStep >= 512 and curStep < 640 or curStep >= 1023 and curStep < 1296 or curStep >= 1408 and curStep < 1696 then
     cameraShake('camGame', 0.0008, 0.4)
     cameraShake('camHUD', 0.0008, 0.4)
end
if curStep == 767 then
     setProperty('defaultCamZoom', 0.75);
   --setPropertyFromClass('ClientPrefs', 'camZooms', false)
end
if curStep == 1024 then
     setProperty('defaultCamZoom', 0.65);
   --setPropertyFromClass('ClientPrefs', 'camZooms', true)
end
if curStep == 1280 then
--Strum Player and opponent
     noteTweenAlpha('noteDAD0', 0, 0, 1.4, 'linear');
     noteTweenAlpha('noteDAD1', 1, 0, 1.4, 'linear');
     noteTweenAlpha('noteDAD2', 2, 0, 1.4, 'linear');
     noteTweenAlpha('noteDAD3', 3, 0, 1.4, 'linear');

     noteTweenAlpha('noteBF4', 4, 0, 1.4, 'linear');
     noteTweenAlpha('noteBF5', 5, 0, 1.4, 'linear');
     noteTweenAlpha('noteBF6', 6, 0, 1.4, 'linear');
     noteTweenAlpha('noteBF7', 7, 0, 1.4, 'linear');

--timeBar Settings
     doTweenAlpha('timeTxt.Alpha', 'timeTxt', 0, 1.4, 'linear');
     doTweenAlpha('timeBar.Alpha', 'timeBar', 0, 1.4, 'linear');
     doTweenAlpha('timeBarBG.Alpha', 'timeBarBG', 0, 1.4, 'linear');

--healthBar Settings
     doTweenAlpha('songWM.Alpha', 'songWM', 0, 1.4, 'linear');
     doTweenAlpha('healthText.Alpha', 'healthText', 0, 1.4, 'linear');
     doTweenAlpha('iconP1', 'iconP1', 0, 1.4, 'linear');
     doTweenAlpha('iconP2', 'iconP2', 0, 1.4, 'linear');
     doTweenAlpha('healthBarBG', 'healthBarBG', 0, 1.4, 'linear');
     doTweenAlpha('healthBar', 'healthBar', 0, 1.4, 'linear');
     doTweenAlpha('bloodedHB', 'bloodedHB', 0, 1.4, 'linear');
     doTweenAlpha('healthBarWithAnim.Alpha', 'healthBarWithAnim', 0, 1.4, 'linear');
     doTweenAlpha('scoreTxt', 'scoreTxt', 0, 1.4, 'linear');
     doTweenAlpha('funnicube', 'funnicube', 0, 1.4, 'linear');

--Legacy Counter 
     doTweenAlpha('ratings', 'ratings', 0, 1.4, 'linear');
     doTweenAlpha('underlay', 'underlay', 0, 1.4, 'linear');
     doTweenAlpha('ComboText', 'ComboText', 0, 1.4, 'linear');
     doTweenAlpha('SicksText',  'SicksText', 0, 1.4, 'linear');
     doTweenAlpha('GoodsText', 'GoodsText', 0, 1.4, 'linear');
     doTweenAlpha('BadsText', 'BadsText', 0, 1.4, 'linear');
     doTweenAlpha('ShitsText', 'ShitsText', 0, 1.4, 'linear');
     doTweenAlpha('MissText',  'MissText', 0, 1.4, 'linear');
end 
if curStep == 1394 then
     setProperty('camGame.visible', false);
end 
if curStep == 1407 then
     setProperty('camGame.visible', true);

--Strum Player and opponent
     noteTweenAlpha('noteDAD0', 0, 1, 0.9, 'linear');
     noteTweenAlpha('noteDAD1', 1, 1, 0.9, 'linear');
     noteTweenAlpha('noteDAD2', 2, 1, 0.9, 'linear');
     noteTweenAlpha('noteDAD3', 3, 1, 0.9, 'linear');

     noteTweenAlpha('noteBF4', 4, 1, 0.9, 'linear');
     noteTweenAlpha('noteBF5', 5, 1, 0.9, 'linear');
     noteTweenAlpha('noteBF6', 6, 1, 0.9, 'linear');
     noteTweenAlpha('noteBF7', 7, 1, 0.9, 'linear');

--timeBar Settings
     doTweenAlpha('timeTxt.Alpha', 'timeTxt', 1, 0.9, 'linear');
     doTweenAlpha('timeBar.Alpha', 'timeBar', 1, 0.9, 'linear');
     doTweenAlpha('timeBarBG.Alpha', 'timeBarBG', 1, 0.9, 'linear');

--healthBar Settings
     doTweenAlpha('songWM.Alpha', 'songWM', 1, 0.9, 'linear');
     doTweenAlpha('healthText.Alpha', 'healthText', 1, 0.9, 'linear');
     doTweenAlpha('iconP1', 'iconP1', 1, 0.9, 'linear');
     doTweenAlpha('iconP2', 'iconP2', 1, 0.9, 'linear');
     doTweenAlpha('healthBarBG', 'healthBarBG', 1, 0.9, 'linear');
     doTweenAlpha('healthBar', 'healthBar', 1, 0.9, 'linear');
     doTweenAlpha('bloodedHB', 'bloodedHB', 1, 0.9, 'linear');
     doTweenAlpha('healthBarWithAnim.Alpha', 'healthBarWithAnim', 1, 0.9, 'linear');
     doTweenAlpha('scoreTxt', 'scoreTxt', 1, 0.9, 'linear');
     doTweenAlpha('funnicube', 'funnicube', 0.5, 0.9, 'linear');

--Legacy Counter 
     doTweenAlpha('ratings', 'ratings', 1, 0.9, 'linear');
     doTweenAlpha('underlay', 'underlay', 0.6, 0.9, 'linear');
     doTweenAlpha('ComboText', 'ComboText', 1, 0.9, 'linear');
     doTweenAlpha('SicksText',  'SicksText', 1, 0.9, 'linear');
     doTweenAlpha('GoodsText', 'GoodsText', 1, 0.9, 'linear');
     doTweenAlpha('BadsText', 'BadsText', 1, 0.9, 'linear');
     doTweenAlpha('ShitsText', 'ShitsText', 1, 0.9, 'linear');
     doTweenAlpha('MissText',  'MissText', 1, 0.9, 'linear');
end 
if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
if curStep == 1407 then
     setProperty('camGame.visible', true);

--Strum Player and opponent
     noteTweenAlpha('noteDAD0', 0, 0.5, 0.9, 'linear');
     noteTweenAlpha('noteDAD1', 1, 0.5, 0.9, 'linear');
     noteTweenAlpha('noteDAD2', 2, 0.5, 0.9, 'linear');
     noteTweenAlpha('noteDAD3', 3, 0.5, 0.9, 'linear');

     noteTweenAlpha('noteBF4', 4, 1, 0.9, 'linear');
     noteTweenAlpha('noteBF5', 5, 1, 0.9, 'linear');
     noteTweenAlpha('noteBF6', 6, 1, 0.9, 'linear');
     noteTweenAlpha('noteBF7', 7, 1, 0.9, 'linear');

--timeBar Settings
     doTweenAlpha('timeTxt.Alpha', 'timeTxt', 1, 0.9, 'linear');
     doTweenAlpha('timeBar.Alpha', 'timeBar', 1, 0.9, 'linear');
     doTweenAlpha('timeBarBG.Alpha', 'timeBarBG', 1, 0.9, 'linear');

--healthBar Settings
     doTweenAlpha('songWM.Alpha', 'songWM', 1, 0.9, 'linear');
     doTweenAlpha('healthText.Alpha', 'healthText', 1, 0.9, 'linear');
     doTweenAlpha('iconP1', 'iconP1', 1, 0.9, 'linear');
     doTweenAlpha('iconP2', 'iconP2', 1, 0.9, 'linear');
     doTweenAlpha('healthBarBG', 'healthBarBG', 1, 0.9, 'linear');
     doTweenAlpha('healthBar', 'healthBar', 1, 0.9, 'linear');
     doTweenAlpha('bloodedHB', 'bloodedHB', 1, 0.9, 'linear');
     doTweenAlpha('healthBarWithAnim.Alpha', 'healthBarWithAnim', 1, 0.9, 'linear');
     doTweenAlpha('scoreTxt', 'scoreTxt', 1, 0.9, 'linear');
     doTweenAlpha('funnicube', 'funnicube', 0.5, 0.9, 'linear');

--Legacy Counter 
     doTweenAlpha('ratings', 'ratings', 1, 0.9, 'linear');
     doTweenAlpha('underlay', 'underlay', 0.6, 0.9, 'linear');
     doTweenAlpha('ComboText', 'ComboText', 1, 0.9, 'linear');
     doTweenAlpha('SicksText',  'SicksText', 1, 0.9, 'linear');
     doTweenAlpha('GoodsText', 'GoodsText', 1, 0.9, 'linear');
     doTweenAlpha('BadsText', 'BadsText', 1, 0.9, 'linear');
     doTweenAlpha('ShitsText', 'ShitsText', 1, 0.9, 'linear');
     doTweenAlpha('MissText',  'MissText', 1, 0.9, 'linear');
end 
end
if curStep == 1782 then
     doTweenAlpha('fadeScreen',  'Black', 4, 20, 'linear');--no utilizo el fade camGame porque no me gusta el como se va desvaneciendo la camara
end
end

function opponentNoteHit()
 health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end
end
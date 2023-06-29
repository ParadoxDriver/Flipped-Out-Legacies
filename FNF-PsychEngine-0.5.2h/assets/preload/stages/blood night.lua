local xx = 340;
local yy = 580;
local xx2 = 750;
local yy2 = 540;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-carry');

	makeLuaSprite('sky', 'Flippy/Fallout/Sky', -600, -225);
	setScrollFactor('sky', 0.5, 0.5);
        addLuaSprite('sky', false);

        makeAnimatedLuaSprite('smoke', 'Flippy/Fallout/SmokeRight', 500, -260);
	luaSpriteAddAnimationByPrefix('smoke', 'idle', 'SmokeRight instance', 24, true);
        objectPlayAnimation('smoke', 'smoke');
	setProperty('smoke.scale.x', 0.5);
	setProperty('smoke.scale.y', 0.5);
        addLuaSprite('smoke', false);

	makeLuaSprite('backTrees', 'Flippy/Fallout/BackTrees', -625, -200);
	setScrollFactor('backTrees', 0.7, 0.7);
        addLuaSprite('backTrees', false);

        makeAnimatedLuaSprite('foggy', 'Flippy/Fallout/fog',  -3000,  100);
	luaSpriteAddAnimationByPrefix('foggy', 'idle', 'nieblal', 30, true);
	setScrollFactor('foggy', 1.0, 1.0);
        addLuaSprite('foggy', false);

        makeAnimatedLuaSprite('misty', 'Flippy/Fallout/fog',  -3000,  100);
	luaSpriteAddAnimationByPrefix('misty', 'idle', 'nieblal', 30, true);
	setScrollFactor('misty', 1.0, 1.0);
        setPropertyLuaSprite('misty', 'flipX', true);
        addLuaSprite('misty', false); 

	makeLuaSprite('trees', 'Flippy/Fallout/Trees', -625, -225);
	setScrollFactor('trees', 0.8, 0.8);
        addLuaSprite('trees', false);
	
	makeLuaSprite('ground', 'Flippy/Fallout/Ground', -700, -150);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false);
	
	makeAnimatedLuaSprite('boombox', 'Flippy/Fallout/Speaker', 925, 515);
	luaSpriteAddAnimationByPrefix('boombox', 'bop', 'boombox', 16, true);
	setScrollFactor('boombox', 1.0, 1.0);
        addLuaSprite('boombox', false);
	
	makeAnimatedLuaSprite('Flaky', 'Flippy/Fallout/Scared_Flaky', 1450, 570);
	luaSpriteAddAnimationByPrefix('Flaky', 'bop', 'Flaky', 16, true);
	setScrollFactor('Flaky', 1.0, 1.0);
        addLuaSprite('Flaky', false);

        makeAnimatedLuaSprite('speaker', 'Flippy/Fallout/MiniSpeaker', 925, 515);
	luaSpriteAddAnimationByPrefix('speaker', 'bop', 'boombox', 16, true);
	setScrollFactor('speaker', 1.0, 1.0);
        addLuaSprite('speaker', true);

        makeAnimatedLuaSprite('nieblal', 'Flippy/Fallout/fog',  -3000,  450);
	luaSpriteAddAnimationByPrefix('nieblal', 'idle', 'nieblal', 30, true);
	setScrollFactor('nieblal', 1.0, 1.0);
        addLuaSprite('nieblal', true); 

        makeAnimatedLuaSprite('fog', 'Flippy/Fallout/fog',  -3000,  450);
	luaSpriteAddAnimationByPrefix('fog', 'idle', 'nieblal', 30, true);
	setScrollFactor('fog', 1.0, 1.0);
        setPropertyLuaSprite('fog', 'flipX', true);
        addLuaSprite('fog', true);

        makeAnimatedLuaSprite('campfire', 'Flippy/Hunter/Fire', 500, 360);
	luaSpriteAddAnimationByPrefix('campfire', 'bop', 'fire idle', 10, true);
	setScrollFactor('campfire', 1.0, 1.0);
        setProperty('campfire.alpha', 0.8);
        addLuaSprite('campfire', false);

if not lowQuality then
	makeLuaSprite('table', 'Flippy/Fallout/Table', -850, -200);
        setProperty('table.scale.x', 1.1);
	setProperty('table.scale.y', 1.2);
	setScrollFactor('table', 1.3, 1.3);
        addLuaSprite('table', true);
end
        makeAnimatedLuaSprite('rain', 'Flippy/Hunter/rain', -1200, -400);
        luaSpriteAddAnimationByPrefix('rain', 'rainanim', 'rainanim', 24, true);
        setProperty('rain.alpha', 0.85);
        setProperty('rain.scale.x', 2.5);
	setProperty('rain.scale.y', 2.5);
        addLuaSprite('rain', true); 

if hideHud == false then
        makeLuaSprite('bloodedHB', 'HealthBar-Skins/healthBar2', -50, -200);
	setObjectCamera('bloodedHB', 'hud');
	setScrollFactor('bloodedHB', 0.9, 0.9);
	addLuaSprite('bloodedHB', true); 
end
        makeLuaSprite('shadow', 'vinetca', -640, -300);
        setObjectCamera('shadow', 'other'); 
        setProperty('shadow.scale.x', 0.5);
	setProperty('shadow.scale.y', 0.6);
        addLuaSprite('shadow', false);

        makeLuaSprite('Start', '', 0, 0);
	makeGraphic('Start',1280,720,'000000');
	setObjectCamera('Start', 'other');
        setProperty('Start.alpha', 1);
	addLuaSprite('Start', true);

        setProperty('foggy.visible', false);
        setProperty('misty.visible', false);
        setProperty('nieblal.visible', false);
        setProperty('fog.visible', false);	
        setProperty('rain.visible', false);

if songName == 'In-The-End' then
        setProperty('foggy.visible', true);
        setProperty('misty.visible', true);
        setProperty('nieblal.visible', true);
        setProperty('fog.visible', true);	
        setProperty('rain.visible', true);
end

--Flashback bg
        makeLuaSprite('sky2', 'Flippy/Fallout/FlashBack/background', -600, -225);
        setScrollFactor('sky2', 0.5, 0.5);
        addLuaSprite('sky2', false);

	makeLuaSprite('backtrees2', 'Flippy/Fallout/FlashBack/backtrees', -625, -200);
        setScrollFactor('backtrees2', 0.7, 0.7);
        addLuaSprite('backtrees2', false);

	makeLuaSprite('ground2', 'Flippy/Fallout/FlashBack/ground', -700, -150);
        setScrollFactor('ground2', 1.0, 1.0);
        addLuaSprite('ground2', false);

	makeLuaSprite('buddies', 'Flippy/Fallout/FlashBack/buddies', -700, -150);	
	setScrollFactor('buddies', 1.0, 1.0);
	addLuaSprite('buddies', true);

        makeAnimatedLuaSprite('vhsoverlay', 'Effects/vhs', -100, -40);
	addAnimationByPrefix('vhsoverlay', 'vhs', 'vhs', 24, true);
	setObjectCamera('vhsoverlay', 'other');
	setGraphicSize('vhsoverlay', 1000, 730);
	setProperty('vhsoverlay.alpha', 0);
        setProperty('vhsoverlay.scale.x', 3.7);
	setProperty('vhsoverlay.scale.y', 3.7); 
        addLuaSprite('vhsoverlay', true);

        makeLuaSprite('VCR', 'Effects/VCR', 320, 180);
        setProperty('VCR.scale.x', 2.04);
	setProperty('VCR.scale.y', 2.12);
        setProperty('VCR.alpha', 0);  
        setObjectCamera('VCR', 'other');
        addLuaSprite('VCR', true);   
	
	setProperty('sky2.visible', false);	
	setProperty('backtrees2.visible', false);
	setProperty('ground2.visible', false);	
	setProperty('buddies.visible', false);                                  
end

function onCreatePost()
        setProperty('bloodedHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('bloodedHB.x', getProperty('healthBar.x') - 30);

        setProperty('bloodedHB.angle', getProperty('healthBar.angle'));
        setProperty('bloodedHB.y', getProperty('healthBar.y') - 15);
        setProperty('bloodedHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('bloodedHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('bloodedHB', 4);
        setObjectOrder('healthBar', 3);
	setObjectOrder('healthBarBG', 2);

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

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end

function onCountdownStarted()
	for i = 0, getProperty('opponentStrums.length') -1 do
		if getPropertyFromGroup('opponentStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NoteSkins/BNOTE_assets');
		end
	end

	for i = 0, getProperty('playerStrums.length') -1 do
		if getPropertyFromGroup('playerStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('playerStrums', i, 'texture', 'NoteSkins/BNOTE_assets');
		end
	end

	for i = 0, getProperty('unspawnNotes.length') -1 do
		if getPropertyFromGroup('unspawnNotes', i, 'texture') == '' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/BNOTE_assets');
		end

		setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'SplashesSkins/BnoteSplashes');
	end
end

function onSongStart()
      doTweenAlpha('graphicAlpha', 'Start', 0, 3, 'linear');
end

-- Flashback Sequence in Fallout
function onStepHit()
if songName == 'Fallout' then
if curStep == 768 then
      setTextString('botplayTxt', 'WAR NEVER CHANGES');
      doTweenColor('bloodedHB',  'bloodedHB', '647864', 0.3, 'linear');

      setProperty('timeBar.color', getColorFromHex('647864'))
      setProperty('timeTxt.color', getColorFromHex('647864'))
      setProperty('scoreTxt.color', getColorFromHex('647864'))
      setProperty('botplayTxt.color', getColorFromHex('647864'))
      setProperty('healthText.color', getColorFromHex('647864'))
      setProperty('songWM.color', getColorFromHex('647864'))

      setProperty('underlay.color', getColorFromHex('647864'))
      setProperty('ComboText.color', getColorFromHex('647864'))  
      setProperty('SicksText.color', getColorFromHex('647864'))
      setProperty('GoodsText.color', getColorFromHex('647864'))
      setProperty('BadsText.color', getColorFromHex('647864'))
      setProperty('ShitsText.color', getColorFromHex('647864'))
      setProperty('MissText.color', getColorFromHex('647864'))  

      setPropertyFromClass('GameOverSubstate', 'characterName', 'picodeath-uber');
      setProperty('defaultCamZoom', 0.56);
      setProperty('vhsoverlay.alpha', 0.4);
      setProperty('VCR.alpha', 1); 
      xx = 490;
      xx2 = 690;
      yy2 = 580;
      setCharacterX('dad', 100);
      setCharacterY('dad', 100);
      setCharacterX('bf', 770);
      setCharacterY('bf', 100);
end
if curStep == 1024 then
      setTextString('botplayTxt', 'BOTPLAY');
      doTweenColor('bloodedHB',  'bloodedHB', 'FFFFFF', 0.3, 'linear');

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

      setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-carry');
      setProperty('defaultCamZoom', 0.65);
      setProperty('vhsoverlay.alpha', 0);
      setProperty('VCR.alpha', 0); 
      xx = 340;
      xx2 = 750;
      yy2 = 540;
      setCharacterX('dad', -100);
      setCharacterY('dad', 200);
      setCharacterX('bf', 962);
      setCharacterY('bf', -150);
end
if curStep == 1536 then

--Strum Player and opponent
      noteTweenAlpha('noteDAD0', 0, 0, 2, 'linear');
      noteTweenAlpha('noteDAD1', 1, 0, 2, 'linear');
      noteTweenAlpha('noteDAD2', 2, 0, 2, 'linear');
      noteTweenAlpha('noteDAD3', 3, 0, 2, 'linear');

      noteTweenAlpha('noteBF4', 4, 0, 2, 'linear');
      noteTweenAlpha('noteBF5', 5, 0, 2, 'linear');
      noteTweenAlpha('noteBF6', 6, 0, 2, 'linear');
      noteTweenAlpha('noteBF7', 7, 0, 2, 'linear');

--timeBar Settings
      doTweenAlpha('timeTxt.Alpha', 'timeTxt', 0, 2, 'linear');
      doTweenAlpha('timeBar.Alpha', 'timeBar', 0, 2, 'linear');
      doTweenAlpha('timeBarBG.Alpha', 'timeBarBG', 0, 2, 'linear');

--healthBar Settings
      doTweenAlpha('songWM.Alpha', 'songWM', 0, 2, 'linear');
      doTweenAlpha('healthText.Alpha', 'healthText', 0, 2, 'linear');
      doTweenAlpha('iconP1', 'iconP1', 0, 1.7, 'linear');
      doTweenAlpha('iconP2', 'iconP2', 0, 1.7, 'linear');
      doTweenAlpha('healthBarBG', 'healthBarBG', 0, 2, 'linear');
      doTweenAlpha('healthBar', 'healthBar', 0, 2, 'linear');
      doTweenAlpha('bloodedHB', 'bloodedHB', 0, 2, 'linear');
      doTweenAlpha('healthBarWithAnim.Alpha', 'healthBarWithAnim', 0, 2, 'linear');
      doTweenAlpha('scoreTxt', 'scoreTxt', 0, 2, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0, 2, 'linear');

--Legacy Counter 
      doTweenAlpha('ratings', 'ratings', 0, 2, 'linear');
      doTweenAlpha('underlay', 'underlay', 0, 2, 'linear');
      doTweenAlpha('ComboText', 'ComboText', 0, 2, 'linear');
      doTweenAlpha('SicksText',  'SicksText', 0, 2, 'linear');
      doTweenAlpha('GoodsText', 'GoodsText', 0, 2, 'linear');
      doTweenAlpha('BadsText', 'BadsText', 0, 2, 'linear');
      doTweenAlpha('ShitsText', 'ShitsText', 0, 2, 'linear');
      doTweenAlpha('MissText',  'MissText', 0, 2, 'linear');
end
end
end

-- change stage Sequence in Fallout
function onBeatHit()
if songName == 'Fallout' then
if curBeat == 192 then

      setProperty('speaker.visible', false);	
      setProperty('table.visible', false);

      setProperty('sky2.visible', true);	
      setProperty('backtrees2.visible', true);
      setProperty('ground2.visible', true);	
      setProperty('buddies.visible', true);
end
if curBeat == 256 then

      setProperty('speaker.visible', true);	
      setProperty('table.visible', true);

      setProperty('sky2.visible', false);	
      setProperty('backtrees2.visible', false);
      setProperty('ground2.visible', false);	
      setProperty('buddies.visible', false);	
end
end
end	
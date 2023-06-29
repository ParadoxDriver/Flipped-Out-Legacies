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

	makeLuaSprite('sky', 'Flippy/Assault/DoomSky', -600, -225);
        addLuaSprite('sky', false);
	setScrollFactor('sky', 0.5, 0.5);

        makeAnimatedLuaSprite('smoke', 'Flippy/Fallout/SmokeRight', 500, -260);
	luaSpriteAddAnimationByPrefix('smoke', 'idle', 'SmokeRight instance', 24, true);
        objectPlayAnimation('smoke', 'smoke');
	setProperty('smoke.scale.x', 0.5);
	setProperty('smoke.scale.y', 0.5);
        addLuaSprite('smoke', false);

        makeLuaSprite('backTrees', 'Flippy/Assault/BackTrees', -625, -200);
        addLuaSprite('backTrees', false);
	setScrollFactor('backTrees', 0.7, 0.7);

	makeLuaSprite('trees', 'Flippy/Assault/Trees', -625, -225);
        addLuaSprite('trees', false);
	setScrollFactor('trees', 0.8, 0.8);
	
	makeLuaSprite('ground', 'Flippy/Assault/Ground', -700, -150);
        addLuaSprite('ground', false);
	setScrollFactor('ground', 1.0, 1.0);

        makeAnimatedLuaSprite('boombox', 'Flippy/Assault/Speaker', 925, 515);
        addLuaSprite('boombox', false);
	luaSpriteAddAnimationByPrefix('boombox', 'bop', 'boombox', 16, true);
	setScrollFactor('boombox', 1.0, 1.0);
	
	makeAnimatedLuaSprite('Flaky', 'Flippy/Assault/Scared_Flaky', 1450, 570);
	luaSpriteAddAnimationByPrefix('Flaky', 'bop', 'Flaky', 16, true);
	setScrollFactor('Flaky', 1.0, 1.0);
        addLuaSprite('Flaky', false);

        makeAnimatedLuaSprite('mefaltaelaire', 'Flippy/Assault/MiniSpeaker', 925, 515);
	luaSpriteAddAnimationByPrefix('mefaltaelaire', 'bop', 'boombox', 16, true);
	setScrollFactor('mefaltaelaire', 1.0, 1.0);
        addLuaSprite('mefaltaelaire', true);

	makeAnimatedLuaSprite('campfire', 'Flippy/Assault/Fire', 500, 360);
        addLuaSprite('campfire', false);
	luaSpriteAddAnimationByPrefix('campfire', 'bop', 'fire idle', 14, true);
	setScrollFactor('campfire', 1.0, 1.0);
        setProperty('campfire.alpha', 0.8);

        makeAnimatedLuaSprite('bloodFoggy', 'Flippy/Assault/Red_Foggy',  -3020,  450);
	luaSpriteAddAnimationByPrefix('bloodFoggy', 'bop', 'niebla', 30, true);
	setScrollFactor('bloodFoggy', 1.0, 1.0);
        addLuaSprite('bloodFoggy', true);

        makeAnimatedLuaSprite('lmao', 'Flippy/Assault/Red_Foggy',  -2850,  450);
	luaSpriteAddAnimationByPrefix('lmao', 'bop', 'niebla', 30, true);
	setScrollFactor('lmao', 1.0, 1.0);
        setPropertyLuaSprite('lmao', 'flipX', true);
        addLuaSprite('lmao', true);

if not lowQuality then
	makeLuaSprite('table', 'Flippy/Assault/Table', -850, -200);
        addLuaSprite('table', true);
	setScrollFactor('table', 1.3, 1.3);
        setProperty('table.scale.x', 1.1);
	setProperty('table.scale.y', 1.2);
end

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

--CADA COPIA DE FLIPPED OUT LEGACY ESTA PERSONALIZADA
        makeLuaSprite('traumaBG','Flippy/Autopsy-Turvy/Fleet_Trauma', -700, -225);
        setProperty('traumaBG.alpha', 0);
        addLuaSprite('traumaBG', false);

        makeLuaSprite('Light','Flippy/Autopsy-Turvy/Light_Above', -350, -210);
	addLuaSprite('Light',true);
	setLuaSpriteScrollFactor('Light', 1.0, 1.0); 
        setProperty('Light.alpha', 0);

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

function onStepHit()
if curStep == 1 then

      setProperty('camHUD.visible', false);
      doTweenAlpha('graphicAlpha', 'Start', 0, 10, 'linear');
end

if curStep == 128 then

      removeLuaSprite('Start',true);
      setProperty('camHUD.visible', true);
end

if curStep == 1056 then

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
      xx = 480;
      xx2 = 690;
      yy2 = 580;
      setCharacterX('dad', 100);
      setCharacterY('dad', 100);
      setCharacterX('bf', 770);
      setCharacterY('bf', 100);
end

if curStep == 1312 then

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
      xx = 310;
      xx2 = 750;
      yy2 = 550;
      setCharacterX('dad', -100);
      setCharacterY('dad', 200);
      setCharacterX('bf', 962);
      setCharacterY('bf', -150);
end

if curStep == 2336 then

      doTweenColor('bloodedHB',  'bloodedHB', '647864', 0.3, 'linear');

      setProperty('timeBar.color', getColorFromHex('647864'))
      setProperty('timeTxt.color', getColorFromHex('647864'))
      setProperty('scoreTxt.color', getColorFromHex('647864'))
      setProperty('botplayTxt.color', getColorFromHex('647864'))
      setProperty('healthText.color', getColorFromHex('647864'))
      setProperty('songWM.color', getColorFromHex('647864'))

      setProperty('ComboText.color', getColorFromHex('647864'))  
      setProperty('SicksText.color', getColorFromHex('647864'))
      setProperty('GoodsText.color', getColorFromHex('647864'))
      setProperty('BadsText.color', getColorFromHex('647864'))
      setProperty('ShitsText.color', getColorFromHex('647864'))
      setProperty('MissText.color', getColorFromHex('647864'))  

      setPropertyFromClass('GameOverSubstate', 'characterName', 'picodeath-uber');
      doTweenZoom('zoom', 'camGame', 0.45, 0.01, 'cubeOut');
      setProperty('defaultCamZoom', 0.45);
      xx = 590;  
      yy = 630;
      ofs = 0;
      setCharacterX('dad', 380);
      setCharacterY('dad', 140);
      setProperty('camHUD.visible', false);
      setProperty('boyfriendGroup.visible', false);
      setProperty('traumaBG.alpha', 1);
      setProperty('Light.alpha', 1);
      setProperty('vhsoverlay.alpha', 0.6);
end 

if curStep == 2480 then
    
      doTweenZoom('zoom', 'camGame', 0.55, 0.02, 'cubeOut');
      setProperty('defaultCamZoom', 0.55);
end

if curStep == 2496 then

      doTweenZoom('zoom', 'camGame', 0.65, 0.02, 'cubeOut');
      setProperty('defaultCamZoom', 0.65);
end

     if curStep == 2512 then

      doTweenZoom('zoom', 'camGame', 0.75, 0.02, 'cubeOut');
      setProperty('defaultCamZoom', 0.75);
end

if curStep == 2528 then

      doTweenZoom('zoom', 'camGame', 0.85, 0.02, 'cubeOut');
      setProperty('defaultCamZoom', 0.85);
end

if curStep == 2593 then

      doTweenColor('bloodedHB',  'bloodedHB', 'FFFFFF', 0.3, 'linear');

      setProperty('timeBar.color', getColorFromHex('E80A0A'))
      setProperty('timeTxt.color', getColorFromHex('E80A0A'))
      setProperty('scoreTxt.color', getColorFromHex('E80A0A'))
      setProperty('botplayTxt.color', getColorFromHex('E80A0A'))
      setProperty('healthText.color', getColorFromHex('E80A0A'))
      setProperty('songWM.color', getColorFromHex('E80A0A'))

      setProperty('ComboText.color', getColorFromHex('E80A0A'))  
      setProperty('SicksText.color', getColorFromHex('E80A0A'))
      setProperty('GoodsText.color', getColorFromHex('E80A0A'))
      setProperty('BadsText.color', getColorFromHex('E80A0A'))
      setProperty('ShitsText.color', getColorFromHex('E80A0A'))
      setProperty('MissText.color', getColorFromHex('E80A0A')) 

      setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-carry');
      xx = 310; 
      yy = 580;
      ofs = 35;
      setCharacterX('dad', -100);
      setCharacterY('dad', 200);
      setProperty('camHUD.visible', true);
      setProperty('defaultCamZoom', 0.65);
      setProperty('boyfriendGroup.visible', true);
      setProperty('traumaBG.alpha', 0);
      setProperty('Light.alpha', 0);
      setProperty('vhsoverlay.alpha', 0);
end

if curStep >= 2593 and curStep < 2647 then
      triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008');
end
end
   
function onBeatHit()
if curBeat == 264 then

      setProperty('bloodFoggy.visible', false);	
      setProperty('lmao.visible', false);	
      setProperty('mefaltaelaire.visible', false);	
      setProperty('table.visible', false);

      setProperty('sky2.visible', true);	
      setProperty('backtrees2.visible', true);
      setProperty('ground2.visible', true);	
      setProperty('buddies.visible', true);
end

if curBeat == 328 then

      setProperty('bloodFoggy.visible', true);	
      setProperty('lmao.visible', true);	
      setProperty('mefaltaelaire.visible', true);	
      setProperty('table.visible', true);

      setProperty('sky2.visible', false);	
      setProperty('backtrees2.visible', false);
      setProperty('ground2.visible', false);	
      setProperty('buddies.visible', false);	
end

if curBeat == 584 then

      setProperty('sky.visible', false);
      setProperty('smoke.visible', false);
      setProperty('backTrees.visible', false);
      setProperty('trees.visible', false);		    
      setProperty('ground.visible', false);
      setProperty('boombox.visible', false);
      setProperty('Flaky.visible', false);
      setProperty('mefaltaelaire.visible', false);	
      setProperty('bloodFoggy.visible', false);	
      setProperty('lmao.visible', false);
      setProperty('campfire.visible', false);		
      setProperty('table.visible', false);
end

if curBeat == 649 then

      setProperty('sky.visible', true);
      setProperty('backTrees.visible', true);
      setProperty('trees.visible', true);		    
      setProperty('ground.visible', true);
      setProperty('boombox.visible', true);
      setProperty('Flaky.visible', true);
      setProperty('mefaltaelaire.visible', true);	
      setProperty('bloodFoggy.visible', true);	
      setProperty('lmao.visible', true);
      setProperty('campfire.visible', true);		
      setProperty('table.visible', true);
end
end	
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

	makeLuaSprite('sky', 'Flippy/Triggered/Sky', -600, -225);
	setScrollFactor('sky', 0.5, 0.5);
        addLuaSprite('sky', false);

	makeLuaSprite('backTrees', 'Flippy/Triggered/BackTrees', -625, -200);
	setScrollFactor('backTrees', 0.7, 0.7);
        addLuaSprite('backTrees', false);

	makeLuaSprite('trees', 'Flippy/Triggered/Trees', -625, -225);
	setScrollFactor('trees', 0.8, 0.8);
        addLuaSprite('trees', false);
 	
	makeLuaSprite('ground', 'Flippy/Triggered/Ground', -700, -150);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false);
	
	makeAnimatedLuaSprite('boombox', 'Flippy/Speaker', 925, 515);
	luaSpriteAddAnimationByPrefix('boombox', 'bop', 'boombox', 16, true);
	setScrollFactor('boombox', 1.0, 1.0);
        addLuaSprite('boombox', false);
	
	makeAnimatedLuaSprite('campfire', 'Flippy/Fire', 500, 360);
	luaSpriteAddAnimationByPrefix('campfire', 'bop', 'fire idle', 12, true);
	setScrollFactor('campfire', 1.0, 1.0);
        setProperty('campfire.alpha', 0.8);
        addLuaSprite('campfire', false);

	makeLuaSprite('table', 'Flippy/Triggered/Table', -850, -200);
        setProperty('table.scale.x', 1.1);
	setProperty('table.scale.y', 1.2);
	setScrollFactor('table', 1.3, 1.3);
        addLuaSprite('table', true);

if hideHud == false then
        makeLuaSprite('sacorgHB', 'HealthBar-Skins/healthbarSacorg',  -50, -200);
        setObjectCamera('sacorgHB', 'hud');
        setScrollFactor('sacorgHB', 0.9, 0.9);
        addLuaSprite('sacorgHB', true);
end
        makeLuaSprite('Start', '', 0, 0);
	makeGraphic('Start',1280,720,'000000');
	setObjectCamera('Start', 'other');
        setProperty('Start.alpha', 1);
	addLuaSprite('Start', true);

--invert effect
        makeLuaSprite('sky2', 'Flippy/Invert/Sky', -600, -225);
	setScrollFactor('sky2', 0.5, 0.5);
        addLuaSprite('sky2', false);

	makeLuaSprite('backTrees2', 'Flippy/Invert/BackTrees', -625, -200);
	setScrollFactor('backTrees2', 0.7, 0.7);
        addLuaSprite('backTrees2', false);

	makeLuaSprite('trees2', 'Flippy/Invert/Trees', -625, -225);
	setScrollFactor('trees2', 0.8, 0.8);
        addLuaSprite('trees2', false);
 	
	makeLuaSprite('ground2', 'Flippy/Invert/Ground', -700, -150);
	setScrollFactor('ground2', 1.0, 1.0);
        addLuaSprite('ground2', false);
	
	makeAnimatedLuaSprite('boombox2', 'Flippy/Invert/Speaker', 925, 515);
	luaSpriteAddAnimationByPrefix('boombox2', 'bop', 'boombox', 16, true);
	setScrollFactor('boombox2', 1.0, 1.0);
        addLuaSprite('boombox2', false);
	
	makeAnimatedLuaSprite('campfire2', 'Flippy/Invert/Fire', 500, 360);
	luaSpriteAddAnimationByPrefix('campfire2', 'bop', 'fire idle', 12, true);
	setScrollFactor('campfire2', 1.0, 1.0);
        addLuaSprite('campfire2', false);

	makeLuaSprite('table2', 'Flippy/Invert/Table', -850, -200);
        setProperty('table2.scale.x', 1.1);
	setProperty('table2.scale.y', 1.2);
	setScrollFactor('table2', 1.3, 1.3);
        addLuaSprite('table2', true);

--Cool Hud
        makeLuaSprite('shadow', 'vinetca', -640, -300);
        setObjectCamera('shadow', 'hud'); 
        setProperty('shadow.scale.x', 0.5);
	setProperty('shadow.scale.y', 0.6);
        addLuaSprite('shadow', false);

        makeAnimatedLuaSprite('linesCam', 'Effects/animatedScanlines', 0, 0);
	luaSpriteAddAnimationByPrefix('linesCam', 'linesMove', 'linesMove instance', 17, true);
        setProperty('linesCam.alpha', 0.75);
	setObjectCamera('linesCam', 'hud');
        addLuaSprite('linesCam', false);

--stage stuff lol
        setProperty('sky2.alpha', 0);
        setProperty('backTrees2.alpha', 0);
        setProperty('trees2.alpha', 0);
        setProperty('ground2.alpha', 0);
        setProperty('boombox2.alpha', 0);
        setProperty('campfire2.alpha', 0);
        setProperty('table2.alpha', 0);

if lowQuality then
        setProperty('table.visible', false);
        setProperty('table2.visible', false);
end
        setObjectOrder('sky', 1);
        setObjectOrder('sky2', 1);
        setObjectOrder('backTrees', 3);
        setObjectOrder('backTrees2', 3);
        setObjectOrder('trees', 5);
        setObjectOrder('trees2', 5);
	setObjectOrder('ground', 7);
        setObjectOrder('ground2', 7);
        setObjectOrder('campfire', 9);
        setObjectOrder('campfire2', 9);
        setObjectOrder('boombox', 11);
        setObjectOrder('boombox2', 11);
        setObjectOrder('dadGroup', 13);
	setObjectOrder('boyfriendGroup', 13)
        setObjectOrder('table', 15);
        setObjectOrder('table2', 15);
end

function onCreatePost()
        setProperty('sacorgHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('sacorgHB.x', getProperty('healthBar.x') - 53);

        setProperty('sacorgHB.angle', getProperty('healthBar.angle'));
        setProperty('sacorgHB.y', getProperty('healthBar.y') - 22);
        setProperty('sacorgHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('sacorgHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('sacorgHB', 4);
        setObjectOrder('healthBar', 3);
	setObjectOrder('healthBarBG', 2);

        setProperty('timeTxt.color', getColorFromHex('53E52C'))
        setProperty('timeBar.color', getColorFromHex('53E52C'))
        setProperty('scoreTxt.color', getColorFromHex('53E52C'))
        setProperty('botplayTxt.color', getColorFromHex('53E52C'))
        setProperty('healthText.color', getColorFromHex('53E52C'))
        setProperty('songWM.color', getColorFromHex('53E52C'))
        
        setProperty('underlay.color', getColorFromHex('53E52C'))
        setProperty('ComboText.color', getColorFromHex('53E52C'))  
        setProperty('SicksText.color', getColorFromHex('53E52C'))
        setProperty('GoodsText.color', getColorFromHex('53E52C'))
        setProperty('BadsText.color', getColorFromHex('53E52C'))
        setProperty('ShitsText.color', getColorFromHex('53E52C'))
        setProperty('MissText.color', getColorFromHex('53E52C'))   
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

function onSongStart()
       doTweenAlpha('graphicAlpha', 'Start', 0, 3, 'lineal');
       setProperty('camHUD.visible', false);
       setObjectCamera('topBar', 'other');
       setObjectCamera('bottomBar', 'other');
end

function onStepHit()
if curStep == 1 then
      --setPropertyFromClass('ClientPrefs', 'camZooms', false)
end

if curStep == 64 then
      setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-invert');
      setObjectCamera('topBar', 'hud');
      setObjectCamera('bottomBar', 'hud');
      setProperty('camHUD.visible', true);

      removeLuaSprite('sky', true);
      removeLuaSprite('backTrees', true);
      removeLuaSprite('trees', true);
      removeLuaSprite('ground', true);
      removeLuaSprite('boombox', true);
      removeLuaSprite('campfire', true);
      removeLuaSprite('table', true);

      setProperty('sky2.alpha', 1);
      setProperty('backTrees2.alpha', 1);
      setProperty('trees2.alpha', 1);
      setProperty('ground2.alpha', 1);
      setProperty('boombox2.alpha', 1);
      setProperty('campfire2.alpha', 0.8);
      setProperty('table2.alpha', 1);

      setProperty('timeTxt.color', getColorFromHex('3C006F'))
      setProperty('timeBar.color', getColorFromHex('3C006F'))
      setProperty('scoreTxt.color', getColorFromHex('3C006F'))
      setProperty('botplayTxt.color', getColorFromHex('3C006F'))
      setProperty('healthText.color', getColorFromHex('3C006F'))
      setProperty('songWM.color', getColorFromHex('3C006F'))
      
      setProperty('underlay.color', getColorFromHex('3C006F'))
      setProperty('ComboText.color', getColorFromHex('3C006F'))  
      setProperty('SicksText.color', getColorFromHex('3C006F'))
      setProperty('GoodsText.color', getColorFromHex('3C006F'))
      setProperty('BadsText.color', getColorFromHex('3C006F'))
      setProperty('ShitsText.color', getColorFromHex('3C006F'))
      setProperty('MissText.color', getColorFromHex('3C006F'))   
end

if curStep == 704 then
      setProperty('defaultCamZoom', 1.0);
      setProperty('cameraSpeed', 2.2);
      xx2 = 1080;
      yy2 = 400;
end

if curStep == 768 then
      setProperty('defaultCamZoom', 0.65);
      setProperty('cameraSpeed', 1);
      xx2 = 750;
      yy2 = 540;
end

if curStep == 1025 then
     --setPropertyFromClass('ClientPrefs', 'camZooms', true)
end
end
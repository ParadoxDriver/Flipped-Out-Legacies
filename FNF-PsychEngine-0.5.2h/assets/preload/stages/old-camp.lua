local xx = 320;
local yy = 590;
local xx2 = 750;
local yy2 = 560;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
	makeLuaSprite('sky', 'Flippy/Jungle/Sky', -600, -225);
	setScrollFactor('sky', 0.5, 0.5);
        addLuaSprite('sky', false);

	makeLuaSprite('backTrees', 'Flippy/Jungle/BackTrees', -625, -200);
	setScrollFactor('backTrees', 0.7, 0.7);
        addLuaSprite('backTrees', false);

	makeLuaSprite('trees', 'Flippy/Jungle/Trees', -625, -225);
	setScrollFactor('trees', 0.8, 0.8);
        addLuaSprite('trees', false);
	
	makeLuaSprite('ground', 'Flippy/Jungle/Ground', -700, -150);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false); 

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

--The man behind the slaughter
        makeLuaSprite('alt-sky', 'Flippy/Jungle/Midnight/Alt-Sky', -600, -225);
	setScrollFactor('alt-sky', 0.5, 0.5);
        addLuaSprite('alt-sky', false);

	makeLuaSprite('alt-backTrees', 'Flippy/Jungle/Midnight/Alt-BackTrees', -625, -200);
	setScrollFactor('alt-backTrees', 0.7, 0.7);
        addLuaSprite('alt-backTrees', false);

	makeLuaSprite('alt-trees', 'Flippy/Jungle/Midnight/Alt-Trees', -625, -225);
	setScrollFactor('alt-trees', 0.8, 0.8);
        addLuaSprite('alt-trees', false);
	
	makeLuaSprite('alt-ground', 'Flippy/Jungle/Midnight/Alt-Ground', -700, -150);
	setScrollFactor('alt-ground', 1.0, 1.0);
        addLuaSprite('alt-ground', false); 

	makeLuaSprite('alt-table', 'Flippy/Jungle/Midnight/Alt-Table', -850, -200);
        setProperty('alt-table.scale.x', 1.1);
	setProperty('alt-table.scale.y', 1.2);
	setScrollFactor('alt-table', 1.3, 1.3);
        addLuaSprite('alt-table', true);

        makeAnimatedLuaSprite('boombox', 'Flippy/Speaker', 850, 460);
	luaSpriteAddAnimationByPrefix('boombox', 'bop', 'boombox', 16, true);
	setScrollFactor('boombox', 1.0, 1.0);
        addLuaSprite('boombox', false);

--Cool Hud
        makeLuaSprite('shadow', 'vinetca', -640, -300);
        setObjectCamera('shadow', 'hud'); 
        setProperty('shadow.scale.x', 0.5);
	setProperty('shadow.scale.y', 0.6);
        addLuaSprite('shadow', false);

        makeAnimatedLuaSprite('linesCam', 'Effects/animatedScanlines', 0, 0);
	luaSpriteAddAnimationByPrefix('linesCam', 'linesMove', 'linesMove instance', 17, true);
	setObjectCamera('linesCam', 'hud');
        addLuaSprite('linesCam', false);

--stage stuff lol
        setObjectOrder('sky', 1);
        setObjectOrder('alt-sky', 1);
        setObjectOrder('backTrees', 3);
        setObjectOrder('alt-backTrees', 3);
        setObjectOrder('trees', 5);
        setObjectOrder('alt-trees', 5);
        setObjectOrder('ground', 7);
        setObjectOrder('alt-ground', 7);
        setObjectOrder('boombox', 9);
        setObjectOrder('dadGroup', 9);
        setObjectOrder('boyfriendGroup', 9);
        setObjectOrder('table', 11);
        setObjectOrder('alt-table', 11);

if lowQuality then
        setProperty('table.visible', false);
        setProperty('alt-table.visible', false);
end
        setProperty('alt-sky.alpha', 0);
        setProperty('alt-backTrees.alpha', 0);
        setProperty('alt-trees.alpha', 0);
        setProperty('alt-ground.alpha', 0);
        setProperty('alt-table.alpha', 0);
        setProperty('boombox.alpha', 0);

        setProperty('linesCam.alpha', 0);
        setProperty('shadow.alpha', 0);

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

        setProperty('boombox.color', getColorFromHex('000000'))

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

function onStepHit()
if curStep == 80 then
      setObjectCamera('linesCam', 'other');
      setObjectCamera('shadow', 'other');

      setProperty('boombox.alpha', 1);
      setProperty('table.alpha', 0);
      setProperty('linesCam.alpha', 1);
      setProperty('shadow.alpha', 1);
end

if curStep == 240 then
      setObjectCamera('linesCam', 'hud');
      setObjectCamera('shadow', 'hud');

      setProperty('boombox.alpha', 0);
      setProperty('table.alpha', 1);
      setProperty('linesCam.alpha', 0);
      setProperty('shadow.alpha', 0);
end

if curStep == 560 then
     removeLuaSprite('sky', true);
     removeLuaSprite('backTrees', true);
     removeLuaSprite('trees', true);
     removeLuaSprite('ground', true);
     removeLuaSprite('table', true);

     setProperty('alt-sky.alpha', 1);
     setProperty('alt-backTrees.alpha', 1);
     setProperty('alt-trees.alpha', 1);
     setProperty('alt-ground.alpha', 1);
     setProperty('alt-table.alpha', 1);

     setProperty('timeBar.color', getColorFromHex('8D09C7'))
     setProperty('timeTxt.color', getColorFromHex('8D09C7'))
     setProperty('scoreTxt.color', getColorFromHex('8D09C7'))
     setProperty('botplayTxt.color', getColorFromHex('8D09C7'))
     setProperty('healthText.color', getColorFromHex('8D09C7'))
     setProperty('songWM.color', getColorFromHex('8D09C7'))

     setProperty('underlay.color', getColorFromHex('8D09C7'))
     setProperty('ComboText.color', getColorFromHex('8D09C7'))  
     setProperty('SicksText.color', getColorFromHex('8D09C7'))
     setProperty('GoodsText.color', getColorFromHex('8D09C7'))
     setProperty('BadsText.color', getColorFromHex('8D09C7'))
     setProperty('ShitsText.color', getColorFromHex('8D09C7'))
     setProperty('MissText.color', getColorFromHex('8D09C7')) 
end

if curStep == 720 then
      xx = 1000;
      yy = 370;
      xx2 = 1000;
      yy2 = 370;
      setProperty('defaultCamZoom', 1.3);
      setProperty('boombox.alpha', 1);
      setProperty('alt-table.alpha', 0);
      setProperty('linesCam.alpha', 1);
      setProperty('shadow.alpha', 1);
end

if curStep == 880 then
      xx = 320;
      yy = 590;
      xx2 = 750;
      yy2 = 560;
      setProperty('defaultCamZoom', 0.64);
      setProperty('boombox.alpha', 0);
      setProperty('alt-table.alpha', 1);
      setProperty('linesCam.alpha', 0);
      setProperty('shadow.alpha', 0);
end
end
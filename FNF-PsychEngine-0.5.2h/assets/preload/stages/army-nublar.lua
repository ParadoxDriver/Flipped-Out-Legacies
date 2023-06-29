local xx = 340;
local yy = 540;
local xx2 = 770;
local yy2 = 600;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
	makeLuaSprite('sky', 'Flippy/Army/Nublar-Sky', -600, -225);
	setScrollFactor('sky', 1.0, 1.0);
        addLuaSprite('sky', false);

        makeLuaSprite('bwall', 'Flippy/Army/Nublar-Bwall', -625, -200);
	setScrollFactor('bwall', 0.9, 0.9);
        addLuaSprite('bwall', false);

        makeAnimatedLuaSprite('rain', 'Flippy/Hunter/rain', -1200, -400);
        luaSpriteAddAnimationByPrefix('rain', 'rainanim', 'rainanim', 24, true);
        setProperty('rain.alpha', 0.85);
        setProperty('rain.scale.x', 2.0);
	setProperty('rain.scale.y', 1.5);
        addLuaSprite('rain', false); 

if not lowQuality then
        makeAnimatedLuaSprite('foggy', 'Flippy/Fallout/fog',  -3000,  100);
	luaSpriteAddAnimationByPrefix('foggy', 'bop', 'nieblal', 30, true);
	setScrollFactor('foggy', 1.0, 1.0);
        addLuaSprite('foggy', false);

        makeAnimatedLuaSprite('lapcvaaexplotar', 'Flippy/Fallout/fog',  -3000,  100);
	luaSpriteAddAnimationByPrefix('lapcvaaexplotar', 'bop', 'nieblal', 30, true);
	setScrollFactor('lapcvaaexplotar', 1.0, 1.0);
        setPropertyLuaSprite('lapcvaaexplotar', 'flipX', true);
        addLuaSprite('lapcvaaexplotar', false);
end
	makeLuaSprite('ground', 'Flippy/Army/Nublar-scene', -700, -150);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false);

        makeLuaSprite('lights', 'Flippy/Army/lights', -750, -150);
	setScrollFactor('lights', 1.1, 1.1);
        addLuaSprite('lights', true);

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

        setProperty('introSoundsSuffix', '-kapow') 
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

        setProperty('timeBar.color', getColorFromHex('576661'))
        setProperty('timeTxt.color', getColorFromHex('576661'))
        setProperty('scoreTxt.color', getColorFromHex('576661'))
        setProperty('botplayTxt.color', getColorFromHex('576661'))
        setProperty('healthText.color', getColorFromHex('576661'))
        setProperty('songWM.color', getColorFromHex('576661'))
        
        setProperty('underlay.color', getColorFromHex('576661'))
        setProperty('ComboText.color', getColorFromHex('576661'))  
        setProperty('SicksText.color', getColorFromHex('576661'))
        setProperty('GoodsText.color', getColorFromHex('576661'))
        setProperty('BadsText.color', getColorFromHex('576661'))
        setProperty('ShitsText.color', getColorFromHex('576661'))
        setProperty('MissText.color', getColorFromHex('576661'))  
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
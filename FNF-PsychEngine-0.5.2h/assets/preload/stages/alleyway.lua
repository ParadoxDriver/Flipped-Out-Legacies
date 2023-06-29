local xx = 530;
local yy = 390;
local xx2 = 790;
local yy2 = 420;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
       -- background shit
	makeLuaSprite('sky', 'Flippy/Shanked/Sky', -500, -200);
        setScrollFactor('sky', 1.0, 1.0);
	addLuaSprite('sky', false);	

	makeLuaSprite('road', 'Flippy/Shanked/Road', -500, -200);
	setScrollFactor('road', 1.0, 1.0);
	addLuaSprite('road', false);

        makeLuaSprite('limo', 'Flippy/Shanked/Limo', -130, -310);	
        setProperty("limo.scale.x", 1);
	setProperty("limo.scale.y", 1);
        addLuaSprite('limo', false);

        makeAnimatedLuaSprite('nieblal', 'Flippy/Fallout/fog',  -1670,  -100);
	luaSpriteAddAnimationByPrefix('nieblal', 'idle', 'nieblal', 30, true);
	setScrollFactor('nieblal', 1.0, 1.0);
        addLuaSprite('nieblal', false);

        makeAnimatedLuaSprite('lmaoFog', 'Flippy/Fallout/fog',  -1670,  -100);
	luaSpriteAddAnimationByPrefix('lmaoFog', 'idle', 'nieblal', 30, true);
	setScrollFactor('lmaoFog', 1.0, 1.0);
        setPropertyLuaSprite('lmaoFog', 'flipX', true);
        addLuaSprite('lmaoFog', false);	

	makeLuaSprite('alleyway', 'Flippy/Shanked/Alleyway', -500, -200);
	setScrollFactor('alleyway', 1, 1);
	addLuaSprite('alleyway', false);

if hideHud == false then
        makeLuaSprite('sacorgHB', 'HealthBar-Skins/healthbarSacorg',  -50, -200);
	setObjectCamera('sacorgHB', 'hud');
        setScrollFactor('sacorgHB', 0.9, 0.9);
	addLuaSprite('sacorgHB', true);
end
        makeLuaSprite('shadow', 'vinetca', -640, -300);
        setObjectCamera('shadow', 'other'); 
        setProperty('shadow.scale.x', 0.5);
	setProperty('shadow.scale.y', 0.6);
        addLuaSprite('shadow', false);

        setProperty('introSoundsSuffix', '-entity') 
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

        setProperty('timeBar.color', getColorFromHex('8CA77F'))
        setProperty('timeTxt.color', getColorFromHex('8CA77F'))
        setProperty('scoreTxt.color', getColorFromHex('8CA77F'))
        setProperty('botplayTxt.color', getColorFromHex('8CA77F'))
        setProperty('healthText.color', getColorFromHex('8CA77F'))
        setProperty('songWM.color', getColorFromHex('8CA77F'))
        
        setProperty('underlay.color', getColorFromHex('8CA77F'))
        setProperty('ComboText.color', getColorFromHex('8CA77F'))  
        setProperty('SicksText.color', getColorFromHex('8CA77F'))
        setProperty('GoodsText.color', getColorFromHex('8CA77F'))
        setProperty('BadsText.color', getColorFromHex('8CA77F'))
        setProperty('ShitsText.color', getColorFromHex('8CA77F'))
        setProperty('MissText.color', getColorFromHex('8CA77F'))  
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
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NoteSkins/LegacyNote_assets');
		end
	end

	for i = 0, getProperty('playerStrums.length') -1 do
		if getPropertyFromGroup('playerStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('playerStrums', i, 'texture', 'NoteSkins/LegacyNote_assets');
		end
	end

	for i = 0, getProperty('unspawnNotes.length') -1 do
		if getPropertyFromGroup('unspawnNotes', i, 'texture') == '' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/LegacyNote_assets');
		end

		setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'SplashesSkins/LegacySplashes');
	end
end
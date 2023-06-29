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
    
	makeLuaSprite('sky', 'Flippy/Slaughter/Sky', -600, -225);
	setScrollFactor('sky', 0.5, 0.5);
        addLuaSprite('sky', false);

	makeLuaSprite('backTrees', 'Flippy/Slaughter/BackTrees', -625, -200);
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

	makeLuaSprite('trees', 'Flippy/Slaughter/Trees', -625, -225);
	setScrollFactor('trees', 0.8, 0.8);
        addLuaSprite('trees', false);
	
	makeLuaSprite('ground', 'Flippy/Slaughter/Ground', -700, -150);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false);
	
	makeAnimatedLuaSprite('boombox', 'Flippy/Speaker', 925, 515);
	luaSpriteAddAnimationByPrefix('boombox', 'bop', 'boombox', 16, true);
	setScrollFactor('boombox', 1.0, 1.0);
        addLuaSprite('boombox', false);

        makeAnimatedLuaSprite('Flaky', 'Flippy/Slaughter/Scared_Flaky', 1450, 570);
	luaSpriteAddAnimationByPrefix('Flaky', 'bop', 'Flaky', 16, true);
	setScrollFactor('Flaky', 1.0, 1.0);
        addLuaSprite('Flaky', false);

        makeAnimatedLuaSprite('speaker', 'Flippy/Slaughter/MiniSpeaker', 925, 515);
	luaSpriteAddAnimationByPrefix('speaker', 'bop', 'boombox', 16, true);
	setScrollFactor('speaker', 1.0, 1.0);
        addLuaSprite('speaker', true);

	makeAnimatedLuaSprite('campfire', 'Flippy/Fire', 500, 360);
	luaSpriteAddAnimationByPrefix('campfire', 'bop', 'fire idle', 12, true);
	setScrollFactor('campfire', 1.0, 1.0);
        setProperty('campfire.alpha', 0.8);
        addLuaSprite('campfire', false);

        makeAnimatedLuaSprite('nieblal', 'Flippy/Fallout/fog',  -3000,  450);
	luaSpriteAddAnimationByPrefix('nieblal', 'idle', 'nieblal', 30, true);
	setScrollFactor('nieblal', 1.0, 1.0);
        addLuaSprite('nieblal', true); 

        makeAnimatedLuaSprite('fog', 'Flippy/Fallout/fog',  -3000,  450);
	luaSpriteAddAnimationByPrefix('fog', 'idle', 'nieblal', 30, true);
	setScrollFactor('fog', 1.0, 1.0);
        setPropertyLuaSprite('fog', 'flipX', true);
        addLuaSprite('fog', true);

	makeLuaSprite('table', 'Flippy/Slaughter/Table', -850, -200);
        setProperty('table.scale.x', 1.1);
	setProperty('table.scale.y', 1.2);
	setScrollFactor('table', 1.3, 1.3);
        addLuaSprite('table', true);

        makeAnimatedLuaSprite('rain', 'Flippy/Hunter/rain', -1200, -400);
        luaSpriteAddAnimationByPrefix('rain', 'rainanim', 'rainanim', 24, true);
        setProperty('rain.alpha', 0.85);
        setProperty('rain.scale.x', 2.5);
	setProperty('rain.scale.y', 2.5);
        addLuaSprite('rain', true); 

        makeLuaSprite('shadow', 'vinetca', -640, -300);
        setObjectCamera('shadow', 'hud'); 
        setProperty('shadow.scale.x', 0.5);
	setProperty('shadow.scale.y', 0.6);
        addLuaSprite('shadow', false);

        setObjectOrder('shadow', 1);

        setProperty('foggy.visible', false);
        setProperty('misty.visible', false);
        setProperty('nieblal.visible', false);
        setProperty('fog.visible', false);
        setProperty('rain.visible', false);
        setProperty('shadow.visible', false);

if hideHud == false then
        makeLuaSprite('bloodedHB', 'HealthBar-Skins/healthBar2', -50, -200);
	setObjectCamera('bloodedHB', 'hud');
	setScrollFactor('bloodedHB', 0.9, 0.9);
	addLuaSprite('bloodedHB', true);
end

if songName == 'Shell-Shanked' then
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-trollge');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd-trollge');

        setProperty('foggy.visible', true);
        setProperty('misty.visible', true);
        setProperty('nieblal.visible', true);
        setProperty('fog.visible', true);
        setProperty('rain.visible', true);
        setProperty('shadow.visible', true);
end
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
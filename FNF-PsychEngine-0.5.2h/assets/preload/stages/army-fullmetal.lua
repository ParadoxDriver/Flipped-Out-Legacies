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
	makeLuaSprite('ground', 'Flippy/Army/FullMetal_Stage', -700, -150);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false);

	makeLuaSprite('lights', 'Flippy/Defeat/lmao_lights', -740, -150);
	setScrollFactor('lights', 1.1, 1.1);
        addLuaSprite('lights', true);

if hideHud == false then
        makeLuaSprite('bloodedHB', 'HealthBar-Skins/healthBar2', -50, -200);
	setObjectCamera('bloodedHB', 'hud');
	setScrollFactor('bloodedHB', 0.9, 0.9);
	addLuaSprite('bloodedHB', true);
end
        makeLuaSprite('timeCool', 'TimeBar-Skins/timeBar-Blood', 396, 16);
	setScrollFactor('timeCool', 0.9, 0.9);
        setProperty('timeCool.alpha', 0);
        setObjectCamera('timeCool', 'hud');
        setProperty('timeCool.scale.x', getProperty('timeCool.scale.x') + 0.02);
	setProperty('timeCool.scale.y', getProperty('timeCool.scale.y') - 0.01);
        addLuaSprite('timeCool', true); 

        makeLuaSprite('shadow', 'vinetca', -640, -300);
        setObjectCamera('shadow', 'other'); 
        setProperty('shadow.scale.x', 0.5);
	setProperty('shadow.scale.y', 0.6);
        addLuaSprite('shadow', false);

        makeAnimatedLuaSprite('vhsoverlay', 'Effects/vhs', -100, -40);
	addAnimationByPrefix('vhsoverlay', 'vhs', 'vhs', 24, true);
	setObjectCamera('vhsoverlay', 'other');
	setGraphicSize('vhsoverlay', 1000, 730);
	setProperty('vhsoverlay.alpha', 0.5);
        setProperty('vhsoverlay.scale.x', 3.7);
	setProperty('vhsoverlay.scale.y', 3.7); 
        addLuaSprite('vhsoverlay', true);

        makeLuaSprite('VCR', 'Effects/VCR', 320, 180);
        setProperty('VCR.scale.x', 2.04);
	setProperty('VCR.scale.y', 2.12);  
        setObjectCamera('VCR', 'other');
        addLuaSprite('VCR', true);   

        setProperty('introSoundsSuffix', '-fullmetal')
end

function onCountdownTick(swagCounter)
if swagCounter == 0 then
	makeLuaSprite('get', 'Countdowns/FullMetal/get-reday', screenWidth / 2 - 180, screenHeight / 2 - 150);
	setObjectCamera('get','other');
	doTweenAlpha('CounterGet', 'get', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('get', true);	
end	
if swagCounter == 1 then
	setProperty('countdownReady.visible', false)
	makeLuaSprite('ready', 'Countdowns/FullMetal/ready', screenWidth / 2 - 180, screenHeight / 2 - 150);
	setObjectCamera('ready','other');
	doTweenAlpha('CounterReady', 'ready', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('ready', true);	
end	
if swagCounter == 2 then
	setProperty('countdownSet.visible', false)
	makeLuaSprite('set', 'Countdowns/FullMetal/set', screenWidth / 2 - 180, screenHeight / 2 - 150);
	setObjectCamera('set','other');
	doTweenAlpha('CounterSet', 'set', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('set', true);
end	
if swagCounter == 3 then
	setProperty('countdownGo.visible', false)
	makeLuaSprite('GO', 'Countdowns/FullMetal/go', screenWidth / 2 - 290, screenHeight / 2 - 240);
	setObjectCamera('GO','other');
	doTweenAlpha('CounterGO', 'GO', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('GO', true);
	end
end

function onTweenCompleted(tag)
    if tag == 'CounterGet' then
         removeLuaSprite('get', true);
    end
    if tag == 'CounterReady' then
         removeLuaSprite('ready', true);
    end
    if tag == 'CounterSet' then
         removeLuaSprite('set', true);
    end
    if tag == 'CounterGO' then
         removeLuaSprite('go', true);
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

        setObjectOrder('timeBarBG', 3);
	setObjectOrder('timeBar', 6);
        setObjectOrder('timeCool', 7);

        setTextFont('botplayTxt', "Antilles.ttf");
        setTextFont('scoreTxt', "Antilles.ttf");
        setTextFont('timeTxt', "Antilles.ttf");
        setTextFont('songWM', "Antilles.ttf");
        setTextFont('healthText', "Antilles.ttf");
 
        setTextFont('ComboText', "Antilles.ttf");
        setTextFont('SicksText', "Antilles.ttf");
        setTextFont('GoodsText', "Antilles.ttf");
        setTextFont('BadsText', "Antilles.ttf");
        setTextFont('ShitsText', "Antilles.ttf");
        setTextFont('MissText', "Antilles.ttf"); 

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

function onUpdatePost()
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then

        setProperty('scoreTxt.y', 675);
        setProperty('timeCool.y', 16);
        setProperty('timeTxt.y', 16);
end
if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

        setProperty('scoreTxt.y', 114);
        setProperty('timeCool.y', 674);
        setProperty('timeTxt.y', 674);
end
if getPropertyFromClass('ClientPrefs', 'timeBarType') == 'Disabled' then

        removeLuaSprite('timeCool')
end
end

function onSongStart()
        doTweenAlpha('heyTime', 'timeCool', 1, 0.2);
end

function onEndSong()
        doTweenAlpha('goodbyeTime', 'timeCool', 0, 0.2);
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
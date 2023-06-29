local xx = 640;
local yy = 700;
local xx2 = 1072;
local yy2 = 700;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
        setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx_trollge');
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-trollge');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd-trollge'); 
        setPropertyFromClass('GameOverSubstate', 'characterName', 'death-minus');

	makeLuaSprite('sky', 'Flippy/Slasher/sky', -1020, -270);
	setScrollFactor('sky', 0.7, 0.7);
        addLuaSprite('sky', false);

	makeLuaSprite('trees', 'Flippy/Slasher/trees-burnt', -950, -270);
	setScrollFactor('trees', 0.8, 0.8);
        addLuaSprite('trees', false);

	makeLuaSprite('ground', 'Flippy/Slasher/ground', -1200, -400);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false);
	
	makeAnimatedLuaSprite('smol', 'Flippy/Slasher/lilboi', 2150, 815);
	luaSpriteAddAnimationByIndices('smol', 'danceRight', 'flip', '30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14');
	luaSpriteAddAnimationByIndices('smol', 'danceLeft', 'flip', '15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29');
	setScrollFactor('smol', 1.0, 1.0);
        setProperty('smol.scale.x', 2.5);
	setProperty('smol.scale.y', 2.5);
        addLuaSprite('smol', false);   	

        makeLuaSprite('trees2', 'Flippy/Slasher/trees', -1300, -400);
	setScrollFactor('trees2', 1.0, 1.0);
        setProperty('trees2.scale.x', 1.5);
	setProperty('trees2.scale.y', 1.1);
        setProperty('trees2.alpha', 0.76);
        addLuaSprite('trees2', true);

if hideHud == false then
        makeLuaSprite('slashHB', 'HealthBar-Skins/healthBar_Slasher', -50, -200);
	setObjectCamera('slashHB', 'hud');
	setScrollFactor('slashHB', 0.9, 0.9);
	addLuaSprite('slashHB', true);
end
        makeLuaSprite('timeCool', 'TimeBar-Skins/timeBar-Burnt', 396, 16);
	setScrollFactor('timeCool', 0.9, 0.9);
        setProperty('timeCool.alpha', 0);
        setObjectCamera('timeCool', 'hud');
        setProperty('timeCool.scale.x', getProperty('timeCool.scale.x') + 0.02);
	setProperty('timeCool.scale.y', getProperty('timeCool.scale.y') - 0.01);
        addLuaSprite('timeCool', true);

        makeLuaSprite('bruh', 'Flippy/Slasher/gradient-burnt', 0, 0);
        setScrollFactor('bruh', 1.0, 1.0);
        setObjectCamera('bruh', 'hud');
        addLuaSprite('bruh', false);  

        makeLuaSprite('shadow', 'vinetca', -640, -300);
        setObjectCamera('shadow', 'other'); 
        setProperty('shadow.scale.x', 0.5);
	setProperty('shadow.scale.y', 0.6);
        addLuaSprite('shadow', false);

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
        setProperty('slashHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('slashHB.x', getProperty('healthBar.x') - 50);

        setProperty('slashHB.angle', getProperty('healthBar.angle'));
        setProperty('slashHB.y', getProperty('healthBar.y') - 24);
        setProperty('slashHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('slashHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('bruh', true); 
        setObjectOrder('slashHB', 6);
        setObjectOrder('healthBar', 4);
	setObjectOrder('healthBarBG', 2);

        setObjectOrder('timeBarBG', 6);
	setObjectOrder('timeBar', 7);
        setObjectOrder('timeCool', 8)

        setTextFont('botplayTxt', "Slasher.ttf");
        setTextFont('scoreTxt', "Slasher.ttf");
        setTextFont('timeTxt', "Slasher.ttf");
        setTextFont('songWM', "Slasher.ttf");
        setTextFont('healthText', "Slasher.ttf");

        setTextFont('ComboText', "Slasher.ttf");
        setTextFont('SicksText', "Slasher.ttf");
        setTextFont('GoodsText', "Slasher.ttf");
        setTextFont('BadsText', "Slasher.ttf");
        setTextFont('ShitsText', "Slasher.ttf");
        setTextFont('MissText', "Slasher.ttf");

        setProperty('timeBar.color', getColorFromHex('EB5606'))
        setProperty('timeTxt.color', getColorFromHex('EB5606'))
        setProperty('scoreTxt.color', getColorFromHex('EB5606'))
        setProperty('botplayTxt.color', getColorFromHex('EB5606'))
        setProperty('healthText.color', getColorFromHex('EB5606'))
        setProperty('songWM.color', getColorFromHex('EB5606'))

        setProperty('underlay.color', getColorFromHex('EB5606'))
        setProperty('ComboText.color', getColorFromHex('EB5606'))  
        setProperty('SicksText.color', getColorFromHex('EB5606'))
        setProperty('GoodsText.color', getColorFromHex('EB5606'))
        setProperty('BadsText.color', getColorFromHex('EB5606'))
        setProperty('ShitsText.color', getColorFromHex('EB5606'))
        setProperty('MissText.color', getColorFromHex('EB5606'))
end

function onUpdatePost()
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then

        setProperty('scoreTxt.y', 679);
        setProperty('timeCool.y', 16);
        setProperty('timeTxt.y', 22);
end
if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

        setProperty('scoreTxt.y', 117); 
        setProperty('timeCool.y', 674);
        setProperty('timeTxt.y', 679);
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
            setProperty('defaultCamZoom',0.4)
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
            setProperty('defaultCamZoom',0.6)
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

function onBeatHit()
   if curBeat % 2 == 0 then

	     objectPlayAnimation('smol', 'danceRight', true)
	else

	     objectPlayAnimation('smol', 'danceLeft', true)
	end
end

function opponentNoteHit(id,data,type,sus)
triggerEvent('Screen Shake','0.04,0.009')

health = getProperty('health')
    if getProperty('health') > 0.07 then
        setProperty('health', health- 0.017);
    end
end
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
        setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx_csgo');
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver_csgo');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd_csgo'); 
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bfDoor');

	makeLuaSprite('sky', 'Flippy/Tags/Sky', -600, -225);
	setScrollFactor('sky', 0.5, 0.5);
        addLuaSprite('sky', false);

	makeLuaSprite('backTrees', 'Flippy/Tags/BackTrees', -625, -200);
	setScrollFactor('backTrees', 0.7, 0.7);
        addLuaSprite('backTrees', false);

	makeLuaSprite('trees', 'Flippy/Tags/Trees', -625, -225);
	setScrollFactor('trees', 0.8, 0.8);
        addLuaSprite('trees', false);
	
	makeLuaSprite('ground', 'Flippy/Tags/Ground', -700, -150);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false);
	
	makeAnimatedLuaSprite('boombox', 'Flippy/Tags/Speaker', 925, 515)
	luaSpriteAddAnimationByPrefix('boombox', 'bop', 'boombox', 16, true)
	setScrollFactor('boombox', 1.0, 1.0);
        addLuaSprite('boombox', false);
	
	makeAnimatedLuaSprite('campfire', 'Flippy/Hunter/Fire', 500, 360);
	luaSpriteAddAnimationByPrefix('campfire', 'bop', 'fire idle', 12, true);
	setScrollFactor('campfire', 1.0, 1.0);
        setProperty('campfire.alpha', 0.8);
        addLuaSprite('campfire', false);

if not lowQuality then
	makeLuaSprite('table', 'Flippy/Tags/Table', -850, -200);
        setProperty('table.scale.x', 1.1);
	setProperty('table.scale.y', 1.2);
	setScrollFactor('table', 1.3, 1.3);
        addLuaSprite('table', true);
end

if hideHud == false then
        makeLuaSprite('sacorgHB', 'HealthBar-Skins/healthbarSacorg',  -50, -200);
	setObjectCamera('sacorgHB', 'hud');
        setScrollFactor('sacorgHB', 0.9, 0.9);
	addLuaSprite('sacorgHB', true);
end
        makeLuaSprite('timeCool', 'TimeBar-Skins/timeBar-Fortnite', 395, 7);
	setScrollFactor('timeCool', 0.9, 0.9);
        setProperty('timeCool.alpha', 0);
        setObjectCamera('timeCool', 'hud');
        setProperty('timeCool.scale.x', getProperty('timeCool.scale.x') + 0.02);
	setProperty('timeCool.scale.y', getProperty('timeCool.scale.y') - 0.01);
        addLuaSprite('timeCool', true); 

        makeLuaSprite('rating', 'Flippy/Tags/Shit Hud', 45, 35);
	setScrollFactor('rating', 1.0, 1.0);
	scaleObject('rating', 0.48, 0.48);
        setObjectCamera('rating', 'hud');
        addLuaSprite('rating', true);

        makeAnimatedLuaSprite('linesCam', 'Effects/animatedScanlines', 0, 0);
	luaSpriteAddAnimationByPrefix('linesCam', 'linesMove', 'linesMove instance', 17, true);
        setProperty('linesCam.alpha', 0.75);
	setObjectCamera('linesCam', 'other');
        addLuaSprite('linesCam', false);

        makeLuaSprite('VCR', 'Effects/VCR', 320, 180);
        setProperty('VCR.scale.x', 2.04);
	setProperty('VCR.scale.y', 2.12);  
        setObjectCamera('VCR', 'other');
        addLuaSprite('VCR', true);   

        setObjectOrder('boyfriendGroup', 6);
        setObjectOrder('gfGroup', 8);

        setProperty('introSoundsSuffix', '-csgo')

        addCharacterToList('tactical-flippy', 'dad')
        addCharacterToList('gfDoor', 'gf')
	addCharacterToList('bfDoor', 'boyfriend')
end

function onCountdownTick(swagCounter)
if swagCounter == 0 then
	makeLuaSprite('get', 'Countdowns/CSGO/get-reday', screenWidth / 2 - 350, screenHeight / 2 - 300);
	setObjectCamera('get','other');
	doTweenAlpha('CounterGet', 'get', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('get', true);	
end	
if swagCounter == 1 then
	setProperty('countdownReady.visible', false)
	makeLuaSprite('ready', 'Countdowns/CSGO/ready', screenWidth / 2 - 350, screenHeight / 2 - 300);
	setObjectCamera('ready','other');
	doTweenAlpha('CounterReady', 'ready', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('ready', true);	
end	
if swagCounter == 2 then
	setProperty('countdownSet.visible', false)
	makeLuaSprite('set', 'Countdowns/CSGO/set', screenWidth / 2 - 350, screenHeight / 2 - 310);
	setObjectCamera('set','other');
	doTweenAlpha('CounterSet', 'set', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('set', true);
end	
if swagCounter == 3 then
	setProperty('countdownGo.visible', false)
	makeLuaSprite('GO', 'Countdowns/CSGO/go', screenWidth / 2 - 350, screenHeight / 2 - 340);
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
        setProperty('sacorgHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('sacorgHB.x', getProperty('healthBar.x') - 53);

        setProperty('sacorgHB.angle', getProperty('healthBar.angle'));
        setProperty('sacorgHB.y', getProperty('healthBar.y') - 22);
        setProperty('sacorgHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('sacorgHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('sacorgHB', 4);
        setObjectOrder('healthBar', 3);
	setObjectOrder('healthBarBG', 2);

        setObjectOrder('timeBarBG', 3);
	setObjectOrder('timeBar', 6);
        setObjectOrder('timeCool', 7);

        setTextFont('botplayTxt', "stratum2-medium-webfont.ttf");
        setTextFont('scoreTxt', "stratum2-medium-webfont.ttf");
        setTextFont('timeTxt', "stratum2-medium-webfont.ttf");
        setTextFont('songWM', "stratum2-medium-webfont.ttf");
        setTextFont('healthText', "stratum2-medium-webfont.ttf");
        setTextFont('songText', "stratum2-medium-webfont.ttf");

        setTextFont('ComboText', "stratum2-medium-webfont.ttf");
        setTextFont('SicksText', "stratum2-medium-webfont.ttf");
        setTextFont('GoodsText', "stratum2-medium-webfont.ttf");
        setTextFont('BadsText', "stratum2-medium-webfont.ttf");
        setTextFont('ShitsText', "stratum2-medium-webfont.ttf");
        setTextFont('MissText', "stratum2-medium-webfont.ttf"); 

        setProperty('timeBar.color', getColorFromHex('444444'))
        setProperty('timeTxt.color', getColorFromHex('444444'))
        setProperty('scoreTxt.color', getColorFromHex('444444'))
        setProperty('botplayTxt.color', getColorFromHex('444444'))
        setProperty('healthText.color', getColorFromHex('444444'))
        setProperty('songWM.color', getColorFromHex('444444'))
        setProperty('songText.color', getColorFromHex('444444')) 

        setProperty('underlay.color', getColorFromHex('444444'))
        setProperty('ComboText.color', getColorFromHex('444444'))  
        setProperty('SicksText.color', getColorFromHex('444444'))
        setProperty('GoodsText.color', getColorFromHex('444444'))
        setProperty('BadsText.color', getColorFromHex('444444'))
        setProperty('ShitsText.color', getColorFromHex('444444'))
        setProperty('MissText.color', getColorFromHex('444444'))        
end

function onUpdatePost()
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then

        setProperty('timeCool.y', 16);
        setProperty('timeTxt.y', 15); 
        setProperty('timeTxt.x', 430);
        setProperty('scoreTxt.y', 676);
end
if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

        setProperty('timeCool.y', 674);
        setProperty('timeTxt.y', 675);
        setProperty('timeTxt.x', 430); 
        setProperty('scoreTxt.y', 114);  
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
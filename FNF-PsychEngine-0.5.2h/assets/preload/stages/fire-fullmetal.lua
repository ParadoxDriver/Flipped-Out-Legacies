local xx = 340;
local yy = 580;
local xx2 = 780;
local yy2 = 490;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit 
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-fullmetal'); 
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd-fullmetal'); 
        setPropertyFromClass('GameOverSubstate', 'characterName', 'carryfull-death');
    
	makeLuaSprite('sky2', 'Flippy/Autopsy-Turvy/sky', -600, -225);
        addLuaSprite('sky2', false);
	setScrollFactor('sky2', 0.5, 0.5);
    
        makeLuaSprite('backTrees', 'Flippy/Autopsy-Turvy/more tree', -625, -200);
        addLuaSprite('backTrees', false);
	setScrollFactor('backTrees', 0.7, 0.7);

        makeLuaSprite('trees', 'Flippy/Autopsy-Turvy/dual trees', -640, -200);
        addLuaSprite('trees', false);
	setScrollFactor('trees', 0.9, 0.9);

        makeAnimatedLuaSprite('fire1', 'Flippy/Autopsy-Turvy/UFFFF', -770, -250);	
        addAnimationByPrefix('fire1', 'idle', 'fire', 24, true);
        setLuaSpriteScrollFactor('fireBG', 0.9, 0.9);	
        addLuaSprite('fire1', false);

        makeLuaSprite('ground', 'Flippy/Autopsy-Turvy/ground', -700, -150);
        addLuaSprite('ground', false);
	setScrollFactor('ground', 1.0, 1.0);
	
	makeAnimatedLuaSprite('boombox', 'Flippy/Speaker', 925, 515);
	luaSpriteAddAnimationByPrefix('boombox', 'bop', 'boombox', 16, true);
	setScrollFactor('boombox', 1.0, 1.0);
        addLuaSprite('boombox', false);

        makeAnimatedLuaSprite('Flaky', 'Flippy/Slaughter/Scared_Flaky', 1450, 570);
	luaSpriteAddAnimationByPrefix('Flaky', 'bop', 'Flaky', 16, true);
	setScrollFactor('Flaky', 1.0, 1.0);
        addLuaSprite('Flaky', false);

        makeAnimatedLuaSprite('Speaker', 'Flippy/Slaughter/MiniSpeaker', 925, 515);
	luaSpriteAddAnimationByPrefix('Speaker', 'bop', 'boombox', 16, true);
	setScrollFactor('Speaker', 1.0, 1.0);
        addLuaSprite('Speaker', true);

	makeAnimatedLuaSprite('campfire', 'Flippy/Fire', 500, 360);
	luaSpriteAddAnimationByPrefix('campfire', 'bop', 'fire idle', 12, true);
	setScrollFactor('campfire', 1.0, 1.0);
        setProperty('campfire.alpha', 0.8);
        addLuaSprite('campfire', false);

if not lowQuality then
	makeLuaSprite('table', 'Flippy/Autopsy-Turvy/table', -850, -200);
        setProperty('table.scale.x', 1.1);
	setProperty('table.scale.y', 1.2);
	setScrollFactor('table', 1.3, 1.3);
        addLuaSprite('table', true);

        makeLuaSprite('mota', 'Flippy/Autopsy-Turvy/ForeGround', -1500, -930);
        setScrollFactor('mota', 1.0, 1.0);
        setProperty('mota.scale.x', 0.63);
	setProperty('mota.scale.y', 0.70);
        addLuaSprite('mota', true);
end

if hideHud == false then
        makeLuaSprite('bloodedHB', 'HealthBar-Skins/healthBar2', -50, -200);
	setObjectCamera('bloodedHB', 'hud');
	setScrollFactor('bloodedHB', 0.9, 0.9);
	addLuaSprite('bloodedHB', true);
end
        makeLuaSprite('timeCool', 'TimeBar-Skins/timeBar-Burnt', 396, 16);
	setScrollFactor('timeCool', 0.9, 0.9);
        setProperty('timeCool.alpha', 0);
        setObjectCamera('timeCool', 'hud');
        setProperty('timeCool.scale.x', getProperty('timeCool.scale.x') + 0.02);
	setProperty('timeCool.scale.y', getProperty('timeCool.scale.y') - 0.01);
        addLuaSprite('timeCool', true); 

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

        setObjectOrder('timeBarBG', 7);
	setObjectOrder('timeBar', 8);
        setObjectOrder('timeCool', 9);

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

        setProperty('timeCool.color', getColorFromHex('FF3200'))
        setProperty('timeBar.color', getColorFromHex('FF3200'))
        setProperty('timeTxt.color', getColorFromHex('FF3200'))
        setProperty('scoreTxt.color', getColorFromHex('FF3200'))
        setProperty('botplayTxt.color', getColorFromHex('FF3200'))
        setProperty('healthText.color', getColorFromHex('FF3200'))
        setProperty('songWM.color', getColorFromHex('FF3200'))

        setProperty('underlay.color', getColorFromHex('FF3200'))
        setProperty('ComboText.color', getColorFromHex('FF3200'))  
        setProperty('SicksText.color', getColorFromHex('FF3200'))
        setProperty('GoodsText.color', getColorFromHex('FF3200'))
        setProperty('BadsText.color', getColorFromHex('FF3200'))
        setProperty('ShitsText.color', getColorFromHex('FF3200'))
        setProperty('MissText.color', getColorFromHex('FF3200')) 
end

function onUpdatePost()
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then

        setProperty('scoreTxt.y', 675);
        setProperty('timeCool.y', 17);
        setProperty('timeTxt.y', 16);
end
if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

        setProperty('scoreTxt.y', 114);
        setProperty('timeCool.y', 675);
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
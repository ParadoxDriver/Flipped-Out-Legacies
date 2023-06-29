local xx = 400;
local yy = 560;
local xx2 = 930;
local yy2 = 630;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
	makeLuaSprite('BackGround', 'Flippy/Suicide/Street', -920,-50);
	setScrollFactor('BackGround', 1.0, 1.0);
	setProperty('BackGround.scale.x', 1.1);
	setProperty('BackGround.scale.y', 1.1);
	addLuaSprite('BackGround', false);

        makeLuaSprite('GroundBloody', 'Flippy/Suicide/Street Blood', -920,-50);
	setScrollFactor('GroundBloody', 1.0, 1.0);
	setProperty('GroundBloody.scale.x', 1.1);
	setProperty('GroundBloody.scale.y', 1.1);
        addLuaSprite('GroundBloody', false);
        setProperty('GroundBloody.alpha', 0);
	
        makeAnimatedLuaSprite('Flaky', 'Flippy/Suicide/Scared_Flaky', 1520, 470);
	luaSpriteAddAnimationByPrefix('Flaky', 'bop', 'Flaky', 14, true);
	setScrollFactor('Flaky', 1.0, 1.0);
        setProperty('Flaky.scale.x', 0.9);
	setProperty('Flaky.scale.y', 0.9);
        addLuaSprite('Flaky', true);

        makeAnimatedLuaSprite('rain', 'Flippy/Suicide/rain', -200, -200);
        addAnimationByPrefix('rain', 'loop', 'rain loop', 15, true);
        setLuaSpriteScrollFactor('rain', 0.3, 0.3);
        setProperty('rain.scale.x', 1.4);
	setProperty('rain.scale.y', 1.6);
        setProperty('rain.alpha', 0.5);
        addLuaSprite('rain', true);

if not lowQuality then
        makeAnimatedLuaSprite('splash', 'Flippy/Suicide/splash', 0, 0);
        addAnimationByPrefix('splash', 'loop', 'splash loop', 15, true);
        setProperty('splash.alpha', 0.5);
        setProperty('splash.scale.x', 1.4);
	setProperty('splash.scale.y', 1.6);
	addLuaSprite('splash', false);
end

if hideHud == false then
        makeLuaSprite('uglyHB', 'HealthBar-Skins/healthBarSuffering', 0, 0);
        setObjectCamera('uglyHB', 'hud');
        setScrollFactor('uglyHB', 0.9, 0.9);
        addLuaSprite('uglyHB', true);
end
        makeLuaSprite('shadow', 'vinetca', -640, -300);
        setObjectCamera('shadow', 'other'); 
        setProperty('shadow.scale.x', 0.5);
	setProperty('shadow.scale.y', 0.6);
        addLuaSprite('shadow', false);

        makeAnimatedLuaSprite('vhsoverlay', 'Effects/vhs', -100, -40);
	addAnimationByPrefix('vhsoverlay', 'vhs', 'vhs', 24, true);
	setObjectCamera('vhsoverlay', 'other');
	setGraphicSize('vhsoverlay', 1000, 730);
	setProperty('vhsoverlay.alpha', 0.7);
        setProperty('vhsoverlay.scale.x', 3.7);
	setProperty('vhsoverlay.scale.y', 3.7); 
        addLuaSprite('vhsoverlay', true);

        makeAnimatedLuaSprite('pantalla', 'Effects/pantalla',0,0);
        addAnimationByPrefix('pantalla', 'staticbg', 'pantalla',24,true);
        addLuaSprite('pantalla',true);
        objectPlayAnimation('pantalla', 'staticbg',true);
        setObjectCamera('pantalla', 'other');
        scaleObject('pantalla',0.67,0.67);

        setProperty('introSoundsSuffix', '-satanic')
end

function onGameOver()
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-suicide');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd-suicide'); 
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-retro');
	return Function_Continue;
end

function onCountdownTick(swagCounter)
if swagCounter == 1 then
	setProperty('countdownReady.visible', false)
	makeLuaSprite('ready', 'Countdowns/Suffering/ready', screenWidth / 2 - 350, screenHeight / 2 - 185);
	setObjectCamera('ready','other');
	doTweenAlpha('elpepe', 'ready', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('ready', true);	
end	
if swagCounter == 2 then
	setProperty('countdownSet.visible', false)
	makeLuaSprite('set', 'Countdowns/Suffering/set', screenWidth / 2 - 369, screenHeight / 2 - 185);
	setObjectCamera('set','other');
	doTweenAlpha('elpepe', 'set', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('set', true);
end	
if swagCounter == 3 then
	setProperty('countdownGo.visible', false)
	makeLuaSprite('GO', 'Countdowns/Suffering/go', screenWidth / 2 - 295, screenHeight / 2 - 215);
	setObjectCamera('GO','other');
	doTweenAlpha('elpepe', 'GO', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('GO', true);
	end
end

function onCreatePost()
        setProperty('uglyHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('uglyHB.x', getProperty('healthBar.x') - 55);
        setProperty('uglyHB.angle', getProperty('healthBar.angle'));
        setProperty('uglyHB.y', getProperty('healthBar.y') - 18);
        setProperty('uglyHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('uglyHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('uglyHB', 5);
        setObjectOrder('healthBar', 3);
        setObjectOrder('healthBarBG', 2);

        setTextFont('botplayTxt', "Disney.ttf");
        setTextFont('scoreTxt', "Disney.ttf");
        setTextFont('songWM', "Disney.ttf");
        setTextFont('healthText', "Disney.ttf");

        setTextFont('ComboText', "Disney.ttf");
        setTextFont('SicksText', "Disney.ttf");
        setTextFont('GoodsText', "Disney.ttf");
        setTextFont('BadsText', "Disney.ttf");
        setTextFont('ShitsText', "Disney.ttf");
        setTextFont('MissText', "Disney.ttf");
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
            setProperty('defaultCamZoom',0.63)
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
            setProperty('defaultCamZoom',1.0)
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
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
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
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NoteSkins/WNOTE_assets');
		end
	end

	for i = 0, getProperty('playerStrums.length') -1 do
		if getPropertyFromGroup('playerStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('playerStrums', i, 'texture', 'NoteSkins/WNOTE_assets');
		end
	end

	for i = 0, getProperty('unspawnNotes.length') -1 do
		if getPropertyFromGroup('unspawnNotes', i, 'texture') == '' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/WNOTE_assets');
		end

		setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'SplashesSkins/WnoteSplashes');
	end
end

function opponentNoteHit(id,data,type,sus)
	triggerEvent('Screen Shake','0.1,0.007','0.1,0.007')
health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.0157);
    end
end
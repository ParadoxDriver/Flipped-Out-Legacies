local xx = 350;
local yy = 590;
local xx2 = 730;
local yy2 = 600;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
	makeLuaSprite('street', 'Flippy/City', -700, -150);
	setScrollFactor('street', 1.0, 1.0);
        addLuaSprite('street', false);

        makeAnimatedLuaSprite('Flaky', 'Flippy/Suicide/Scared_Flaky', 1470, 520);
	luaSpriteAddAnimationByPrefix('Flaky', 'bop', 'Flaky', (curBpm / 4), true);
	setScrollFactor('Flaky', 1.0, 1.0);
        setProperty('Flaky.scale.x', 0.95);
	setProperty('Flaky.scale.y', 0.95);
        addLuaSprite('Flaky', true);

if not lowQuality then
        makeAnimatedLuaSprite('foggy', 'Flippy/Fallout/fog',  -1700,  480);
	luaSpriteAddAnimationByPrefix('foggy', 'bop', 'nieblal', 30, true);
	setScrollFactor('foggy', 1.0, 1.0);
        addLuaSprite('foggy', true);

        makeAnimatedLuaSprite('lapcvaaexplotar', 'Flippy/Fallout/fog',  -1700,  480);
	luaSpriteAddAnimationByPrefix('lapcvaaexplotar', 'bop', 'nieblal', 30, true);
	setScrollFactor('lapcvaaexplotar', 1.0, 1.0);
        setPropertyLuaSprite('lapcvaaexplotar', 'flipX', true);
        addLuaSprite('lapcvaaexplotar', true);
end

if hideHud == false then
        makeLuaSprite('crazyHB', 'HealthBar-Skins/healthBarMadness', 0, 0);
        setObjectCamera('crazyHB', 'hud');
        setScrollFactor('crazyHB', 0.9, 0.9);
        addLuaSprite('crazyHB', true);
end
        makeLuaSprite('BlackBords', 'cooloutline', 0, 0);
        setObjectCamera('BlackBords', 'other');
	addLuaSprite('BlackBords', true);

        makeAnimatedLuaSprite('vhsoverlay', 'Effects/vhs', -100, -40);
	addAnimationByPrefix('vhsoverlay', 'vhs', 'vhs', 24, true);
	setObjectCamera('vhsoverlay', 'other');
	setGraphicSize('vhsoverlay', 1000, 730);
	setProperty('vhsoverlay.alpha', 0.5);
        setProperty('vhsoverlay.scale.x', 3.7);
	setProperty('vhsoverlay.scale.y', 3.7); 
        addLuaSprite('vhsoverlay', true);

        makeAnimatedLuaSprite('overlay','Effects/overlay',0,0);
        addAnimationByPrefix('overlay','Overlay', 'Overlay', 24, true);
	setProperty('overlay.scale.x', 1.08);
	setProperty('overlay.scale.y', 1.08); 
        setObjectCamera('overlay','other');
        addLuaSprite('overlay', true);

        setProperty('introSoundsSuffix', '-mortimer')
end

function onCountdownTick(swagCounter)
if swagCounter == 1 then
	setProperty('countdownReady.visible', false)
	makeLuaSprite('ready', 'Countdowns/AVI/ready', screenWidth / 2 - 350, screenHeight / 2 - 160);
	setObjectCamera('ready','other');
	doTweenAlpha('elpepe', 'ready', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('ready', true);	
end	
if swagCounter == 2 then
	setProperty('countdownSet.visible', false)
	makeLuaSprite('set', 'Countdowns/AVI/set', screenWidth / 2 - 370, screenHeight / 2 - 150);
	setObjectCamera('set','other');
	doTweenAlpha('elpepe', 'set', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('set', true);
end	
if swagCounter == 3 then
	setProperty('countdownGo.visible', false)
	makeLuaSprite('GO', 'Countdowns/AVI/go', screenWidth / 2 - 300, screenHeight / 2 - 215);
	setObjectCamera('GO','other');
	doTweenAlpha('elpepe', 'GO', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('GO', true);
	end
end

function onCreatePost()
        setProperty('crazyHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('crazyHB.x', getProperty('healthBar.x') - 33);

        setProperty('crazyHB.angle', getProperty('healthBar.angle'));
        setProperty('crazyHB.y', getProperty('healthBar.y') - 38.5);
        setProperty('crazyHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('crazyHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('crazyHB', 5);
        setObjectOrder('healthBar', 3);
        setObjectOrder('healthBarBG', 2);

        setTextFont('botplayTxt', "Disney.ttf");
        setTextFont('scoreTxt', "Disney.ttf");
        setTextFont('timeTxt', "Disney.ttf");
        setTextFont('songWM', "Disney.ttf");
        setTextFont('healthText', "Disney.ttf");

        setTextFont('ComboText', "Disney.ttf");
        setTextFont('SicksText', "Disney.ttf");
        setTextFont('GoodsText', "Disney.ttf");
        setTextFont('BadsText', "Disney.ttf");
        setTextFont('ShitsText', "Disney.ttf");
        setTextFont('MissText', "Disney.ttf");

        setProperty('timeBar.color', getColorFromHex('4B4B4B'))
        setProperty('timeTxt.color', getColorFromHex('4B4B4B'))
        setProperty('scoreTxt.color', getColorFromHex('4B4B4B'))
        setProperty('botplayTxt.color', getColorFromHex('4B4B4B'))
        setProperty('healthText.color', getColorFromHex('4B4B4B'))
        setProperty('songWM.color', getColorFromHex('4B4B4B'))  
        
        setProperty('underlay.color', getColorFromHex('4B4B4B'))
        setProperty('ComboText.color', getColorFromHex('4B4B4B'))  
        setProperty('SicksText.color', getColorFromHex('4B4B4B'))
        setProperty('GoodsText.color', getColorFromHex('4B4B4B'))
        setProperty('BadsText.color', getColorFromHex('4B4B4B'))
        setProperty('ShitsText.color', getColorFromHex('4B4B4B'))
        setProperty('MissText.color', getColorFromHex('4B4B4B'))  
end

function onCountdownStarted()
	for i = 0, getProperty('opponentStrums.length') -1 do
		if getPropertyFromGroup('opponentStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NoteSkins/GreyNote_assets');
		end
	end

	for i = 0, getProperty('playerStrums.length') -1 do
		if getPropertyFromGroup('playerStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('playerStrums', i, 'texture', 'NoteSkins/GreyNote_assets');
		end
	end

	for i = 0, getProperty('unspawnNotes.length') -1 do
		if getPropertyFromGroup('unspawnNotes', i, 'texture') == '' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/GreyNote_assets');
		end

		setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'SplashesSkins/Grey_noteSplashes');
	end
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

function onEvent(n,v1,v2)
if n == 'Camera Follow Opponent' then 
	CameraPos = tonumber(v1)
if CameraPos == 1 then
	xx2 = 100
        yy2 = 590
elseif CameraPos == 0 then
        xx2 = 730
        yy2 = 600
      end
   end
end
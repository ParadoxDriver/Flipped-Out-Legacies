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
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOverRemix');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEndRemix'); 
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-side-dead'); 

	makeLuaSprite('sky', 'Flippy/FLP/Sky', -600, -225);
	setScrollFactor('sky', 0.5, 0.5);
        addLuaSprite('sky', false);

	makeLuaSprite('backTrees', 'Flippy/FLP/BackTrees', -625, -200);
	setScrollFactor('backTrees', 0.7, 0.7);
        addLuaSprite('backTrees', false);

	makeLuaSprite('trees', 'Flippy/FLP/Trees', -625, -225);
	setScrollFactor('trees', 0.8, 0.8);
	addLuaSprite('trees', false);

	makeLuaSprite('ground', 'Flippy/FLP/Ground', -700, -150);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false);

if not lowQuality then
	makeLuaSprite('table', 'Flippy/FLP/Table', -850, -200);
        setProperty('table.scale.x', 1.1);
	setProperty('table.scale.y', 1.2);
	setScrollFactor('table', 1.3, 1.3);
        addLuaSprite('table', true); 
end

if hideHud == false then
        makeLuaSprite('reduxHB', 'HealthBar-Skins/healthbarRedux',  -50, -200);
	setObjectCamera('reduxHB', 'hud');
        setScrollFactor('reduxHB', 0.9, 0.9);
	addLuaSprite('reduxHB', true);
end
        makeLuaSprite('timeCool', 'TimeBar-Skins/timeBar-Redux', 395, 16);
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

        setProperty('introSoundsSuffix', '-redux')
end

function onCreatePost()
        setProperty('reduxHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));
 
        setProperty('reduxHB.x', getProperty('healthBar.x') - 80);

        setProperty('reduxHB.angle', getProperty('healthBar.angle'));
        setProperty('reduxHB.y', getProperty('healthBar.y') - 55);
        setProperty('reduxHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('reduxHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('reduxHB', 4);
        setObjectOrder('healthBar', 3);
	setObjectOrder('healthBarBG', 2);

        setObjectOrder('timeBarBG', 3);
	setObjectOrder('timeBar', 6);
        setObjectOrder('timeCool', 7);

        setTextFont('botplayTxt', "neon2.ttf");
        setTextFont('scoreTxt', "neon2.ttf");
        setTextFont('timeTxt', "neon2.ttf");
        setTextFont('songWM', "neon2.ttf");
        setTextFont('healthText', "neon2.ttf");
        setTextFont('songText', "neon2.ttf");

        setTextFont('ComboText', "neon2.ttf");
        setTextFont('SicksText', "neon2.ttf");
        setTextFont('GoodsText', "neon2.ttf");
        setTextFont('BadsText', "neon2.ttf");
        setTextFont('ShitsText', "neon2.ttf");
        setTextFont('MissText', "neon2.ttf"); 

        setProperty('timeBar.color', getColorFromHex('8E08C7'))
        setProperty('timeTxt.color', getColorFromHex('8E08C7'))
        setProperty('scoreTxt.color', getColorFromHex('8E08C7'))
        setProperty('botplayTxt.color', getColorFromHex('8E08C7'))
        setProperty('healthText.color', getColorFromHex('8E08C7'))
        setProperty('songWM.color', getColorFromHex('8E08C7')) 

        setProperty('underlay.color', getColorFromHex('8E08C7'))
        setProperty('ComboText.color', getColorFromHex('8E08C7'))  
        setProperty('SicksText.color', getColorFromHex('8E08C7'))
        setProperty('GoodsText.color', getColorFromHex('8E08C7'))
        setProperty('BadsText.color', getColorFromHex('8E08C7'))
        setProperty('ShitsText.color', getColorFromHex('8E08C7'))
        setProperty('MissText.color', getColorFromHex('8E08C7'))    
end

function onCountdownTick(swagCounter)
if swagCounter == 1 then
	setProperty('countdownReady.visible', false)
	makeLuaSprite('ready', 'Countdowns/Redux/ready', screenWidth / 2 - 369, screenHeight / 2 - 185);
	setObjectCamera('ready','other');
	doTweenAlpha('elpepe', 'ready', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('ready', true);	
end	
if swagCounter == 2 then
	setProperty('countdownSet.visible', false)
	makeLuaSprite('set', 'Countdowns/Redux/set', screenWidth / 2 - 369, screenHeight / 2 - 185);
	setObjectCamera('set','other');
	doTweenAlpha('elpepe', 'set', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('set', true);
end	
if swagCounter == 3 then
	setProperty('countdownGo.visible', false)
	makeLuaSprite('GO', 'Countdowns/Redux/go', screenWidth / 2 - 289, screenHeight / 2 - 215);
	setObjectCamera('GO','other');
	doTweenAlpha('elpepe', 'GO', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('GO', true);
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

function onUpdatePost()
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then

        setProperty('scoreTxt.y', 679);
        setProperty('timeCool.y', 16);
        setProperty('timeTxt.y', 22); 
end

if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

        setProperty('scoreTxt.y', 117); 
        setProperty('timeCool.y', 671);
        setProperty('timeTxt.y', 675);
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

function onCountdownStarted()
	for i = 0, getProperty('opponentStrums.length') -1 do
		if getPropertyFromGroup('opponentStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NoteSkins/Bside_assets');
		end
	end

	for i = 0, getProperty('playerStrums.length') -1 do
		if getPropertyFromGroup('playerStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('playerStrums', i, 'texture', 'NoteSkins/Bside_assets');
		end
	end

	for i = 0, getProperty('unspawnNotes.length') -1 do
		if getPropertyFromGroup('unspawnNotes', i, 'texture') == '' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/Bside_assets');
		end

		setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'SplashesSkins/BSIDEnoteSplashes');
	end
end
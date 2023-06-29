local xx = 370;
local yy = 500;
local xx2 = 770;
local yy2 = 550;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOverFever');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEndFever');
        setPropertyFromClass('GameOverSubstate', 'characterName', 'flippy-phantasm');

	makeLuaSprite('sky', 'Flippy/Night/Sky', -600, -255);
	setLuaSpriteScrollFactor('sky', 0.5, 0.5);
	addLuaSprite('sky', false);

	makeLuaSprite('backTrees', 'Flippy/Night/BackTrees', -625, -200);
	setLuaSpriteScrollFactor('backTrees', 0.7, 0.7);
	addLuaSprite('backTrees', false);

	makeLuaSprite('trees', 'Flippy/Night/Trees', -625, -225);
	setLuaSpriteScrollFactor('trees', 0.8, 0.8);
	addLuaSprite('trees', false);

	makeLuaSprite('ground', 'Flippy/Night/Ground', -700, -150);
	addLuaSprite('ground', false);

        makeAnimatedLuaSprite('campfire', 'Flippy/Hunter/Fire', 500, 360)
	luaSpriteAddAnimationByPrefix('campfire', 'bop', 'fire idle', 12, true)
	setScrollFactor('campfire', 1.0, 1.0);
        setProperty('campfire.alpha', 0.8);
        addLuaSprite('campfire', false);

if not lowQuality then
	makeLuaSprite('table', 'Flippy/Night/Table', -850, -225);
	setProperty('table.scale.x', 1.1);
	setProperty('table.scale.y', 1.1);
	setLuaSpriteScrollFactor('table', 1.3, 1.3);
	addLuaSprite('table', true);	
end	 

if hideHud == false then
        makeLuaSprite('feverHB', 'HealthBar-Skins/healthBarFever', -50, -200);
	setScrollFactor('feverHB', 0.9, 0.9);
	setObjectCamera('feverHB', 'hud');
        addLuaSprite('feverHB', true);
end
        makeLuaSprite('timeCool', 'TimeBar-Skins/timeBar-Fever', 396, 16);
	setScrollFactor('timeCool', 0.9, 0.9);
        setProperty('timeCool.alpha', 0);
        setObjectCamera('timeCool', 'hud');
        setProperty('timeCool.scale.x', getProperty('timeCool.scale.x') + 0.02);
	setProperty('timeCool.scale.y', getProperty('timeCool.scale.y') - 0.01);
        addLuaSprite('timeCool', true);

        setProperty('introSoundsSuffix', '-fever')
end

function onCreatePost()
        setProperty('feverHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('feverHB.x', getProperty('healthBar.x') - 200);

        setProperty('feverHB.angle', getProperty('healthBar.angle'));
        setProperty('feverHB.y', getProperty('healthBar.y') - 24);
        setProperty('feverHB.scale.x', getProperty('healthBar.scale.x') - 0.27);
        setProperty('feverHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('feverHB', 5);
        setObjectOrder('healthBar', 3);
	setObjectOrder('healthBarBG', 2);

        setObjectOrder('timeBarBG', 3);
        setObjectOrder('timeBar', 6);
        setObjectOrder('timeCool', 7);

        setProperty('timeBar.color', getColorFromHex('278EC9'))
        setProperty('timeTxt.color', getColorFromHex('278EC9'))
        setProperty('scoreTxt.color', getColorFromHex('278EC9'))
        setProperty('botplayTxt.color', getColorFromHex('278EC9'))
        setProperty('healthText.color', getColorFromHex('278EC9'))
        setProperty('songWM.color', getColorFromHex('278EC9'))

        setProperty('underlay.color', getColorFromHex('278EC9'))
        setProperty('ComboText.color', getColorFromHex('278EC9'))  
        setProperty('SicksText.color', getColorFromHex('278EC9'))
        setProperty('GoodsText.color', getColorFromHex('278EC9'))
        setProperty('BadsText.color', getColorFromHex('278EC9'))
        setProperty('ShitsText.color', getColorFromHex('278EC9'))
        setProperty('MissText.color', getColorFromHex('278EC9'))
end

function onCountdownTick(swagCounter)
if swagCounter == 0 then
	makeLuaSprite('get', 'Countdowns/Fever/get-ready', screenWidth / 2 - 189, screenHeight / 2 - 100);
	setObjectCamera('get','other');
	doTweenAlpha('CounterGet', 'get', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('get', true);	
end	
if swagCounter == 1 then
	setProperty('countdownReady.visible', false)
	makeLuaSprite('ready', 'Countdowns/Fever/ready', screenWidth / 2 - 149, screenHeight / 2 - 100);
	setObjectCamera('ready','other');
	doTweenAlpha('CounterReady', 'ready', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('ready', true);	
end	
if swagCounter == 2 then
	setProperty('countdownSet.visible', false)
	makeLuaSprite('set', 'Countdowns/Fever/set', screenWidth / 2 - 109, screenHeight / 2 - 100);
	setObjectCamera('set','other');
	doTweenAlpha('CounterSet', 'set', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('set', true);
end	
if swagCounter == 3 then
	setProperty('countdownGo.visible', false)
	makeLuaSprite('GO', 'Countdowns/Fever/go', screenWidth / 2 - 289, screenHeight / 2 - 215);
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

function onUpdatePost()
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then

        setProperty('timeCool.y', 16);
end

if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

        setProperty('timeCool.y', 674);
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
        if curBeat == 127 then
        xx = 430;
        yy = 500;
        xx2 = 900;
        yy2 = 600;
    end
        if curBeat == 160 then
        xx = 330;
        yy = 450;
        doTweenZoom('zoom', 'camGame', 0.95, 7, 'sineInOut');
        setProperty('defaultCamZoom', 0.95);
    end
        if curBeat == 175 then
        xx = 1250;
        yy = 630;
        xx2 = 1250;
        yy2 = 630;
    end
        if curBeat == 190 then
        doTweenZoom('zoom', 'camGame', 9.99, 0.3, 'sineInOut');
        setProperty('defaultCamZoom', 9.99);
    end
        if curBeat == 192 then
        xx = 260;
        yy = 450;
        doTweenZoom('zoom', 'camGame', 1.2, 4, 'sineInOut');
        setProperty('defaultCamZoom', 1.2);
    end
        if curBeat == 207 then
        doTweenZoom('zoom', 'camGame', 0.55, 10, 'linear');
        xx = 260;
        yy = 450;
        xx2 = 260;
        yy2 = 450;
    end
        if curBeat == 224 then
        doTweenZoom('zoom', 'camGame', 0.65, 0.01, 'sineInOut');
        setProperty('defaultCamZoom', 0.65);
        xx = 370;
        yy = 500;
        xx2 = 770;
        yy2 = 550;
    end
        if curBeat == 351 then
        xx = 260;
        yy = 400;
        xx2 = 260;
        yy2 = 400;
    end
        if curBeat == 368 then
        xx = 1250;
        yy = 630;
        xx2 = 1250;
        yy2 = 630;
    end
        if curBeat == 384 then
        xx = 260;
        yy = 400;
        xx2 = 260;
        yy2 = 400;
    end
        if curBeat == 400 then
        xx = 1250;
        yy = 630;
        xx2 = 1250;
        yy2 = 630;
    end
        if curBeat == 448 then
        xx = 370;
        yy = 500;
        xx2 = 770;
        yy2 = 550;
    end
end

function onCountdownStarted()
	for i = 0, getProperty('opponentStrums.length') -1 do
		if getPropertyFromGroup('opponentStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NoteSkins/feverNotes');
		end
	end

	for i = 0, getProperty('playerStrums.length') -1 do
		if getPropertyFromGroup('playerStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('playerStrums', i, 'texture', 'NoteSkins/feverNotes');
		end
	end

	for i = 0, getProperty('unspawnNotes.length') -1 do
		if getPropertyFromGroup('unspawnNotes', i, 'texture') == '' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/feverNotes');
		end

		setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'SplashesSkins/feverNoteSplash');
	end
end
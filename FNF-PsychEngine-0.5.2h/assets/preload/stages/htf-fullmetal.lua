local xx = 410;
local yy = 550;
local xx2 = 800;
local yy2 = 520;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-htf'); 
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd-htf');  
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-fullmetal');

	makeLuaSprite('ground', 'Flippy/Compass/Camp-cute', -550, -200);
        addLuaSprite('ground', false);

        makeLuaSprite('stump', 'Flippy/AppleMoment/Stump-cute', 929, 570);
        setProperty('stump.alpha', 0);
        addLuaSprite('stump', false);

        makeLuaSprite('picnic', 'Flippy/AppleMoment/Picnic-Tablecloth', -570, 500);
        setProperty('picnic.scale.x', 1.1);
	setProperty('picnic.scale.y', 1.1);
        setProperty('picnic.alpha', 0);
        addLuaSprite('picnic', false);

        makeAnimatedLuaSprite('flakyRussell', 'Flippy/Compass/FlakyRussellBG', -570, 450);
	addAnimationByPrefix('flakyRussell', 'idle', 'Flaky Russell jive', 20, true);
	objectPlayAnimation('flakyRussell', 'idle');
        addLuaSprite('flakyRussell', false);

if hideHud == false then
        makeLuaSprite('coolHB', 'HealthBar-Skins/healthBarHtf', -50, -200);
	setScrollFactor('coolHB', 0.9, 0.9);
	setObjectCamera('coolHB', 'hud');
        addLuaSprite('coolHB', true);
end
        makeLuaSprite('timeCool', 'TimeBar-Skins/timeBar-Htf', 396, 16);
	setScrollFactor('timeCool', 0.9, 0.9);
        setProperty('timeCool.alpha', 0);
        setObjectCamera('timeCool', 'hud');
        setProperty('timeCool.scale.x', getProperty('timeCool.scale.x') + 0.02);
	setProperty('timeCool.scale.y', getProperty('timeCool.scale.y') - 0.01);
        addLuaSprite('timeCool', true);

        setObjectOrder('picnic', 8);
	setObjectOrder('flakyRussell', 8);
	setObjectOrder('gfGroup', 6);
        setObjectOrder('dadGroup', 8);
        setObjectOrder('stump', 5);
	setObjectOrder('boyfriendGroup', 6);
        setProperty('introSoundsSuffix', '-fullmetal')
end

function onCountdownTick(swagCounter)
if swagCounter == 1 then
	setProperty('countdownReady.visible', false)
	makeLuaSprite('ready', 'Countdowns/HappyTrees/ready', screenWidth / 2 - 290, screenHeight / 2 - 140);
	setObjectCamera('ready','other');
	doTweenAlpha('elpepe', 'ready', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('ready', true);
end	
if swagCounter == 2 then
	setProperty('countdownSet.visible', false)
	makeLuaSprite('set', 'Countdowns/HappyTrees/set', screenWidth / 2 - 250, screenHeight / 2 - 100);
	setObjectCamera('set','other');
	doTweenAlpha('elpepe', 'set', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('set', true);
end	
if swagCounter == 3 then
	setProperty('countdownGo.visible', false)
	makeLuaSprite('GO', 'Countdowns/HappyTrees/go', screenWidth / 2 - 170, screenHeight / 2 - 100);
	setObjectCamera('GO','other');
	doTweenAlpha('elpepe', 'GO', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('GO', true);
    end
end

function onCreatePost()
        setProperty('coolHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('coolHB.x', getProperty('healthBar.x') - 200);

        setProperty('coolHB.angle', getProperty('healthBar.angle'));
        setProperty('coolHB.y', getProperty('healthBar.y') - 24);
        setProperty('coolHB.scale.x', getProperty('healthBar.scale.x') - 0.27);
        setProperty('coolHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('coolHB', 5);
        setObjectOrder('healthBar', 3);
        setObjectOrder('healthBarBG', 2);

        setObjectOrder('timeBarBG', 3);
	setObjectOrder('timeBar', 6);
        setObjectOrder('timeCool', 7);

        setTextFont('botplayTxt', "happyTrees.ttf");
        setTextFont('scoreTxt', "happyTrees.ttf");
        setTextFont('timeTxt', "happyTrees.ttf");
        setTextFont('songWM', "happyTrees.ttf");
        setTextFont('healthText', "happyTrees.ttf");
        setTextFont('songText', "happyTrees.ttf");

        setTextFont('ComboText', "happyTrees.ttf");
        setTextFont('SicksText', "happyTrees.ttf");
        setTextFont('GoodsText', "happyTrees.ttf");
        setTextFont('BadsText', "happyTrees.ttf");
        setTextFont('ShitsText', "happyTrees.ttf");
        setTextFont('MissText', "happyTrees.ttf");

        setProperty('timeBar.color', getColorFromHex('98FF9C'))
        setProperty('timeTxt.color', getColorFromHex('98FF9C'))
        setProperty('scoreTxt.color', getColorFromHex('98FF9C'))
        setProperty('botplayTxt.color', getColorFromHex('98FF9C'))
        setProperty('healthText.color', getColorFromHex('98FF9C'))
        setProperty('songWM.color', getColorFromHex('98FF9C'))

        setProperty('underlay.color', getColorFromHex('98FF9C'))
        setProperty('ComboText.color', getColorFromHex('98FF9C'))  
        setProperty('SicksText.color', getColorFromHex('98FF9C'))
        setProperty('GoodsText.color', getColorFromHex('98FF9C'))
        setProperty('BadsText.color', getColorFromHex('98FF9C'))
        setProperty('ShitsText.color', getColorFromHex('98FF9C'))
        setProperty('MissText.color', getColorFromHex('98FF9C'))  
end

function onUpdatePost()
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then

        setProperty('timeTxt.y', 16); 
        setProperty('timeCool.y', 16);
end
if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

        setProperty('timeTxt.y', 674); 
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
end

function onCountdownStarted()
	for i = 0, getProperty('opponentStrums.length') -1 do
		if getPropertyFromGroup('opponentStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NoteSkins/HTF_Note');
		end
	end

	for i = 0, getProperty('playerStrums.length') -1 do
		if getPropertyFromGroup('playerStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('playerStrums', i, 'texture', 'NoteSkins/HTF_Note');
		end
	end

	for i = 0, getProperty('unspawnNotes.length') -1 do
		if getPropertyFromGroup('unspawnNotes', i, 'texture') == '' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/HTF_Note');
              end

              setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'SplashesSkins/HTF_Splashes');
       end
end

function onBeatHit()

if curBeat % 2 == 0 then

      objectPlayAnimation('flakyRussell', 'idle', true);

   end

end
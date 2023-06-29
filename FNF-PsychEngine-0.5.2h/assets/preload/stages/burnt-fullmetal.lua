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
    
	makeLuaSprite('sky', 'Flippy/Autopsy-Turvy/sky', -600, -225);
        addLuaSprite('sky', false);
	setScrollFactor('sky', 0.5, 0.5);
 
        makeAnimatedLuaSprite('smoke', 'Flippy/Fallout/SmokeRight', 500, -260);
	luaSpriteAddAnimationByPrefix('smoke', 'idle', 'SmokeRight instance', 24, true);
        objectPlayAnimation('smoke', 'smoke');
	setProperty('smoke.scale.x', 0.5);
	setProperty('smoke.scale.y', 0.5);
        addLuaSprite('smoke', false);

        makeLuaSprite('backTrees', 'Flippy/Autopsy-Turvy/more tree', -625, -200);
        addLuaSprite('backTrees', false);
	setScrollFactor('backTrees', 0.7, 0.7);

        makeLuaSprite('trees', 'Flippy/Autopsy-Turvy/dual trees', -640, -200);
        addLuaSprite('trees', false);
	setScrollFactor('trees', 0.9, 0.9);

        makeAnimatedLuaSprite('fireBG', 'Flippy/Autopsy-Turvy/UFFFF', -770, -250);	
        addAnimationByPrefix('fireBG', 'idle', 'fire', 24, true);
        setLuaSpriteScrollFactor('fireBG', 0.9, 0.9);	
        addLuaSprite('fireBG', false);

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

        makeAnimatedLuaSprite('bloodFoggy', 'Flippy/Assault/Red_Foggy',  -3020,  450);
	luaSpriteAddAnimationByPrefix('bloodFoggy', 'bop', 'niebla', 30, true);
	setScrollFactor('bloodFoggy', 1.0, 1.0);
        addLuaSprite('bloodFoggy', true);

        makeAnimatedLuaSprite('fog', 'Flippy/Assault/Red_Foggy',  -2850,  450);
	luaSpriteAddAnimationByPrefix('fog', 'bop', 'niebla', 30, true);
	setScrollFactor('fog', 1.0, 1.0);
        setPropertyLuaSprite('fog', 'flipX', true);
        addLuaSprite('fog', true);

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

--Flashback bg
        makeLuaSprite('sky2', 'Flippy/Fallout/FlashBack/background', -600, -225);
        setScrollFactor('sky2', 0.5, 0.5);
        addLuaSprite('sky2', false);

	makeLuaSprite('backtrees2', 'Flippy/Fallout/FlashBack/backtrees', -625, -200);
        setScrollFactor('backtrees2', 0.7, 0.7);
        addLuaSprite('backtrees2', false);

	makeLuaSprite('ground2', 'Flippy/Fallout/FlashBack/ground', -700, -150);
        setScrollFactor('ground2', 1.0, 1.0);
        addLuaSprite('ground2', false);

	makeLuaSprite('buddies', 'Flippy/Fallout/FlashBack/buddies', -700, -150);	
	setScrollFactor('buddies', 1.0, 1.0);
	addLuaSprite('buddies', true);

        makeAnimatedLuaSprite('vhsoverlay', 'Effects/vhs', -100, -40);
	addAnimationByPrefix('vhsoverlay', 'vhs', 'vhs', 24, true);
	setObjectCamera('vhsoverlay', 'other');
	setGraphicSize('vhsoverlay', 1000, 730);
	setProperty('vhsoverlay.alpha', 0);
        setProperty('vhsoverlay.scale.x', 3.7);
	setProperty('vhsoverlay.scale.y', 3.7); 
        addLuaSprite('vhsoverlay', true);

        makeLuaSprite('VCR', 'Effects/VCR', 320, 180);
        setProperty('VCR.scale.x', 2.04);
	setProperty('VCR.scale.y', 2.12);
        setProperty('VCR.alpha', 0);  
        setObjectCamera('VCR', 'other');
        addLuaSprite('VCR', true);   
	
	setProperty('sky2.visible', false);	
	setProperty('backtrees2.visible', false);
	setProperty('ground2.visible', false);	
	setProperty('buddies.visible', false);
 
--Sound intro cool
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

-- Flashback Sequence in Fallout-Guerrilla
function onStepHit()
if curStep == 768 then

      doTweenColor('bloodedHB',  'bloodedHB', '647864', 0.3, 'linear');
      doTweenColor('timeCool',  'timeCool', '647864', 0.3, 'linear');

      setProperty('timeBar.color', getColorFromHex('647864'))
      setProperty('timeTxt.color', getColorFromHex('647864'))
      setProperty('scoreTxt.color', getColorFromHex('647864'))
      setProperty('botplayTxt.color', getColorFromHex('647864'))
      setProperty('healthText.color', getColorFromHex('647864'))
      setProperty('songWM.color', getColorFromHex('647864'))

      setProperty('underlay.color', getColorFromHex('647864'))
      setProperty('ComboText.color', getColorFromHex('647864'))  
      setProperty('SicksText.color', getColorFromHex('647864'))
      setProperty('GoodsText.color', getColorFromHex('647864'))
      setProperty('BadsText.color', getColorFromHex('647864'))
      setProperty('ShitsText.color', getColorFromHex('647864'))
      setProperty('MissText.color', getColorFromHex('647864'))  

      setPropertyFromClass('GameOverSubstate', 'characterName', 'picodeath-uber');
      setProperty('defaultCamZoom', 0.56);
      setProperty('vhsoverlay.alpha', 0.4);
      setProperty('VCR.alpha', 1);
      xx = 490;
      xx2 = 690;
      yy2 = 580;
      setCharacterX('dad', 100);
      setCharacterY('dad', 100);
      setCharacterX('bf', 770);
      setCharacterY('bf', 100);
end

if curStep == 1024 then

      setProperty('defaultCamZoom', 0.75);
end

if curStep == 1032 then

      doTweenColor('bloodedHB',  'bloodedHB', 'FFFFFF', 0.3, 'linear'); 
      doTweenColor('timeCool',  'timeCool', 'FFFFFF', 0.3, 'linear');

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

      setPropertyFromClass('GameOverSubstate', 'characterName', 'carryfull-death');
      setProperty('defaultCamZoom', 0.65);
      setProperty('vhsoverlay.alpha', 0);
      setProperty('VCR.alpha', 0);
      xx = 340;
      xx2 = 750;
      yy2 = 540;
      setCharacterX('dad', -100);
      setCharacterY('dad', 200);
      setCharacterX('bf', 962);
      setCharacterY('bf', -150);
end
end

-- change stage Sequence in Fallout-Guerrilla
function onBeatHit()
if curBeat == 192 then

      setProperty('Speaker.visible', false);
      setProperty('bloodFoggy.visible', false);	
      setProperty('fog.visible', false);	
      setProperty('table.visible', false);
      setProperty('mota.visible', false);

      setProperty('sky2.visible', true);	
      setProperty('backtrees2.visible', true);
      setProperty('ground2.visible', true);	
      setProperty('buddies.visible', true);
end

if curBeat == 258 then

      setProperty('Speaker.visible', true);
      setProperty('bloodFoggy.visible', true);	
      setProperty('fog.visible', true);	
      setProperty('table.visible', true);
      setProperty('mota.visible', true);

      setProperty('sky2.visible', false);	
      setProperty('backtrees2.visible', false);
      setProperty('ground2.visible', false);	
      setProperty('buddies.visible', false);	
end
end	
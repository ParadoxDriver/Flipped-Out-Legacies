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
        setPropertyFromClass('GameOverSubstate', 'characterName', 'you are dead');
        setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'error_glitch_sfx');
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'error_glitch_loop');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'error_glitch_end');

	makeLuaSprite('sky', 'Flippy/Death/Sky', -600, -225);
	setScrollFactor('sky', 0.5, 0.5);
        addLuaSprite('sky', false);

	makeLuaSprite('backTrees', 'Flippy/Death/BackTrees', -625, -200);
	setScrollFactor('backTrees', 0.7, 0.7);
        addLuaSprite('backTrees', false);

	makeLuaSprite('trees', 'Flippy/Death/Trees', -625, -225);
	setScrollFactor('trees', 1.0, 1.0);
        addLuaSprite('trees', false);
	
	makeLuaSprite('ground', 'Flippy/Death/Ground', -700, -150);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false);

if not lowQuality then
	makeLuaSprite('table', 'Flippy/Death/Table', -850, -200);
        setProperty('table.scale.x', 1.1);
	setProperty('table.scale.y', 1.2);
	setScrollFactor('table', 1.3, 1.3);
        addLuaSprite('table', true);

        makeLuaSprite('herbs', 'Flippy/Death/ForeGround', -790, -100);
	setScrollFactor('herbs', 1.0, 1.0);
        addLuaSprite('herbs', false);
end
        makeAnimatedLuaSprite('rain', 'Flippy/Suicide/rain', -200, -200);
        addAnimationByPrefix('rain', 'loop', 'rain loop', 15, true);
        setLuaSpriteScrollFactor('rain', 1.0, 1.0);
        setProperty('rain.scale.x', 2.0);
	setProperty('rain.scale.y', 2.0);
        setProperty('rain.alpha', 0.4);
        addLuaSprite('rain', true);
        
if hideHud == false then
        makeLuaSprite('deathHB', 'HealthBar-Skins/healthBar_Insane', 0, 0);
	setObjectCamera('deathHB', 'hud');
	setScrollFactor('deathHB', 0.9, 0.9);
	addLuaSprite('deathHB', true);
end 
        makeLuaSprite('BlackBords', 'cooloutline', 0, 0);
        setObjectCamera('BlackBords', 'other');
        setProperty('BlackBords.alpha', 0.85);
	addLuaSprite('BlackBords', true);

        makeAnimatedLuaSprite('overstat', 'Effects/Overstat', 0, 0);
        addAnimationByPrefix('overstat', 'overstat', 'overstat', 25, true);
        setObjectCamera('overstat', 'other');
        addLuaSprite('overstat', false);
        setProperty('overstat.alpha', 0.2);
        setBlendMode('overstat', 'SHADER');
        setProperty('overstat.scale.x', 8.0);
	setProperty('overstat.scale.y', 4,0); 

        makeLuaSprite('VCR', 'Effects/VCR', 320, 180);
        setProperty('VCR.scale.x', 2.04);
	setProperty('VCR.scale.y', 2.12);  
        setObjectCamera('VCR', 'other');
        addLuaSprite('VCR', true);   

        setProperty('introSoundsSuffix', '-VCR')            
end

function onCountdownTick(swagCounter)
if swagCounter == 1 then
	setProperty('countdownReady.visible', false)
	makeLuaSprite('ready', 'Countdowns/PMYFB/ready', screenWidth / 2 - 369, screenHeight / 2 - 185);
	setObjectCamera('ready','other');
	doTweenAlpha('elpepe', 'ready', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('ready', true);
end	
if swagCounter == 2 then
	setProperty('countdownSet.visible', false)
	makeLuaSprite('set', 'Countdowns/PMYFB/set', screenWidth / 2 - 330, screenHeight / 2 - 185);
	setObjectCamera('set','other');
	doTweenAlpha('elpepe', 'set', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('set', true);
end	
if swagCounter == 3 then
	setProperty('countdownGo.visible', false)
	makeLuaSprite('GO', 'Countdowns/PMYFB/go', screenWidth / 2 - 289, screenHeight / 2 - 215);
	setObjectCamera('GO','other');
	doTweenAlpha('elpepe', 'GO', 0, crochet / 1000, 'cubeInOut');
	addLuaSprite('GO', true);
    end
end

function onCreatePost()
        setProperty('deathHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('deathHB.x', getProperty('healthBar.x') - 12);

        setProperty('deathHB.angle', getProperty('healthBar.angle'));
        setProperty('deathHB.y', getProperty('healthBar.y') - 18);
        setProperty('deathHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('deathHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('deathHB', 5);
        setObjectOrder('healthBar', 3);
	setObjectOrder('healthBarBG', 2); 

        setTextFont('botplayTxt', "Insanity.ttf");
        setTextFont('scoreTxt', "Insanity.ttf");
        setTextFont('timeTxt', "Insanity.ttf");
        setTextFont('songWM', "Insanity.ttf");
        setTextFont('healthText', "Insanity.ttf");

        setTextFont('ComboText', "Insanity.ttf");
        setTextFont('SicksText', "Insanity.ttf");
        setTextFont('GoodsText', "Insanity.ttf");
        setTextFont('BadsText', "Insanity.ttf");
        setTextFont('ShitsText', "Insanity.ttf");
        setTextFont('MissText', "Insanity.ttf"); 

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

        setProperty('scoreTxt.y', 679);
        setProperty('healthText.x', 480);
end 
if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

        setProperty('scoreTxt.y', 117); 
        setProperty('healthText.x', 480);
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
if n == 'Sexy Zoom' then 
	CameraPos = tonumber(v1)
if CameraPos == 1 then
	xx2 = 1000
	yy2 = 370
elseif CameraPos == 0 then
	xx2 = 750
	yy2 = 560
      end
   end
end

function onCountdownStarted()
	for i = 0, getProperty('opponentStrums.length') -1 do
		if getPropertyFromGroup('opponentStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NoteSkins/INSANE_NOTE_assets');
		end
	end

	for i = 0, getProperty('playerStrums.length') -1 do
		if getPropertyFromGroup('playerStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('playerStrums', i, 'texture', 'NoteSkins/INSANE_NOTE_assets');
		end
	end

	for i = 0, getProperty('unspawnNotes.length') -1 do
		if getPropertyFromGroup('unspawnNotes', i, 'texture') == '' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/INSANE_NOTE_assets');
		end

		setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteSplashes');
	end
end
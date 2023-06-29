local xx = 200;
local yy = 950;
local xx2 = 570;
local yy2 = 990;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
local ooSpooky = true

function onStartSong()	
        setPropertyFromClass('flixel.FlxG','sound.music.volume',1)
end

function onCreate()
        -- background shit
        setPropertyFromClass('flixel.FlxG','sound.music.volume',0)
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-bf');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd-bf');
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-efn-gameover');

        makeLuaSprite('sky', 'Flippy/Scary/sky', -1080, -220);
	setScrollFactor('sky', 1.0, 1.0);
        addLuaSprite('sky', false);

        makeLuaSprite('backlol', 'Flippy/Scary/tunnelback', -1080, -100);
	setScrollFactor('backlol', 1.0, 1.0);
        addLuaSprite('backlol', false);

        makeLuaSprite('ground', 'Flippy/Scary/tunnelfloor', -1080, -150);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false);

if not lowQuality then
        makeAnimatedLuaSprite('grain', 'Flippy/Scary/grain');
	addAnimationByPrefix('grain', 'idle', 'grain', 12, true);
	setGraphicSize('grain', screenWidth + 29, screenHeight + 29);
	screenCenter('grain');
	setObjectCamera('grain', 'other');
	setProperty('grain.x', getProperty('grain.x') + 15);
	setProperty('grain.y', getProperty('grain.y') + 25);
	setProperty('grain.antialiasing', true);
	addLuaSprite('grain', false);
end
        makeLuaSprite('fog', 'Flippy/Scary/fog', -660, 400);
        screenCenter('fog');
	setObjectCamera('fog', 'other');
        setProperty('fog.alpha', 0.85);
        addLuaSprite('fog', true);

        makeAnimatedLuaSprite('rain', 'Flippy/Scary/rain', -1294, -998);
        addAnimationByPrefix('rain', 'loop', 'rain', 20, true); 
	setLuaSpriteScrollFactor('rain', 0.9, 0.9);
	scaleObject('rain', 3.00, 3.00);
        addLuaSprite('rain', true);

if hideHud == false then
        makeLuaSprite('hankHB', 'HealthBar-Skins/healthBar_Lockjaw', -50, -200);
	setObjectCamera('hankHB', 'hud');
	setScrollFactor('hankHB', 0.9, 0.9);
	addLuaSprite('hankHB', true);
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

        makeLuaSprite('blackfuck', '', 0, 0);
        makeGraphic('blackfuck',1280,720,'000000');
	setObjectCamera('blackfuck', 'other');
	setGraphicSize('blackfuck', screenWidth, screenHeight);
	setProperty('blackfuck.alpha', 1);
        addLuaSprite('blackfuck', true);
end

function onCreatePost()
        setProperty('hankHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('hankHB.x', getProperty('healthBar.x') - 30);

        setProperty('hankHB.angle', getProperty('healthBar.angle'));
        setProperty('hankHB.y', getProperty('healthBar.y') - 23);
        setProperty('hankHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('hankHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('hankHB', 5);
        setObjectOrder('healthBar', 3);
	setObjectOrder('healthBarBG', 2);

        setObjectOrder('timeBarBG', 3);
	setObjectOrder('timeBar', 6);
        setObjectOrder('timeCool', 7);

        setTextFont('botplayTxt', "Impact.ttf");
        setTextFont('scoreTxt', "Impact.ttf");
        setTextFont('timeTxt', "Impact.ttf");
        setTextFont('songWM', "Impact.ttf");
        setTextFont('healthText', "Impact.ttf");

        setTextFont('ComboText', "Impact.ttf");
        setTextFont('SicksText', "Impact.ttf");
        setTextFont('GoodsText', "Impact.ttf");
        setTextFont('BadsText', "Impact.ttf");
        setTextFont('ShitsText', "Impact.ttf");
        setTextFont('MissText', "Impact.ttf"); 

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
    if ooSpooky == true then
		triggerEvent('Camera Follow Pos',610,890)
	end
end

function onUpdatePost()
--Change Text ONLY IN LOCKJAW
        setTextString('SicksText', 'Mad:' .. getProperty('sicks'))
        setTextString('GoodsText', 'Nice:' .. getProperty('goods'))
        setTextString('BadsText', 'Sad:' .. getProperty('bads'))
        setTextString('ShitsText', 'Fucked:' .. getProperty('shits'))
        setTextString('MissText', 'Miss:' .. getProperty('songMisses'))

--Change Size Text ONLY IN LOCKJAW
        setTextSize('ComboText', 21);
        setTextSize('SicksText', 21);
        setTextSize('GoodsText', 21);
        setTextSize('BadsText', 21);
        setTextSize('ShitsText', 21);
        setTextSize('MissText', 21);

--Change Setings ONLY IN LOCKJAW
        setProperty('ComboText.y', 315);
        setProperty('SicksText.y', 340); 
        setProperty('GoodsText.y', 365); 
        setProperty('BadsText.y', 390);
        setProperty('ShitsText.y', 415);
        setProperty('MissText.y', 440);

        setProperty('ComboText.x', 30);
        setProperty('SicksText.x', 30); 
        setProperty('GoodsText.x', 30); 
        setProperty('BadsText.x', 30);
        setProperty('ShitsText.x', 30);
        setProperty('MissText.x', 30);

if getPropertyFromClass('ClientPrefs', 'downScroll') == false then

        setProperty('timeCool.y', 16);
        setProperty('timeTxt.y', 9); 
        setProperty('timeTxt.x', 430); 
        setProperty('scoreTxt.y', 670);
end 
if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
       
        setProperty('timeCool.y', 674);
        setProperty('timeTxt.y', 665); 
        setProperty('timeTxt.x', 431); 
        setProperty('scoreTxt.y', 109);
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

function onEvent(n,v1,v2)
	if n == 'Trigger BG Ghouls' then --remove da blackshit
		alpha = tonumber(v1)
		speed = tonumber(v2)
		doTweenAlpha('bruh','blackfuck',alpha,speed,'linear')
	end
	if n == 'BG Freaks Expression' then --zoom in??
		stupid = tonumber(v1)
		if stupid == 0 then
			ooSpooky = false
			followchars = true
		elseif stupid == 1 then
			ooSpooky = true
			followchars = false
		end
	end
	if n == 'Kill Henchmen' then --zoom early?
		nyoom = tonumber(v1)
		if nyoom == 1 then
			xx = 500
			yy = 950
		elseif nyoom == 0 then
			xx = 200
			yy = 950
		end
	end
end

function onCountdownStarted()
	for i = 0, getProperty('opponentStrums.length') -1 do
		if getPropertyFromGroup('opponentStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NoteSkins/Madness_Notes');
		end
	end

	for i = 0, getProperty('playerStrums.length') -1 do
		if getPropertyFromGroup('playerStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('playerStrums', i, 'texture', 'NoteSkins/Madness_Notes');
		end
	end

	for i = 0, getProperty('unspawnNotes.length') -1 do
		if getPropertyFromGroup('unspawnNotes', i, 'texture') == '' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/Madness_Notes');
		end

		setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'SplashesSkins/MadnessSplashes');
	end
end

function opponentNoteHit() --lawd he angry now
triggerEvent('Screen Shake','0.02,0.006')

 health = getProperty('health')
    if getProperty('health') > 0.3 then
        setProperty('health', health- 0.018);
    end
end
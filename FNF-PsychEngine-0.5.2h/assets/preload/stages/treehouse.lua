local xx = 640;
local yy = 700;
local xx2 = 1072;
local yy2 = 700;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
        setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx_trollge');
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-trollge');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd-trollge'); 
        setPropertyFromClass('GameOverSubstate', 'characterName', 'death-minus');

	makeLuaSprite('sky', 'Flippy/Disturbed/sky', -1010, -450);
	setScrollFactor('sky', 0.5, 0.5);
        addLuaSprite('sky', false);

	makeLuaSprite('trees', 'Flippy/Disturbed/trees', -1010, -450);
	setScrollFactor('trees', 0.8, 0.8);
        addLuaSprite('trees', false);

	makeLuaSprite('ground', 'Flippy/Disturbed/ground', -1200, -400);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false);

        makeAnimatedLuaSprite('smol', 'Flippy/Disturbed/lilboi', 2150, 815);
	luaSpriteAddAnimationByIndices('smol', 'danceRight', 'flip', '30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14');
	luaSpriteAddAnimationByIndices('smol', 'danceLeft', 'flip', '15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29');
	setScrollFactor('smol', 1.0, 1.0);
        setProperty('smol.scale.x', 2.5);
	setProperty('smol.scale.y', 2.5);
        addLuaSprite('smol', false);

        makeAnimatedLuaSprite('rain', 'Flippy/Hunter/rain', -1200, -400);
        luaSpriteAddAnimationByPrefix('rain', 'rainanim', 'rainanim', 24, true);
        setProperty('rain.alpha', 0.85);
        setProperty('rain.scale.x', 3.7);
	setProperty('rain.scale.y', 3.7);
        addLuaSprite('rain', true);

if hideHud == false then
        makeLuaSprite('bloodedHB', 'HealthBar-Skins/healthBar_Hunter', -50, -200);
	setObjectCamera('bloodedHB', 'hud');
	setScrollFactor('bloodedHB', 0.9, 0.9);
	addLuaSprite('bloodedHB', true); 
end
        makeLuaSprite('shadow', 'vinetca', -640, -300);
        setObjectCamera('shadow', 'other'); 
        setProperty('shadow.scale.x', 0.5);
	setProperty('shadow.scale.y', 0.6);
        addLuaSprite('shadow', false);

        makeLuaSprite('Start', '', 0, 0);
	makeGraphic('Start',1280,720,'000000');
	setObjectCamera('Start', 'other');
        setProperty('Start.alpha', 1);
	addLuaSprite('Start', true);
end

function onCreatePost()
        setProperty('bloodedHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('bloodedHB.x', getProperty('healthBar.x') - 50);

        setProperty('bloodedHB.angle', getProperty('healthBar.angle'));
        setProperty('bloodedHB.y', getProperty('healthBar.y') - 24);
        setProperty('bloodedHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('bloodedHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('bloodedHB', 5);
        setObjectOrder('healthBar', 4);
	setObjectOrder('healthBarBG', 2);
        
        setTextFont('botplayTxt', "Slasher.ttf");
        setTextFont('scoreTxt', "Slasher.ttf");
        setTextFont('timeTxt', "Slasher.ttf");
        setTextFont('songWM', "Slasher.ttf");
        setTextFont('healthText', "Slasher.ttf");
        setTextFont('songText', "Slasher.ttf");

        setTextFont('ComboText', "Slasher.ttf");
        setTextFont('SicksText', "Slasher.ttf");
        setTextFont('GoodsText', "Slasher.ttf");
        setTextFont('BadsText', "Slasher.ttf");
        setTextFont('ShitsText', "Slasher.ttf");
        setTextFont('MissText', "Slasher.ttf");

        setProperty('timeBar.color', getColorFromHex('E80A0A'))
        setProperty('timeTxt.color', getColorFromHex('E80A0A'))
        setProperty('scoreTxt.color', getColorFromHex('E80A0A'))
        setProperty('botplayTxt.color', getColorFromHex('E80A0A'))
        setProperty('healthText.color', getColorFromHex('E80A0A'))
        setProperty('songWM.color', getColorFromHex('E80A0A')) 
        setProperty('songText.color', getColorFromHex('E80A0A')) 

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
        setProperty('timeTxt.y', 22);
end 
if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

        setProperty('scoreTxt.y', 117); 
        setProperty('timeTxt.y', 679);
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
            setProperty('defaultCamZoom',0.4)
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
            setProperty('defaultCamZoom',0.6)
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

function onBeatHit()
   if curBeat % 2 == 0 then

	     objectPlayAnimation('smol', 'danceRight', true)
	else

	     objectPlayAnimation('smol', 'danceLeft', true)
	end
end

function onSongStart()
    doTweenAlpha('graphicAlpha', 'Start', 0, 2, 'linear');
end

function opponentNoteHit(id,data,type,sus)
triggerEvent('Screen Shake','0.04,0.009')

health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end
end
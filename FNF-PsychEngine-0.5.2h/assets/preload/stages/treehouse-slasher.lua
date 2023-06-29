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

	makeLuaSprite('sky', 'Flippy/Slasher/sky', -1010, -450);
	setScrollFactor('sky', 0.5, 0.5);
        addLuaSprite('sky', false);

	makeLuaSprite('trees', 'Flippy/Slasher/trees', -1010, -450);
	setScrollFactor('trees', 0.8, 0.8);
        addLuaSprite('trees', false);

	makeLuaSprite('ground', 'Flippy/Slasher/ground', -1200, -400);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false);

	makeAnimatedLuaSprite('smol', 'Flippy/Slasher/lilboi', 2150, 815);
	luaSpriteAddAnimationByIndices('smol', 'danceRight', 'flip', '30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14');
	luaSpriteAddAnimationByIndices('smol', 'danceLeft', 'flip', '15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29');
	setScrollFactor('smol', 1.0, 1.0);
        setProperty('smol.scale.x', 2.5);
	setProperty('smol.scale.y', 2.5);
        addLuaSprite('smol', false);

	makeAnimatedLuaSprite('flippy', 'characters/Minusus', -490, 800);
	luaSpriteAddAnimationByIndices('flippy', 'danceRight', 'MinusFlip_Idle', '30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14');
	luaSpriteAddAnimationByIndices('flippy', 'danceLeft', 'MinusFlip_Idle', '15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29');
	setScrollFactor('flippy', 1.0, 1.0);
        setProperty('flippy.scale.x', 2.8);
	setProperty('flippy.scale.y', 2.8);
        addLuaSprite('shadow', false);

        makeLuaSprite('shadow', 'vinetca', -640, -300);
        setObjectCamera('shadow', 'hud'); 
        setProperty('shadow.scale.x', 0.5);
	setProperty('shadow.scale.y', 0.6);
        addLuaSprite('shadow', false);

        setProperty('flippy.visible', false);
        setProperty('shadow.visible', false);
        setObjectOrder('shadow', 1);

if hideHud == false then
        makeLuaSprite('slashHB', 'HealthBar-Skins/healthBar_Slasher', -50, -200);
	setObjectCamera('slashHB', 'hud');
	setScrollFactor('slashHB', 0.9, 0.9);
	addLuaSprite('slashHB', true); 
end

if songName == 'Playdate' then
        addCharacterToList('Junior', 'dad')
	addCharacterToList('bf-minus-flipped', 'boyfriend')

        setProperty('shadow.visible', true);
end
end

function onCreatePost()
        setProperty('slashHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('slashHB.x', getProperty('healthBar.x') - 50);

        setProperty('slashHB.angle', getProperty('healthBar.angle'));
        setProperty('slashHB.y', getProperty('healthBar.y') - 24);
        setProperty('slashHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('slashHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('slashHB', 7);--WTF!
        setObjectOrder('healthBar', 4);
        setObjectOrder('healthBarBG', 2);

        setTextFont('botplayTxt', "Slasher.ttf");
        setTextFont('scoreTxt', "Slasher.ttf");
        setTextFont('timeTxt', "Slasher.ttf");
        setTextFont('songWM', "Slasher.ttf");
        setTextFont('healthText', "Slasher.ttf");

        setTextFont('ComboText', "Slasher.ttf");
        setTextFont('SicksText', "Slasher.ttf");
        setTextFont('GoodsText', "Slasher.ttf");
        setTextFont('BadsText', "Slasher.ttf");
        setTextFont('ShitsText', "Slasher.ttf");
        setTextFont('MissText', "Slasher.ttf");

        setProperty('timeBar.color', getColorFromHex('EB5606'))
        setProperty('timeTxt.color', getColorFromHex('EB5606'))
        setProperty('scoreTxt.color', getColorFromHex('EB5606'))
        setProperty('botplayTxt.color', getColorFromHex('EB5606'))
        setProperty('healthText.color', getColorFromHex('EB5606'))
        setProperty('songWM.color', getColorFromHex('EB5606'))

        setProperty('underlay.color', getColorFromHex('EB5606'))
        setProperty('ComboText.color', getColorFromHex('EB5606'))  
        setProperty('SicksText.color', getColorFromHex('EB5606'))
        setProperty('GoodsText.color', getColorFromHex('EB5606'))
        setProperty('BadsText.color', getColorFromHex('EB5606'))
        setProperty('ShitsText.color', getColorFromHex('EB5606'))
        setProperty('MissText.color', getColorFromHex('EB5606'))      
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
function onBeatHit()
if curBeat % 2 == 0 then

            objectPlayAnimation('smol', 'danceRight', true)
	else
            objectPlayAnimation('smol', 'danceLeft', true)
	end

if curBeat % 3 == 0 then

	    objectPlayAnimation('flippy', 'danceRight', true)
        else
	    objectPlayAnimation('flippy', 'danceLeft', true)
     end
end

function onStepHit()
if songName == 'Playdate' then
if curStep == 256 then
     setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
     setPropertyFromClass('GameOverSubstate', 'characterName', 'bf');

     setProperty('defaultCamZoom',0.75);
     setProperty('smol.visible', false);
     setProperty('flippy.visible', true);
     setProperty('dad.scale.x', 0.90);
     setProperty('dad.scale.y', 0.90);

     triggerEvent('Add Camera Zoom', '3', '2');
     triggerEvent('Change Character', 'dad', 'Junior');

     setCharacterX('dad', 1950);
     setCharacterY('dad', 430);

     xx = 1730;
     xx2 = 1570;
end
if curStep == 257 then
     setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0);
     setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1);
     setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2);
     setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3);
     setPropertyFromGroup('playerStrums', 4, 'x', defaultOpponentStrumX4);

     setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 + 0);
     setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 + 0);
     setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 + 0);
     setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 + 0);
     setPropertyFromGroup('opponentStrums', 4, 'x', defaultPlayerStrumX4 + 0);
end
if curStep == 274 then
     setProperty('boyfriend.flipX', true);
end
if curStep == 276 then
     triggerEvent('Change Character', 'bf', 'bf-minus-flipped');
end
if curStep == 2316 then
     setProperty('camGame.visible', false);
     setProperty('camHUD.visible', false);
end
end
end
local xx = 1010;
local yy = 840;
local xx2 = 1070;
local yy2 = 830;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
	makeLuaSprite('SunkBG', 'Flippy/Borealis/SinkStage', -345, 100);
	setLuaSpriteScrollFactor('SunkBG', 1, 1);
        addLuaSprite('SunkBG', false);

        makeLuaSprite('Front', 'Flippy/Borealis/SinkCeiling', 5, 200);
	setLuaSpriteScrollFactor('Front', 1, 1);
        scaleObject('Front',1.3, 1.1);
        addLuaSprite('Front', true);

if hideHud == false then
        makeLuaSprite('sinkHB', 'HealthBar-Skins/healthBarSink', -50, -200);
	setObjectCamera('sinkHB', 'hud');
	setScrollFactor('sinkHB', 0.9, 0.9);
	addLuaSprite('sinkHB', true);
end
        makeLuaSprite('timeCool', 'TimeBar-Skins/timeBar-Sink', 396, 16);
	setScrollFactor('timeCool', 0.9, 0.9);
        setProperty('timeCool.alpha', 0);
        setObjectCamera('timeCool', 'hud');
        setProperty('timeCool.scale.x', getProperty('timeCool.scale.x') + 0.02);
	setProperty('timeCool.scale.y', getProperty('timeCool.scale.y') - 0.01);
        addLuaSprite('timeCool', true);

        makeLuaSprite('BlackBords', 'cooloutline', 0, 0);
        setObjectCamera('BlackBords', 'other');
	addLuaSprite('BlackBords', true);

        makeAnimatedLuaSprite('waves', 'Flippy/Borealis/waves', 0, 0);
	addAnimationByPrefix('waves', 'idle', 'idle', 13, true);
	setObjectCamera('waves', 'camHud');
	setProperty('waves.alpha', 0.08);
	scaleObject('waves', 1280/512, 820/512);
        addLuaSprite('waves', true);
	setBlendMode('waves', 'screen');
        addLuaSprite('waves', true);

        makeAnimatedLuaSprite('linesCam', 'Effects/animatedScanlines', 0, 0);
	luaSpriteAddAnimationByPrefix('linesCam', 'linesMove', 'linesMove instance', 17, true);
        setProperty('linesCam.alpha', 0.85);
	setObjectCamera('linesCam', 'other');
        addLuaSprite('linesCam', false);

        makeLuaSprite('VCR', 'Effects/VCR', 320, 180);
        setProperty('VCR.scale.x', 2.04);
	setProperty('VCR.scale.y', 2.12);  
        setObjectCamera('VCR', 'other');
        addLuaSprite('VCR', true);     
end

function onCreatePost()
        setProperty('sinkHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('sinkHB.x', getProperty('healthBar.x') - 30);

        setProperty('sinkHB.angle', getProperty('healthBar.angle'));
        setProperty('sinkHB.y', getProperty('healthBar.y') - 23);
        setProperty('sinkHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('sinkHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('sinkHB', 5);
        setObjectOrder('healthBar', 3);
	setObjectOrder('healthBarBG', 2);

        setObjectOrder('timeBarBG', 3);
	setObjectOrder('timeBar', 6);
        setObjectOrder('timeCool', 7);

        setTextFont('botplayTxt', "sonic4.ttf");
        setTextFont('scoreTxt', "sonic4.ttf");
        setTextFont('timeTxt', "sonic4.ttf");
        setTextFont('songWM', "sonic4.ttf");
        setTextFont('healthText', "sonic4.ttf");

        setTextFont('ComboText', "sonic4.ttf");
        setTextFont('SicksText', "sonic4.ttf");
        setTextFont('GoodsText', "sonic4.ttf");
        setTextFont('BadsText', "sonic4.ttf");
        setTextFont('ShitsText', "sonic4.ttf");
        setTextFont('MissText', "sonic4.ttf");

        setProperty('timeBar.color', getColorFromHex('308A68'))
        setProperty('timeTxt.color', getColorFromHex('308A68'))
        setProperty('scoreTxt.color', getColorFromHex('308A68'))
        setProperty('botplayTxt.color', getColorFromHex('308A68'))
        setProperty('healthText.color', getColorFromHex('308A68'))
        setProperty('songWM.color', getColorFromHex('308A68'))

        setProperty('underlay.color', getColorFromHex('308A68'))
        setProperty('ComboText.color', getColorFromHex('308A68'))  
        setProperty('SicksText.color', getColorFromHex('308A68'))
        setProperty('GoodsText.color', getColorFromHex('308A68'))
        setProperty('BadsText.color', getColorFromHex('308A68'))
        setProperty('ShitsText.color', getColorFromHex('308A68'))
        setProperty('MissText.color', getColorFromHex('308A68'))       
end

function onUpdatePost()
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then

        setProperty('timeCool.y', 16);
        setProperty('scoreTxt.y', 673);
        --setProperty('healthText.x', 480);
        setProperty('timeTxt.y', 13);
end

if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

        setProperty('timeCool.y', 674);
        setProperty('scoreTxt.y', 110);
        setProperty('healthText.x', 480);
        setProperty('timeTxt.y', 670);
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
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NoteSkins/DirtNOTE_assets');
		end
	end

	for i = 0, getProperty('playerStrums.length') -1 do
		if getPropertyFromGroup('playerStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('playerStrums', i, 'texture', 'NoteSkins/DirtNOTE_assets');
		end
	end

	for i = 0, getProperty('unspawnNotes.length') -1 do
		if getPropertyFromGroup('unspawnNotes', i, 'texture') == '' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/DirtNOTE_assets');
		end

		setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'SplashesSkins/DirtSplashes');
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

function onStartCountdown()
       setProperty('gfGroup.visible', false);
       setProperty('camGame.alpha', 0);
end

function onStepHit()
if curStep == 1 then
        doTweenAlpha('helloCamera', 'camGame', 1, 80, 'linear');
end
if curStep == 53 then
        doTweenAlpha('helloCamera', 'camGame', 1, 30, 'linear');
end
if curStep == 73 then
        doTweenAlpha('helloCamera', 'camGame', 1, 10, 'linear');
end
if curStep == 520 then
        doTweenAlpha('goodbyeCamera', 'camGame', 0, 0.4, 'linear');
end

if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
if curStep == 528 then
        doTweenAlpha('helloCamera', 'camGame', 1, 0.03, 'linear');
        setProperty('gfGroup.visible', true);

        noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 + 120, 0.25, 'expoOut')
        noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 + 110, 0.25, 'expoOut')
        noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 + 100, 0.25, 'expoOut')
        noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 + 90, 0.25, 'expoOut')
        noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 - 90, 0.25, 'expoOut')
        noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 - 100, 0.25, 'expoOut')
        noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 - 110, 0.25, 'expoOut')
        noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 - 120, 0.25, 'expoOut')
        triggerEvent('3rdstrum',true,'')
end

if curStep == 1440 then
        triggerEvent('3rdstrum',true,'')
        noteTweenAlpha('noteDAD0', 0, 1, 0.2, 'linear');
        noteTweenAlpha('noteDAD1', 1, 1, 0.2, 'linear');
        noteTweenAlpha('noteDAD2', 2, 1, 0.2, 'linear');
        noteTweenAlpha('noteDAD3', 3, 1, 0.2, 'linear');

        doTweenAlpha('timeTxt.Alpha', 'timeTxt', 1, 0.2, 'linear');
        doTweenAlpha('timeCool.Alpha', 'timeCool', 1, 0.2, 'linear');
        doTweenAlpha('timeBar.Alpha', 'timeBar', 1, 0.2, 'linear');
        doTweenAlpha('timeBarBG.Alpha', 'timeBarBG', 1, 0.2, 'linear');

        doTweenAlpha('songWM.Alpha', 'songWM', 1, 0.2, 'linear');
        doTweenAlpha('healthText.Alpha', 'healthText', 1, 0.2, 'linear');
        doTweenAlpha('iconP1', 'iconP1', 1, 0.2, 'linear');
        doTweenAlpha('iconP2', 'iconP2', 1, 0.2, 'linear');
        doTweenAlpha('healthBarBG', 'healthBarBG', 1, 0.2, 'linear');
        doTweenAlpha('healthBar', 'healthBar', 1, 0.2, 'linear');
        doTweenAlpha('sinkHB', 'sinkHB', 1, 0.2, 'linear');
        doTweenAlpha('healthBarWithAnim.Alpha', 'healthBarWithAnim', 1, 0.2, 'linear');
        doTweenAlpha('scoreTxt', 'scoreTxt', 1, 0.2, 'linear');
        doTweenAlpha('funnicube', 'funnicube', 0.6, 0.2, 'linear');
        doTweenAlpha('engineText', 'engineText', 1, 0.2, 'linear');

        doTweenAlpha('ratings', 'ratings', 1, 0.2, 'linear');
        doTweenAlpha('underlay', 'underlay', 0.6, 0.2, 'linear');
        doTweenAlpha('ComboText', 'ComboText', 1, 0.2, 'linear');
        doTweenAlpha('SicksText',  'SicksText', 1, 0.2, 'linear');
        doTweenAlpha('GoodsText', 'GoodsText', 1, 0.2, 'linear');
        doTweenAlpha('BadsText', 'BadsText', 1, 0.2, 'linear');
        doTweenAlpha('ShitsText', 'ShitsText', 1, 0.2, 'linear');
        doTweenAlpha('MissText',  'MissText', 1, 0.2, 'linear');
end
end

if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
if curStep == 528 then

        doTweenAlpha('helloCamera', 'camGame', 1, 0.03, 'linear');
        setProperty('gfGroup.visible', true);
        triggerEvent('3rdstrum',true,'')
end

if curStep == 1440 then
        doTweenAlpha('timeTxt.Alpha', 'timeTxt', 1, 0.2, 'linear');
        doTweenAlpha('timeCool.Alpha', 'timeCool', 1, 0.2, 'linear');
        doTweenAlpha('timeBar.Alpha', 'timeBar', 1, 0.2, 'linear');
        doTweenAlpha('timeBarBG.Alpha', 'timeBarBG', 1, 0.2, 'linear');

        doTweenAlpha('songWM.Alpha', 'songWM', 1, 0.2, 'linear');
        doTweenAlpha('healthText.Alpha', 'healthText', 1, 0.2, 'linear');
        doTweenAlpha('iconP1', 'iconP1', 1, 0.2, 'linear');
        doTweenAlpha('iconP2', 'iconP2', 1, 0.2, 'linear');
        doTweenAlpha('healthBarBG', 'healthBarBG', 1, 0.2, 'linear');
        doTweenAlpha('healthBar', 'healthBar', 1, 0.2, 'linear');
        doTweenAlpha('sinkHB', 'sinkHB', 1, 0.2, 'linear');
        doTweenAlpha('healthBarWithAnim.Alpha', 'healthBarWithAnim', 1, 0.2, 'linear');
        doTweenAlpha('scoreTxt', 'scoreTxt', 1, 0.2, 'linear');
        doTweenAlpha('funnicube', 'funnicube', 0.6, 0.2, 'linear');
        doTweenAlpha('engineText', 'engineText', 1, 0.2, 'linear');

        doTweenAlpha('ratings', 'ratings', 1, 0.2, 'linear');
        doTweenAlpha('underlay', 'underlay', 0.6, 0.2, 'linear');
        doTweenAlpha('ComboText', 'ComboText', 1, 0.2, 'linear');
        doTweenAlpha('SicksText',  'SicksText', 1, 0.2, 'linear');
        doTweenAlpha('GoodsText', 'GoodsText', 1, 0.2, 'linear');
        doTweenAlpha('BadsText', 'BadsText', 1, 0.2, 'linear');
        doTweenAlpha('ShitsText', 'ShitsText', 1, 0.2, 'linear');
        doTweenAlpha('MissText',  'MissText', 1, 0.2, 'linear');
end
end

if curStep == 1312 then
        xx = 880;
        yy = 860;
end

if curStep == 1183 then
        noteTweenAlpha('noteDAD0', 0, 0, 0.2, 'linear');
        noteTweenAlpha('noteDAD1', 1, 0, 0.2, 'linear');
        noteTweenAlpha('noteDAD2', 2, 0, 0.2, 'linear');
        noteTweenAlpha('noteDAD3', 3, 0, 0.2, 'linear');

        noteTweenAlpha('noteBF4', 4, 0, 0.2, 'linear');
        noteTweenAlpha('noteBF5', 5, 0, 0.2, 'linear');
        noteTweenAlpha('noteBF6', 6, 0, 0.2, 'linear');
        noteTweenAlpha('noteBF7', 7, 0, 0.2, 'linear');

        doTweenAlpha('timeTxt.Alpha', 'timeTxt', 0, 0.2, 'linear');
        doTweenAlpha('timeCool.Alpha', 'timeCool', 0, 0.2, 'linear');
        doTweenAlpha('timeBar.Alpha', 'timeBar', 0, 0.2, 'linear');
        doTweenAlpha('timeBarBG.Alpha', 'timeBarBG', 0, 0.2, 'linear');

        doTweenAlpha('songWM.Alpha', 'songWM', 0, 0.2, 'linear');
        doTweenAlpha('healthText.Alpha', 'healthText', 0, 0.2, 'linear');
        doTweenAlpha('iconP1', 'iconP1', 0, 0.2, 'linear');
        doTweenAlpha('iconP2', 'iconP2', 0, 0.2, 'linear');
        doTweenAlpha('healthBarBG', 'healthBarBG', 0, 0.2, 'linear');
        doTweenAlpha('healthBar', 'healthBar', 0, 0.2, 'linear');
        doTweenAlpha('sinkHB', 'sinkHB', 0, 0.2, 'linear');
        doTweenAlpha('healthBarWithAnim.Alpha', 'healthBarWithAnim', 0, 0.2, 'linear');
        doTweenAlpha('scoreTxt', 'scoreTxt', 0, 0.2, 'linear');
        doTweenAlpha('funnicube', 'funnicube', 0, 0.2, 'linear');
        doTweenAlpha('engineText', 'engineText', 0, 0.2, 'linear');

        doTweenAlpha('ratings', 'ratings', 0, 0.2, 'linear');
        doTweenAlpha('underlay', 'underlay', 0, 0.2, 'linear');
        doTweenAlpha('ComboText', 'ComboText', 0, 0.2, 'linear');
        doTweenAlpha('SicksText',  'SicksText', 0, 0.2, 'linear');
        doTweenAlpha('GoodsText', 'GoodsText', 0, 0.2, 'linear');
        doTweenAlpha('BadsText', 'BadsText', 0, 0.2, 'linear');
        doTweenAlpha('ShitsText', 'ShitsText', 0, 0.2, 'linear');
        doTweenAlpha('MissText',  'MissText', 0, 0.2, 'linear');
        triggerEvent('3rdstrum',false,'')
end

if curStep == 1307 then
        noteTweenAlpha('noteDAD0', 0, 0.5, 0.9, 'linear');
        noteTweenAlpha('noteDAD1', 1, 0.5, 0.9, 'linear');
        noteTweenAlpha('noteDAD2', 2, 0.5, 0.9, 'linear');
        noteTweenAlpha('noteDAD3', 3, 0.5, 0.9, 'linear');
end

if curStep == 1428 then
        noteTweenAlpha('noteBF4', 4, 1, 1.5, 'linear');
        noteTweenAlpha('noteBF5', 5, 1, 1.5, 'linear');
        noteTweenAlpha('noteBF6', 6, 1, 1.5, 'linear');
        noteTweenAlpha('noteBF7', 7, 1, 1.5, 'linear');
end

if curStep == 1439 then
        xx = 1010;
        yy = 840;
end

if curStep == 1615 then
        doTweenAlpha('goodbyeCamera', 'camGame', 0, 4.7, 'linear');
end 

if curStep >= 1679 and curStep < 1695 then
        triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008');
end

if curStep == 1696 then
        doTweenAlpha('helloCamera', 'camGame', 1, 0.1, 'linear');
end

if curStep == 2096 then
        setProperty('camGame.alpha', 0);
        setProperty('camHUD.alpha', 0);
end
end
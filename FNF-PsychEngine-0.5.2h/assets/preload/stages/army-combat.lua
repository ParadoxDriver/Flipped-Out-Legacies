local xx = 340;
local yy = 540;
local xx2 = 770;
local yy2 = 600;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
	makeLuaSprite('skyfront', 'Flippy/Army/Sky', -600, -225);
	setScrollFactor('skyfront', 1.0, 1.0);
        addLuaSprite('skyfront', false);

	makeLuaSprite('bwall', 'Flippy/Army/bwall', -625, -200);
	setScrollFactor('bwall', 0.9, 0.9);
        addLuaSprite('bwall', false);

	makeLuaSprite('scene', 'Flippy/Army/scene', -700, -150);
	setScrollFactor('scene', 1.0, 1.0);
        addLuaSprite('scene', false);

	makeLuaSprite('lights', 'Flippy/Army/lights', -850, -150);
	setScrollFactor('lights', 1.1, 1.1);
        addLuaSprite('lights', true); 

if hideHud == false then
        makeLuaSprite('bloodedHB', 'HealthBar-Skins/healthBar2', -50, -200);
	setObjectCamera('bloodedHB', 'hud');
	setScrollFactor('bloodedHB', 0.9, 0.9);
	addLuaSprite('bloodedHB', true);
end
        makeLuaSprite('shadow', 'vinetca', -640, -300);
        setObjectCamera('shadow', 'other'); 
        setProperty('shadow.scale.x', 0.5);
	setProperty('shadow.scale.y', 0.6);
        addLuaSprite('shadow', false);

        makeAnimatedLuaSprite('vhsoverlay', 'Effects/vhs', -100, -40);
	addAnimationByPrefix('vhsoverlay', 'vhs', 'vhs', 24, true);
	setObjectCamera('vhsoverlay', 'other');
	setGraphicSize('vhsoverlay', 1000, 730);
	setProperty('vhsoverlay.alpha', 0.5);
        setProperty('vhsoverlay.scale.x', 3.7);
	setProperty('vhsoverlay.scale.y', 3.7); 
        addLuaSprite('vhsoverlay', true);

        makeLuaSprite('VCR', 'Effects/VCR', 320, 180);
        setProperty('VCR.scale.x', 2.04);
	setProperty('VCR.scale.y', 2.12);  
        setObjectCamera('VCR', 'other');
        addLuaSprite('VCR', true);   
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        makeLuaSprite('sky', 'Flippy/Slaughter/Sky', -600, -225);
	setScrollFactor('sky', 0.5, 0.5);
        addLuaSprite('sky', false);

	makeLuaSprite('backTrees', 'Flippy/Slaughter/BackTrees', -625, -200);
	setScrollFactor('backTrees', 0.7, 0.7);
        addLuaSprite('backTrees', false);

	makeLuaSprite('trees', 'Flippy/Slaughter/Trees', -625, -225);
	setScrollFactor('trees', 0.8, 0.8);
        addLuaSprite('trees', false);
	
	makeLuaSprite('ground', 'Flippy/Slaughter/Ground', -700, -150);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false);
	
	makeAnimatedLuaSprite('boombox', 'Flippy/Speaker', 925, 515);
	luaSpriteAddAnimationByPrefix('boombox', 'bop', 'boombox', 16, true);
	setScrollFactor('boombox', 1.0, 1.0);
        addLuaSprite('boombox', false);

        makeAnimatedLuaSprite('Flaky', 'Flippy/Slaughter/Scared_Flaky', 1450, 570);
	luaSpriteAddAnimationByPrefix('Flaky', 'bop', 'Flaky', 16, true);
	setScrollFactor('Flaky', 1.0, 1.0);
        addLuaSprite('Flaky', false);

        makeAnimatedLuaSprite('speaker', 'Flippy/Slaughter/MiniSpeaker', 925, 515);
	luaSpriteAddAnimationByPrefix('speaker', 'bop', 'boombox', 16, true);
	setScrollFactor('speaker', 1.0, 1.0);
        addLuaSprite('speaker', true);

	makeAnimatedLuaSprite('campfire', 'Flippy/Fire', 500, 360);
	luaSpriteAddAnimationByPrefix('campfire', 'bop', 'fire idle', 12, true);
	setScrollFactor('campfire', 1.0, 1.0);
        setProperty('campfire.alpha', 0.8);
        addLuaSprite('campfire', false);

if not lowQuality then
	makeLuaSprite('table', 'Flippy/Slaughter/Table', -850, -200);
        setProperty('table.scale.x', 1.1);
	setProperty('table.scale.y', 1.2);
	setScrollFactor('table', 1.3, 1.3);
        addLuaSprite('table', true);
end
        setProperty('sky.visible', false);
        setProperty('backTrees.visible', false);
        setProperty('trees.visible', false);
        setProperty('ground.visible', false);
        setProperty('boombox.visible', false);
        setProperty('Flaky.visible', false);
        setProperty('speaker.visible', false);
        setProperty('campfire.visible', false); 
        setProperty('table.visible', false);

        setProperty('introSoundsSuffix', '-kapow') 
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

function onStepHit()
if curStep == 800 then --blood stage code

     setProperty('defaultCamZoom', 0.65);
     setCharacterX('dad', -100);
     setCharacterY('dad', 200);
     yy = 580;
     setCharacterX('bf', 962);
     setCharacterY('bf', -150);
     xx2 = 750;
     yy2 = 540;
end

if curStep == 808 then --kapow stage code

     setProperty('defaultCamZoom', 0.63);
     setCharacterX('dad', -110);
     setCharacterY('dad', 200);
     yy = 540;
     setCharacterX('bf', 782);
     setCharacterY('bf', 240);
     xx2 = 770;
     yy2 = 600;
end

if curStep == 864 then

    setProperty('defaultCamZoom', 0.65);
    setCharacterX('dad', -100);
    setCharacterY('dad', 200);
    yy = 580;
    setCharacterX('bf', 962);
    setCharacterY('bf', -150);
    xx2 = 750;
    yy2 = 540;
end

if curStep == 872 then

    setProperty('defaultCamZoom', 0.63);
    setCharacterX('dad', -110);
    setCharacterY('dad', 200);
    yy = 540;
    setCharacterX('bf', 782);
    setCharacterY('bf', 240);
    xx2 = 770;
    yy2 = 600;
end

if curStep == 928 then

    setProperty('defaultCamZoom', 0.65);
    setCharacterX('dad', -100);
    setCharacterY('dad', 200);
    yy = 580;
    setCharacterX('bf', 962);
    setCharacterY('bf', -150);
    xx2 = 750;
    yy2 = 540;
end

if curStep == 936 then

    setProperty('defaultCamZoom', 0.63);
    setCharacterX('dad', -110);
    setCharacterY('dad', 200);
    yy = 540;
    setCharacterX('bf', 782);
    setCharacterY('bf', 240);
    xx2 = 770;
    yy2 = 600;
end

if curStep == 992 then

    setProperty('defaultCamZoom', 0.65);
    setCharacterX('dad', -100);
    setCharacterY('dad', 200);
    yy = 580;
    setCharacterX('bf', 962);
    setCharacterY('bf', -150);
    xx2 = 750;
    yy2 = 540;
end

if curStep == 1000 then

    setProperty('defaultCamZoom', 0.63);
    setCharacterX('dad', -110);
    setCharacterY('dad', 200);
    yy = 540;
    setCharacterX('bf', 782);
    setCharacterY('bf', 240);
    xx2 = 770;
    yy2 = 600;
end

if curStep == 1032 then

   setProperty('camHUD.visible', false);
   setProperty('camGame.visible', false);
end

if curStep == 1088 then

   setProperty('camHUD.visible', true);  
   setProperty('camGame.visible', true);
end

if curStep == 1376 then

    setProperty('defaultCamZoom', 0.65);
    setCharacterX('dad', -100);
    setCharacterY('dad', 200);
    yy = 580;
    setCharacterX('bf', 962);
    setCharacterY('bf', -150);
    xx2 = 750;
    yy2 = 540;
end

if curStep == 1384 then

    setProperty('defaultCamZoom', 0.63);
    setCharacterX('dad', -110);
    setCharacterY('dad', 200);
    yy = 540;
    setCharacterX('bf', 782);
    setCharacterY('bf', 240);
    xx2 = 770;
    yy2 = 600;
end

if curStep == 1440 then

    setProperty('defaultCamZoom', 0.65);
    setCharacterX('dad', -100);
    setCharacterY('dad', 200);
    yy = 580;
    setCharacterX('bf', 962);
    setCharacterY('bf', -150);
    xx2 = 750;
    yy2 = 540;
end

if curStep == 1448 then

    setProperty('defaultCamZoom', 0.63);
    setCharacterX('dad', -110);
    setCharacterY('dad', 200);
    yy = 540;
    setCharacterX('bf', 782);
    setCharacterY('bf', 240);
    xx2 = 770;
    yy2 = 600;
end

if curStep == 1504 then

    setProperty('defaultCamZoom', 0.65);
    setCharacterX('dad', -100);
    setCharacterY('dad', 200);
    yy = 580;
    setCharacterX('bf', 962);
    setCharacterY('bf', -150);
    xx2 = 750;
    yy2 = 540;
end

if curStep == 1512 then

    setProperty('defaultCamZoom', 0.63);
    setCharacterX('dad', -110);
    setCharacterY('dad', 200);
    yy = 540;
    setCharacterX('bf', 782);
    setCharacterY('bf', 240);
    xx2 = 770;
    yy2 = 600;
end

if curStep == 1568 then

    setProperty('defaultCamZoom', 0.65);
    setCharacterX('dad', -100);
    setCharacterY('dad', 200);
    yy = 580;
    setCharacterX('bf', 962);
    setCharacterY('bf', -150);
    xx2 = 750;
    yy2 = 540;
end

if curStep == 1576 then

    setProperty('defaultCamZoom', 0.63);
    setCharacterX('dad', -110);
    setCharacterY('dad', 200);
    yy = 540;
    setCharacterX('bf', 782);
    setCharacterY('bf', 240);
    xx2 = 770;
    yy2 = 600;
end

if curStep == 1728 then

    setProperty('defaultCamZoom', 0.65);
    setCharacterX('dad', -100);
    setCharacterY('dad', 200);
    yy = 580;
    setCharacterX('bf', 962);
    setCharacterY('bf', -150);
    xx2 = 750;
    yy2 = 540;
end

if curStep == 1734 then

    setProperty('camHUD.visible', false);
    setProperty('camGame.visible', false);
end
end

function onBeatHit()
if curBeat == 200 then --blood stage

    setProperty('skyfront.visible', false);
    setProperty('bwall.visible', false);
    setProperty('scene.visible', false);
    setProperty('lights.visible', false);

    setProperty('sky.visible', true);
    setProperty('backTrees.visible', true);
    setProperty('trees.visible', true);
    setProperty('ground.visible', true);
    setProperty('boombox.visible', true);
    setProperty('Flaky.visible', true);
    setProperty('speaker.visible', true);
    setProperty('campfire.visible', true); 
    setProperty('table.visible', true);
end

if curBeat == 202 then --kapow stage

    setProperty('skyfront.visible', true);
    setProperty('bwall.visible', true);
    setProperty('scene.visible', true);
    setProperty('lights.visible', true);

    setProperty('sky.visible', false);
    setProperty('backTrees.visible', false);
    setProperty('trees.visible', false);
    setProperty('ground.visible', false);
    setProperty('boombox.visible', false);
    setProperty('Flaky.visible', false);
    setProperty('speaker.visible', false);
    setProperty('campfire.visible', false); 
    setProperty('table.visible', false);
end

if curBeat == 216 then

    setProperty('skyfront.visible', false);
    setProperty('bwall.visible', false);
    setProperty('scene.visible', false);
    setProperty('lights.visible', false);

    setProperty('sky.visible', true);
    setProperty('backTrees.visible', true);
    setProperty('trees.visible', true);
    setProperty('ground.visible', true);
    setProperty('boombox.visible', true);
    setProperty('Flaky.visible', true);
    setProperty('speaker.visible', true);
    setProperty('campfire.visible', true); 
    setProperty('table.visible', true);
end

if curBeat == 218 then

    setProperty('skyfront.visible', true);
    setProperty('bwall.visible', true);
    setProperty('scene.visible', true);
    setProperty('lights.visible', true);

    setProperty('sky.visible', false);
    setProperty('backTrees.visible', false);
    setProperty('trees.visible', false);
    setProperty('ground.visible', false);
    setProperty('boombox.visible', false);
    setProperty('Flaky.visible', false);
    setProperty('speaker.visible', false);
    setProperty('campfire.visible', false); 
    setProperty('table.visible', false);
end

if curBeat == 232 then

    setProperty('skyfront.visible', false);
    setProperty('bwall.visible', false);
    setProperty('scene.visible', false);
    setProperty('lights.visible', false);

    setProperty('sky.visible', true);
    setProperty('backTrees.visible', true);
    setProperty('trees.visible', true);
    setProperty('ground.visible', true);
    setProperty('boombox.visible', true);
    setProperty('Flaky.visible', true);
    setProperty('speaker.visible', true);
    setProperty('campfire.visible', true); 
    setProperty('table.visible', true);
end

if curBeat == 234 then

    setProperty('skyfront.visible', true);
    setProperty('bwall.visible', true);
    setProperty('scene.visible', true);
    setProperty('lights.visible', true);

    setProperty('sky.visible', false);
    setProperty('backTrees.visible', false);
    setProperty('trees.visible', false);
    setProperty('ground.visible', false);
    setProperty('boombox.visible', false);
    setProperty('Flaky.visible', false);
    setProperty('speaker.visible', false);
    setProperty('campfire.visible', false); 
    setProperty('table.visible', false);
end

if curBeat == 248 then

    setProperty('skyfront.visible', false);
    setProperty('bwall.visible', false);
    setProperty('scene.visible', false);
    setProperty('lights.visible', false);

    setProperty('sky.visible', true);
    setProperty('backTrees.visible', true);
    setProperty('trees.visible', true);
    setProperty('ground.visible', true);
    setProperty('boombox.visible', true);
    setProperty('Flaky.visible', true);
    setProperty('speaker.visible', true);
    setProperty('campfire.visible', true); 
    setProperty('table.visible', true);
end

if curBeat == 250 then

    setProperty('skyfront.visible', true);
    setProperty('bwall.visible', true);
    setProperty('scene.visible', true);
    setProperty('lights.visible', true);

    setProperty('sky.visible', false);
    setProperty('backTrees.visible', false);
    setProperty('trees.visible', false);
    setProperty('ground.visible', false);
    setProperty('boombox.visible', false);
    setProperty('Flaky.visible', false);
    setProperty('speaker.visible', false);
    setProperty('campfire.visible', false); 
    setProperty('table.visible', false);
end

if curBeat == 344 then

    setProperty('skyfront.visible', false);
    setProperty('bwall.visible', false);
    setProperty('scene.visible', false);
    setProperty('lights.visible', false);

    setProperty('sky.visible', true);
    setProperty('backTrees.visible', true);
    setProperty('trees.visible', true);
    setProperty('ground.visible', true);
    setProperty('boombox.visible', true);
    setProperty('Flaky.visible', true);
    setProperty('speaker.visible', true);
    setProperty('campfire.visible', true); 
    setProperty('table.visible', true);
end

if curBeat == 346 then

    setProperty('skyfront.visible', true);
    setProperty('bwall.visible', true);
    setProperty('scene.visible', true);
    setProperty('lights.visible', true);

    setProperty('sky.visible', false);
    setProperty('backTrees.visible', false);
    setProperty('trees.visible', false);
    setProperty('ground.visible', false);
    setProperty('boombox.visible', false);
    setProperty('Flaky.visible', false);
    setProperty('speaker.visible', false);
    setProperty('campfire.visible', false); 
    setProperty('table.visible', false);
end

if curBeat == 360 then

    setProperty('skyfront.visible', false);
    setProperty('bwall.visible', false);
    setProperty('scene.visible', false);
    setProperty('lights.visible', false);

    setProperty('sky.visible', true);
    setProperty('backTrees.visible', true);
    setProperty('trees.visible', true);
    setProperty('ground.visible', true);
    setProperty('boombox.visible', true);
    setProperty('Flaky.visible', true);
    setProperty('speaker.visible', true);
    setProperty('campfire.visible', true); 
    setProperty('table.visible', true);
end

if curBeat == 362 then

    setProperty('skyfront.visible', true);
    setProperty('bwall.visible', true);
    setProperty('scene.visible', true);
    setProperty('lights.visible', true);

    setProperty('sky.visible', false);
    setProperty('backTrees.visible', false);
    setProperty('trees.visible', false);
    setProperty('ground.visible', false);
    setProperty('boombox.visible', false);
    setProperty('Flaky.visible', false);
    setProperty('speaker.visible', false);
    setProperty('campfire.visible', false); 
    setProperty('table.visible', false);
end

if curBeat == 376 then

    setProperty('skyfront.visible', false);
    setProperty('bwall.visible', false);
    setProperty('scene.visible', false);
    setProperty('lights.visible', false);

    setProperty('sky.visible', true);
    setProperty('backTrees.visible', true);
    setProperty('trees.visible', true);
    setProperty('ground.visible', true);
    setProperty('boombox.visible', true);
    setProperty('Flaky.visible', true);
    setProperty('speaker.visible', true);
    setProperty('campfire.visible', true); 
    setProperty('table.visible', true);
end

if curBeat == 378 then

    setProperty('skyfront.visible', true);
    setProperty('bwall.visible', true);
    setProperty('scene.visible', true);
    setProperty('lights.visible', true);

    setProperty('sky.visible', false);
    setProperty('backTrees.visible', false);
    setProperty('trees.visible', false);
    setProperty('ground.visible', false);
    setProperty('boombox.visible', false);
    setProperty('Flaky.visible', false);
    setProperty('speaker.visible', false);
    setProperty('campfire.visible', false); 
    setProperty('table.visible', false);
end

if curBeat == 392 then

    setProperty('skyfront.visible', false);
    setProperty('bwall.visible', false);
    setProperty('scene.visible', false);
    setProperty('lights.visible', false);

    setProperty('sky.visible', true);
    setProperty('backTrees.visible', true);
    setProperty('trees.visible', true);
    setProperty('ground.visible', true);
    setProperty('boombox.visible', true);
    setProperty('Flaky.visible', true);
    setProperty('speaker.visible', true);
    setProperty('campfire.visible', true); 
    setProperty('table.visible', true);
end

if curBeat == 394 then

    setProperty('skyfront.visible', true);
    setProperty('bwall.visible', true);
    setProperty('scene.visible', true);
    setProperty('lights.visible', true);

    setProperty('sky.visible', false);
    setProperty('backTrees.visible', false);
    setProperty('trees.visible', false);
    setProperty('ground.visible', false);
    setProperty('boombox.visible', false);
    setProperty('Flaky.visible', false);
    setProperty('speaker.visible', false);
    setProperty('campfire.visible', false); 
    setProperty('table.visible', false);
end

if curBeat == 432 then

    setProperty('skyfront.visible', false);
    setProperty('bwall.visible', false);
    setProperty('scene.visible', false);
    setProperty('lights.visible', false);

    setProperty('sky.visible', true);
    setProperty('backTrees.visible', true);
    setProperty('trees.visible', true);
    setProperty('ground.visible', true);
    setProperty('boombox.visible', true);
    setProperty('Flaky.visible', true);
    setProperty('speaker.visible', true);
    setProperty('campfire.visible', true); 
    setProperty('table.visible', true);
end
end

function opponentNoteHit()
triggerEvent('Screen Shake','0.02,0.006')

 health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end
end
local xx = 340;
local yy = 580;
local xx2 = 750;
local yy2 = 540;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-carry');

        makeLuaSprite('sky', 'Flippy/Assault/Sky', -600, -225);
        addLuaSprite('sky', false);
	setScrollFactor('sky', 0.5, 0.5);

	makeLuaSprite('backTrees', 'Flippy/Assault/BackTrees', -625, -200);
        addLuaSprite('backTrees', false);
	setScrollFactor('backTrees', 0.7, 0.7);
        
        makeAnimatedLuaSprite('fireBG', 'Flippy/Assault/StageFire', -770, -250);	
        addAnimationByPrefix('fireBG', 'idle', 'fire', 24, true);
        setLuaSpriteScrollFactor('fireBG', 0.9, 0.9);	
        addLuaSprite('fireBG', false);

	makeLuaSprite('trees', 'Flippy/Assault/Trees', -625, -225);
        addLuaSprite('trees', false);
	setScrollFactor('trees', 0.8, 0.8);
	
	makeLuaSprite('ground', 'Flippy/Assault/Ground', -700, -150);
        addLuaSprite('ground', false);
	setScrollFactor('ground', 1.0, 1.0);

        makeAnimatedLuaSprite('boombox', 'Flippy/Assault/Speaker', 925, 515);
        addLuaSprite('boombox', false);
	luaSpriteAddAnimationByPrefix('boombox', 'bop', 'boombox', 16, true);
	setScrollFactor('boombox', 1.0, 1.0);
	
	makeAnimatedLuaSprite('Flaky', 'Flippy/Assault/Scared_Flaky', 1450, 570);
	luaSpriteAddAnimationByPrefix('Flaky', 'bop', 'Flaky', 16, true);
	setScrollFactor('Flaky', 1.0, 1.0);
        addLuaSprite('Flaky', false);

        makeAnimatedLuaSprite('mefaltaelaire', 'Flippy/Assault/MiniSpeaker', 925, 515);
	luaSpriteAddAnimationByPrefix('mefaltaelaire', 'bop', 'boombox', 16, true);
	setScrollFactor('mefaltaelaire', 1.0, 1.0);
        addLuaSprite('mefaltaelaire', true);

	makeAnimatedLuaSprite('campfire', 'Flippy/Assault/Fire', 500, 360);
        addLuaSprite('campfire', false);
	luaSpriteAddAnimationByPrefix('campfire', 'bop', 'fire idle', 14, true);
        setProperty('campfire.alpha', 0.8);
	setScrollFactor('campfire', 1.0, 1.0);

if not lowQuality then
	makeLuaSprite('table', 'Flippy/Assault/Table', -850, -200);
        addLuaSprite('table', true);
	setScrollFactor('table', 1.3, 1.3);
        setProperty('table.scale.x', 1.1);
	setProperty('table.scale.y', 1.2);
end

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

        makeLuaSprite('Start', '', 0, 0);
	makeGraphic('Start',1280,720,'000000');
	setObjectCamera('Start', 'other');
        setProperty('Start.alpha', 1);
	addLuaSprite('Start', true);

--Flippy pov Flashback
        makeLuaSprite('bwall', 'Flippy/Army/bwall-fire', -625, -200);
	setScrollFactor('bwall', 0.9, 0.9);
        addLuaSprite('bwall', false);

        makeAnimatedLuaSprite('bloodFoggy', 'Flippy/Assault/Red_Foggy',  -2900,  100);
	luaSpriteAddAnimationByPrefix('bloodFoggy', 'bop', 'nieblal', 30, true);
	setScrollFactor('bloodFoggy', 1.0, 1.0);
        addLuaSprite('bloodFoggy', false);

        makeAnimatedLuaSprite('lapcvaaexplotar', 'Flippy/Assault/Red_Foggy',  -2900,  100);
	luaSpriteAddAnimationByPrefix('lapcvaaexplotar', 'bop', 'nieblal', 30, true);
	setScrollFactor('lapcvaaexplotar', 1.0, 1.0);
        setPropertyLuaSprite('lapcvaaexplotar', 'flipX', true);
        addLuaSprite('lapcvaaexplotar', false);

	makeLuaSprite('army', 'Flippy/Army/Scene-bloodlol', -700, -150);
	setScrollFactor('army', 1.0, 1.0);
        addLuaSprite('army', false);

        makeLuaSprite('lights', 'Flippy/Army/FlashBack-lights', -740, -150);
	setScrollFactor('lights', 1.1, 1.1);
        addLuaSprite('lights', true);

        setProperty('bwall.visible', false);
        setProperty('bloodFoggy.visible', false);
        setProperty('lapcvaaexplotar.visible', false);
        setProperty('army.visible', false);
        setProperty('lights.visible', false);	
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

        setObjectCamera('topBar', 'other');
        setObjectCamera('bottomBar', 'other');

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

function onStartCountdown()
      setProperty('camHUD.visible', false);
      doTweenZoom('zoom', 'camGame', 0.9, 0.01, 'circInOut');
      setProperty('defaultCamZoom', 0.9);

      return Function_Continue;
end

function onStepHit()
if curStep == 1 then

      doTweenAlpha('graphicAlpha', 'Start', 0, 55, 'quintOut');
end

if curStep == 128 then

      doTweenZoom('zoom', 'camGame', 0.65, 0.6, 'circInOut');
end

if curStep == 211 then

      setProperty('defaultCamZoom', 0.85);
end

if curStep == 256 then

      setProperty('defaultCamZoom', 0.65);
      setProperty('camHUD.visible', true);
      setObjectCamera('topBar', 'hud');
      setObjectCamera('bottomBar', 'hud');
end

if curStep == 767 then

      setProperty('defaultCamZoom', 0.85);
end

if curStep == 1024 then

      setProperty('defaultCamZoom', 0.65);
end

if curStep == 1280 then

      setProperty('fire1.x', -40);
      setProperty('fire1.y', -340);
 
      setPropertyFromClass('GameOverSubstate', 'characterName', 'picodeath-uber');
      setProperty('defaultCamZoom', 0.63);
      setCharacterX('dad', -110);
      setCharacterY('dad', 200);
      yy = 540;
      setCharacterX('bf', 782);
      setCharacterY('bf', 240);
      xx2 = 770;
      yy2 = 600;

end

if curStep == 1536 then

      setProperty('fire1.x', -770);
      setProperty('fire1.y', -250);

      setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-carry');
      setProperty('defaultCamZoom', 0.65);
      setCharacterX('dad', -100);
      setCharacterY('dad', 200);
      yy = 580;
      setCharacterX('bf', 962);
      setCharacterY('bf', -150);
      xx2 = 750;
      yy2 = 540;
end

if curStep >= 1280 and curStep < 1536 then

      cameraShake('camGame', 0.0008, 0.4)
      cameraShake('camHUD', 0.0008, 0.4)
end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 256 and getProperty('health') > 0.020 then
		setProperty('health', getProperty('health') - 0.020);
	end
end

function onTweenCompleted(tag)
    if tag == 'graphicAlpha' then
         removeLuaSprite('Start', true);
    end
end

function onBeatHit()
if curBeat == 320 then
     setProperty('bwall.visible', true);
     setProperty('bloodFoggy.visible', true);
     setProperty('lapcvaaexplotar.visible', true);
     setProperty('army.visible', true);
     setProperty('lights.visible', true);

     setProperty('backTrees.visible', false);
     setProperty('trees.visible', false);		    
     setProperty('ground.visible', false);
     setProperty('boombox.visible', false);
     setProperty('Flaky.visible', false);
     setProperty('mefaltaelaire.visible', false);
     setProperty('campfire.visible', false);
     setProperty('table.visible', false);      
end

if curBeat == 384 then
     setProperty('bwall.visible', false);
     setProperty('bloodFoggy.visible', false);
     setProperty('lapcvaaexplotar.visible', false);
     setProperty('army.visible', false);
     setProperty('lights.visible', false);

     setProperty('backTrees.visible', true);
     setProperty('trees.visible', true);		    
     setProperty('ground.visible', true);
     setProperty('boombox.visible', true);
     setProperty('Flaky.visible', true);
     setProperty('mefaltaelaire.visible', true);
     setProperty('campfire.visible', true);
     setProperty('table.visible', true);     
end
end
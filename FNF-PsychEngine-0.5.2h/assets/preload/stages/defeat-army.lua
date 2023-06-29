local xx = 340;
local yy = 550;
local xx2 = 770;
local yy2 = 560;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
        setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'kill');
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver_v4_LOOP');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOver_v4_End'); 
	setPropertyFromClass('GameOverSubstate', 'characterName', 'impostordeath');

	makeLuaSprite('sky', 'Flippy/Army/Sky', -600, -225);
	setScrollFactor('sky', 1.0, 1.0);
        addLuaSprite('sky', false);

        makeLuaSprite('backTrees', 'Flippy/Jungle/BackTrees', -625, -200);
	setScrollFactor('backTrees', 0.7, 0.7);
        addLuaSprite('backTrees', false);

	makeLuaSprite('trees', 'Flippy/Jungle/Trees', -625, -225);
	setScrollFactor('trees', 0.8, 0.8);
        addLuaSprite('trees', false);

        makeLuaSprite('bwall', 'Flippy/Army/bwall', -625, -200);
	setScrollFactor('bwall', 0.9, 0.9);
        addLuaSprite('bwall', false);

	makeLuaSprite('ground', 'Flippy/Army/scene', -700, -150);
        addLuaSprite('ground', false);
	setScrollFactor('ground', 1.0, 1.0);

        makeLuaSprite('rhm', 'Flippy/Defeat/rhm dead', 1340, 620);
        setProperty('rhm.scale.x', getProperty('rhm.scale.x') - 0.4);
	setProperty('rhm.scale.y', getProperty('rhm.scale.y') - 0.4);
        addLuaSprite('rhm', false);

        makeLuaSprite('skeleton1', 'Flippy/Defeat/deadBG Right', -1540, 270);
        setProperty('skeleton1.scale.x', getProperty('skeleton1.scale.x') - 0.6);
	setProperty('skeleton1.scale.y', getProperty('skeleton1.scale.y') - 0.6);
        addLuaSprite('skeleton1', false);

        makeLuaSprite('skeleton2', 'Flippy/Defeat/deadBG Left', 530, 350);
        setProperty('skeleton2.scale.x', getProperty('skeleton2.scale.x') - 0.7);
	setProperty('skeleton2.scale.y', getProperty('skeleton2.scale.y') - 0.7);
        addLuaSprite('skeleton2', false);

        makeLuaSprite('lights', 'Flippy/Defeat/lmao_lights', -740, -150);
	setScrollFactor('lights', 1.1, 1.1);
        addLuaSprite('lights', true);

        makeLuaSprite('dead', 'Flippy/Defeat/dead_yellow', 500, 910);
        scaleObject('dead', 2.0, 2.0);
        addLuaSprite('dead', true);

        makeLuaSprite('blood', 'Flippy/Defeat/Pool-Blood', 500, 910);
        setScrollFactor('blood', 1.0, 1.0);
        addLuaSprite('blood', false);

if not lowQuality then
        makeLuaSprite('venezuela', 'Flippy/Defeat/deadFG', -990, 800);
        scaleObject('venezuela', 0.4, 0.4);
        addLuaSprite('venezuela', true);
end

if hideHud == false then
        makeLuaSprite('impostorHB', 'HealthBar-Skins/healthBarDefeat', -50, -200);
	setObjectCamera('impostorHB', 'hud');
	setScrollFactor('impostorHB', 0.9, 0.9);
	addLuaSprite('impostorHB', true);  
end
        makeLuaSprite('BlackBords', 'cooloutline', 0,0);
	addLuaSprite('BlackBords', true);
        setProperty('BlackBords.alpha', 0.85);
        setObjectCamera('BlackBords', 'other');

        makeAnimatedLuaSprite('linesCam', 'Effects/animatedScanlines', 0, 0);
	luaSpriteAddAnimationByPrefix('linesCam', 'linesMove', 'linesMove instance', 17, true);
        setProperty('linesCam.alpha', 0.75);
	setObjectCamera('linesCam', 'other');
        addLuaSprite('linesCam', false);

        makeLuaSprite('VCR', 'Effects/VCR', 320, 180);
        setProperty('VCR.scale.x', 2.04);
	setProperty('VCR.scale.y', 2.12);  
        setObjectCamera('VCR', 'other');
        addLuaSprite('VCR', true);   
end

function onCreatePost()
        setProperty('impostorHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('impostorHB.x', getProperty('healthBar.x') - 37);

        setProperty('impostorHB.angle', getProperty('healthBar.angle'));
        setProperty('impostorHB.y', getProperty('healthBar.y') - 61);
        setProperty('impostorHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('impostorHB.scale.y', getProperty('healthBar.scale.y') - 0.1);
        setObjectOrder('impostorHB', 3);
        setObjectOrder('healthBar', 5);
	setObjectOrder('healthBarBG', 4);

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

function opponentNoteHit()
triggerEvent('Screen Shake','0.02,0.006')

 health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end
end
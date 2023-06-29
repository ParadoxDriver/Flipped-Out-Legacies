local xx = 340; 
local yy = 580; 
local xx2 = 750; 
local yy2 = 540; 
local xx3 = 400; 
local yy3 = 520; 
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
	makeLuaSprite('sky', 'Flippy/Hunter/Sky', -600, -225);
	setScrollFactor('sky', 0.5, 0.5);
        addLuaSprite('sky', false);

	makeLuaSprite('backTrees', 'Flippy/Hunter/BackTrees', -625, -200);
	setScrollFactor('backTrees', 0.7, 0.7);
        addLuaSprite('backTrees', false);

	makeLuaSprite('trees', 'Flippy/Hunter/Trees', -625, -225);
	setScrollFactor('trees', 0.8, 0.8);
        addLuaSprite('trees', false);

        makeAnimatedLuaSprite('foggy', 'Flippy/Hunter/fog',  -3000,  100);
	luaSpriteAddAnimationByPrefix('foggy', 'bop', 'nieblal', 30, true);
	setScrollFactor('foggy', 1.0, 1.0);
        addLuaSprite('foggy', false);

        makeAnimatedLuaSprite('lapcvaaexplotar', 'Flippy/Hunter/fog',  -3000,  100);
	luaSpriteAddAnimationByPrefix('lapcvaaexplotar', 'bop', 'nieblal', 30, true);
	setScrollFactor('lapcvaaexplotar', 1.0, 1.0);
        setPropertyLuaSprite('lapcvaaexplotar', 'flipX', true);
        addLuaSprite('lapcvaaexplotar', false);

	makeLuaSprite('ground', 'Flippy/Hunter/Ground', -700, -150);
	setScrollFactor('ground', 1.0, 1.0);
        addLuaSprite('ground', false);

        makeAnimatedLuaSprite('boombox', 'Flippy/Hunter/Speaker', 925, 515);
	luaSpriteAddAnimationByPrefix('boombox', 'bop', 'boombox', 16, true);
	setScrollFactor('boombox', 1.0, 1.0);
        addLuaSprite('boombox', false);

	makeAnimatedLuaSprite('Flaky', 'Flippy/Hunter/Scared_Flaky', 1450, 570);
	luaSpriteAddAnimationByPrefix('Flaky', 'bop', 'Flaky', 16, true);
	setScrollFactor('Flaky', 1.0, 1.0);
        addLuaSprite('Flaky', false);

        makeAnimatedLuaSprite('Speaker', 'Flippy/Hunter/MiniSpeaker', 925, 515);
	luaSpriteAddAnimationByPrefix('Speaker', 'bop', 'boombox', 16, true);
	setScrollFactor('Speaker', 1.0, 1.0);
        addLuaSprite('Speaker', true); 

	makeAnimatedLuaSprite('campfire', 'Flippy/Hunter/Fire', 500, 360);
	luaSpriteAddAnimationByPrefix('campfire', 'bop', 'fire idle', 12, true);
	setScrollFactor('campfire', 1.0, 1.0);
        setProperty('campfire.alpha', 0.8);
        addLuaSprite('campfire', false);

        makeAnimatedLuaSprite('FoggyGreen', 'Flippy/Hunter/fog',  -3000,  450);
	luaSpriteAddAnimationByPrefix('FoggyGreen', 'bop', 'nieblal', 30, true);
	setScrollFactor('FoggyGreen', 1.0, 1.0);
        addLuaSprite('FoggyGreen', true);

        makeAnimatedLuaSprite('RadFoggy', 'Flippy/Hunter/fog',  -3000,  450);
	luaSpriteAddAnimationByPrefix('RadFoggy', 'bop', 'nieblal', 30, true);
	setScrollFactor('RadFoggy', 1.0, 1.0);
        setPropertyLuaSprite('RadFoggy', 'flipX', true);
        addLuaSprite('RadFoggy', true);

if not lowQuality then
	makeLuaSprite('table', 'Flippy/Hunter/Table', -850, -200);
        setProperty('table.scale.x', 1.1);
	setProperty('table.scale.y', 1.2);
	setScrollFactor('table', 1.3, 1.3);
        addLuaSprite('table', true);
end
        makeAnimatedLuaSprite('rain', 'Flippy/Hunter/rain', -1200, -400);
        luaSpriteAddAnimationByPrefix('rain', 'rainanim', 'rainanim', 24, true);
        setProperty('rain.alpha', 0.85);
        setProperty('rain.scale.x', 2.5);
	setProperty('rain.scale.y', 2.5);
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
        setProperty('gf.visible', false);
        setProperty('bloodedHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))

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
          if gfSection == true then 
            if getProperty('gf.animation.curAnim.name') == 'singLEFT' then 
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)            
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
           end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
           end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
           end
           if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
               triggerEvent('Camera Follow Pos',xx3,yy3)
	  end
           if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
               triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
          end
           if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
               triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
          end
          if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
               triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
          end
          if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
              triggerEvent('Camera Follow Pos',xx3,yy3)
          end
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
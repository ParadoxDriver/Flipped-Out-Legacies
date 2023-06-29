local xx = 330;
local yy = 550;
local xx2 = 750;
local yy2 = 560;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
        setPropertyFromClass('GameOverSubstate', 'characterName', 'flippy-phantasm')

        makeLuaSprite('sky', 'Flippy/Slaughter/Sky', -600, -225);
        addLuaSprite('sky', false);
	setScrollFactor('sky', 0.5, 0.5);

	makeLuaSprite('backTrees', 'Flippy/Slaughter/BackTrees', -625, -200);
        addLuaSprite('backTrees', false);
	setScrollFactor('backTrees', 0.7, 0.7);

	makeLuaSprite('trees', 'Flippy/Slaughter/Trees', -625, -225);
        addLuaSprite('trees', false);
	setScrollFactor('trees', 0.8, 0.8);
	
	makeLuaSprite('ground', 'Flippy/Slaughter/Ground', -700, -150);
        addLuaSprite('ground', false);
	setScrollFactor('ground', 1.0, 1.0);

        makeAnimatedLuaSprite('boombox', 'Flippy/Speaker', 925, 515);
        addLuaSprite('boombox', false);
	luaSpriteAddAnimationByPrefix('boombox', 'bop', 'boombox', 16, true);
	setScrollFactor('boombox', 1.0, 1.0);
	
	makeAnimatedLuaSprite('Flaky', 'Flippy/Slaughter/Scared_Flaky', 1450, 570);
        addLuaSprite('Flaky', false);
	luaSpriteAddAnimationByPrefix('Flaky', 'bop', 'Flaky', 16, true);
	setScrollFactor('Flaky', 1.0, 1.0);

        makeAnimatedLuaSprite('xbox', 'Flippy/Slaughter/MiniSpeaker', 925, 515);
	luaSpriteAddAnimationByPrefix('xbox', 'bop', 'boombox', 16, true);
	setScrollFactor('xbox', 1.0, 1.0);
        addLuaSprite('xbox', true);

        makeAnimatedLuaSprite('BF', 'characters/BF-carry', 1040, 205);
        addLuaSprite('BF', true);
	luaSpriteAddAnimationByPrefix('BF', 'bop', 'BF idle shaking', (curBpm / 4), true);
	setScrollFactor('BF', 1.0, 1.0);

	makeAnimatedLuaSprite('campfire', 'Flippy/Fire', 500, 360);
        addLuaSprite('campfire', false);
	luaSpriteAddAnimationByPrefix('campfire', 'bop', 'fire idle', 14, true);
        setProperty('campfire.alpha', 0.8);
	setScrollFactor('campfire', 1.0, 1.0);

	makeLuaSprite('table', 'Flippy/Slaughter/Table', -850, -200);
        addLuaSprite('table', true);
	setScrollFactor('table', 1.3, 1.3);
	setProperty('table.scale.x', 1.1);
	setProperty('table.scale.y', 1.2);

if hideHud == false then
        makeLuaSprite('bloodedHB', 'HealthBar-Skins/healthBar2', -50, -200);
	setObjectCamera('bloodedHB', 'hud');
	setScrollFactor('bloodedHB', 0.9, 0.9);
	addLuaSprite('bloodedHB', true);
end
        makeLuaSprite('Start', '', 0, 0);
	makeGraphic('Start',1280,720,'000000');
	setObjectCamera('Start', 'other');
	addLuaSprite('Start', true);

--Trauma stage
        makeLuaSprite('traumaBG','Flippy/Autopsy-Turvy/Fleet_Trauma', -730, -255);
        addLuaSprite('traumaBG', false);

        makeLuaSprite('Light','Flippy/Autopsy-Turvy/Light_Above', -500, -250);
	addLuaSprite('Light',true);
	setLuaSpriteScrollFactor('Light', 1.0, 1.0);

        makeLuaSprite('BlackBords', 'cooloutline', 0, 0);
        setObjectCamera('BlackBords', 'other');
	addLuaSprite('BlackBords', true);

        makeAnimatedLuaSprite('vhsoverlay', 'Effects/vhs', -100, -40);
	addAnimationByPrefix('vhsoverlay', 'vhs', 'vhs', 24, true);
	setObjectCamera('vhsoverlay', 'other');
	setGraphicSize('vhsoverlay', 1000, 730);
	setProperty('vhsoverlay.alpha', 0.5);
        setProperty('vhsoverlay.scale.x', 3.7);
	setProperty('vhsoverlay.scale.y', 3.7); 
        addLuaSprite('vhsoverlay', true);

--Genocide stage
        makeLuaSprite('sky2', 'Flippy/Autopsy-Turvy/sky', -600, -225);
        addLuaSprite('sky2', false);
	setScrollFactor('sky2', 0.5, 0.5);

        makeLuaSprite('backTrees2', 'Flippy/Autopsy-Turvy/more tree', -625, -200);
        addLuaSprite('backTrees2', false);
	setScrollFactor('backTrees2', 0.7, 0.7);    	

	makeLuaSprite('trees2', 'Flippy/Autopsy-Turvy/treee', -625, -225);
        addLuaSprite('trees2', false);
	setScrollFactor('trees2', 0.8, 0.8);

        makeAnimatedLuaSprite('fireBG', 'Flippy/Autopsy-Turvy/UFFFF', -770, -250);	
        addAnimationByPrefix('fireBG', 'idle', 'fire', 24, true);
        setLuaSpriteScrollFactor('fireBG', 0.9, 0.9);	
        addLuaSprite('fireBG', false);

        makeLuaSprite('ground2', 'Flippy/Autopsy-Turvy/ground', -700, -150);
        addLuaSprite('ground2', false);
	setScrollFactor('ground2', 1.0, 1.0);

        makeLuaSprite('table2', 'Flippy/Autopsy-Turvy/table', -850, -200);
        addLuaSprite('table2', true);
	setScrollFactor('table2', 1.3, 1.3);
	setProperty('table2.scale.x', 1.1);
	setProperty('table2.scale.y', 1.2);

--Stage is gone
        setProperty('sky.visible', false);
        setProperty('backTrees.visible', false);
        setProperty('trees.visible', false);
        setProperty('ground.visible', false);
        setProperty('boombox.visible', false);
        setProperty('Flaky.visible', false);
        setProperty('xbox.visible', false);
        setProperty('BF.visible', false);
        setProperty('campfire.visible', false); 
        setProperty('table.visible', false);
	    
        setProperty('sky2.visible', false);
        setProperty('backTrees2.visible', false);
        setProperty('fireBG.visible', false);
        setProperty('trees2.visible', false);
        setProperty('ground2.visible', false);
        setProperty('table2.visible', false);

if lowQuality then
       setProperty('table.alpha', 0);
       setProperty('table2.alpha', 0);
end

--Alpha Object lol
        setProperty('Start.alpha', 1);
        setProperty('BlackBords.alpha', 1);	

--Fucking ObjcetOrder
        setObjectOrder('traumaBG', 2);
        setObjectOrder('sky', 1);
        setObjectOrder('sky2', 1);
        setObjectOrder('backTrees', 3);
        setObjectOrder('backTrees2', 3);
        setObjectOrder('trees', 5);
        setObjectOrder('trees2', 5);
	setObjectOrder('fireBG', 7);
	setObjectOrder('ground', 9);
        setObjectOrder('ground2', 9);
        setObjectOrder('campfire', 15);
        setObjectOrder('boombox', 15);
        setObjectOrder('Flaky', 16);
	setObjectOrder('xbox', 17);
        setObjectOrder('BF', 17);
        setObjectOrder('dadGroup', 17);
	setObjectOrder('boyfriendGroup', 17)
        setObjectOrder('table', 19);
        setObjectOrder('table2', 19);
        setObjectOrder('Light', 20);

--Cool Zoom
        setProperty('defaultCamZoom', 0.45);	
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
        setProperty('songText.color', getColorFromHex('E80A0A')) 

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

function onSongStart()
      doTweenAlpha('graphicAlpha', 'Start', 0, 10, 'linear');
end

function onStepHit()
if curStep == 2 then
      doTweenZoom('zoom', 'camGame', 0.60, 10, 'sineInOut');
      setProperty('defaultCamZoom', 0.60);
end

if curStep == 448 then
      doTweenZoom('zoom', 'camGame', 0.95, 6.5, 'sineInOut');
      setProperty('defaultCamZoom', 0.95);
end

if curStep == 512 then
      doTweenZoom('zoom', 'camGame', 0.65, 0.3, 'sineInOut');
      setProperty('defaultCamZoom', 0.65);
      setProperty('BlackBords.alpha', 0);
      setCharacterX('dad', -110);
      setCharacterY('dad', 200);
      setCharacterX('bf', 600);
      setCharacterY('bf', 220);
end

if curStep == 1024 then
      doTweenAlpha('shadowAlpha', 'BlackBords', 0.8, 0.9, 'linear');
      setProperty('defaultCamZoom', 0.85);
end

if curStep == 1088 then
      doTweenAlpha('shadowAlpha', 'BlackBords', 0, 0.9, 'linear');
      setProperty('defaultCamZoom', 0.65);
end

if curStep == 1224 then
    --setPropertyFromClass('ClientPrefs', 'camZooms', false)
      doTweenZoom('zoom', 'camGame', 0.95, 5.9, 'sineInOut');
      setProperty('defaultCamZoom', 0.95);
end

if curStep == 1280 then
    --setPropertyFromClass('ClientPrefs', 'camZooms', true)
      doTweenZoom('zoom', 'camGame', 0.65, 0.3, 'sineInOut');
      setProperty('defaultCamZoom', 0.65);
end

if curStep == 2122 then
    --setPropertyFromClass('ClientPrefs', 'camZooms', false)
      doTweenZoom('zoom', 'camGame', 0.95, 6.5, 'sineInOut');
      setProperty('defaultCamZoom', 0.95);
end

if curStep == 2177 then
    --setPropertyFromClass('ClientPrefs', 'camZooms', true)
      doTweenZoom('zoom', 'camGame', 0.65, 0.3, 'sineInOut');
      setProperty('defaultCamZoom', 0.65); 
      setProperty('BlackBords.alpha', 1);
      setCharacterX('dad', -220);
      setCharacterY('dad', 200);
      setCharacterX('bf', 750);
      setCharacterY('bf', 230);
end

if curStep == 2432 then
      setProperty('defaultCamZoom', 0.70);
end

if curStep == 2692 then
      doTweenAlpha('dadFadeEventTween', 'boyfriend', 0, 1.8, 'linear');

      noteTweenAlpha('noteDAD0', 0, 0, 1.7, 'linear');
      noteTweenAlpha('noteDAD1', 1, 0, 1.7, 'linear');
      noteTweenAlpha('noteDAD2', 2, 0, 1.7, 'linear');
      noteTweenAlpha('noteDAD3', 3, 0, 1.7, 'linear');

      noteTweenAlpha('noteBF4', 4, 0, 1.7, 'linear');
      noteTweenAlpha('noteBF5', 5, 0, 1.7, 'linear');
      noteTweenAlpha('noteBF6', 6, 0, 1.7, 'linear');
      noteTweenAlpha('noteBF7', 7, 0, 1.7, 'linear');

      doTweenAlpha('timeTxt.Alpha', 'timeTxt', 0, 1.7, 'linear');
      doTweenAlpha('timeBar.Alpha', 'timeBar', 0, 1.7, 'linear');
      doTweenAlpha('timeBarBG.Alpha', 'timeBarBG', 0, 1.7, 'linear');

      doTweenAlpha('songWM.Alpha', 'songWM', 0, 1.7, 'linear');
      doTweenAlpha('healthText.Alpha', 'healthText', 0, 1.7, 'linear');
      doTweenAlpha('iconP1', 'iconP1', 0, 1.7, 'linear');
      doTweenAlpha('iconP2', 'iconP2', 0, 1.7, 'linear');
      doTweenAlpha('healthBarBG', 'healthBarBG', 0, 1.7, 'linear');
      doTweenAlpha('healthBar', 'healthBar', 0, 1.7, 'linear');
      doTweenAlpha('fireHB', 'bloodedHB', 0, 1.7, 'linear');
      doTweenAlpha('bloodedHB', 'fireHB', 0, 1.7, 'linear');
      doTweenAlpha('healthBarWithAnim.Alpha', 'healthBarWithAnim', 0, 1.7, 'linear');
      doTweenAlpha('scoreTxt', 'scoreTxt', 0, 1.7, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0, 1.7, 'linear');

      doTweenAlpha('ratings', 'ratings', 0, 1.7, 'linear');
      doTweenAlpha('underlay', 'underlay', 0, 1.7, 'linear');
      doTweenAlpha('ComboText', 'ComboText', 0, 1.7, 'linear');
      doTweenAlpha('SicksText',  'SicksText', 0, 1.7, 'linear');
      doTweenAlpha('GoodsText', 'GoodsText', 0, 1.7, 'linear');
      doTweenAlpha('BadsText', 'BadsText', 0, 1.7, 'linear');
      doTweenAlpha('ShitsText', 'ShitsText', 0, 1.7, 'linear');
      doTweenAlpha('MissText',  'MissText', 0, 1.7, 'linear');

      doTweenZoom('zoom', 'camGame', 0.40, 3.8, 'sineInOut');
      setProperty('defaultCamZoom', 0.40);
end

if curStep == 2713 then
      doTweenZoom('zoom', 'camGame', 0.65, 0.3, 'sineInOut');
      setProperty('defaultCamZoom', 0.65);
      setCharacterX('dad', -110);
      setCharacterY('dad', 200);
      setCharacterX('bf', 750);
      setCharacterY('bf', 230);
end

if curStep == 2832 then
      doTweenAlpha('graphicAlpha', 'Start', 4, 20, 'linear');
end
end

function onBeatHit()
if curBeat == 128 then
       setProperty('sky.visible', true);
       setProperty('backTrees.visible', true);
       setProperty('trees.visible', true);		    
       setProperty('ground.visible', true);
       setProperty('boombox.visible', true);
       setProperty('Flaky.visible', true);
       setProperty('xbox.visible', true);
       setProperty('BF.visible', true);		    
       setProperty('campfire.visible', true);
       setProperty('table.visible', true);

       setProperty('traumaBG.visible', false);
       setProperty('Light.visible', false);
       setProperty('vhsoverlay.visible', false);
end 

if curBeat == 320 then
      setProperty('sky.visible', false);
      setProperty('backTrees.visible', false);
      setProperty('trees.visible', false);
      setProperty('ground.visible', false);

      setProperty('sky2.visible', true);
      setProperty('backTrees2.visible', true);
      setProperty('fireBG.visible', true);
      setProperty('trees2.visible', true);
      setProperty('ground2.visible', true);
      setProperty('table2.visible', true);		    
end
  
if curBeat == 544 then
      setProperty('traumaBG.visible', true);
      setProperty('Light.visible', true);
      setProperty('vhsoverlay.visible', true);
        
      setProperty('boombox.visible', false);
      setProperty('Flaky.visible', false);
      setProperty('xbox.visible', false);
      setProperty('BF.visible', false);
      setProperty('campfire.visible', false); 
      setProperty('table.visible', false);

      setProperty('sky2.visible', false);
      setProperty('backTrees2.visible', false);
      setProperty('fireBG.visible', false);
      setProperty('trees2.visible', false);
      setProperty('ground2.visible', false);
      setProperty('table2.visible', false);		    
end 

if curBeat == 679 then 
      setProperty('traumaBG.visible', false);
      setProperty('Light.visible', false);
      setProperty('vhsoverlay.visible', false);
         
      setProperty('boombox.visible', true);
      setProperty('Flaky.visible', true);
      setProperty('xbox.visible', true);
      setProperty('BF.visible', true);		    
      setProperty('campfire.visible', true);
      setProperty('table.visible', false);

      setProperty('sky2.visible', true);
      setProperty('smoke.visible', true);
      setProperty('backTrees2.visible', true);
      setProperty('fireBG.visible', true);
      setProperty('trees2.visible', true);
      setProperty('ground2.visible', true);	
      setProperty('table2.visible', true);	    
end		      		      	
end
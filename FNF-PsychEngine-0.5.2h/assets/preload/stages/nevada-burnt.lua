local xx = 240;
local yy = 540;
local xx2 = 800;
local yy2 = 590;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
	makeLuaSprite('city', 'Flippy/Burnt/nevada_city', -600, -100) --the background
	addLuaSprite('city', false);
	setProperty('city.scale.x', getProperty('city.scale.x') + 0.6);
	setProperty('city.scale.y', getProperty('city.scale.y') + 0.2);

        makeAnimatedLuaSprite('fire', 'Flippy/Assault/StageFire', -800, -70);
        setLuaSpriteScrollFactor('fire', 0.9, 0.9);	
        addAnimationByPrefix('fire', 'idle', 'fire', 30, true);
        setProperty('fire.scale.x', getProperty('fire.scale.x') + 0.3);
        setProperty('fire.scale.y', getProperty('fire.scale.y') + 0.3);
        addLuaSprite('fire', false);

	makeLuaSprite('hill', 'Flippy/Burnt/nevada_hill', -150, 100) --the hill that deimos and sanford occupy.
	addLuaSprite('hill', false);
	setProperty('hill.scale.x', getProperty('hill.scale.x') + 0.8);
	setProperty('hill.scale.y', getProperty('hill.scale.y') + 0.6);
	setLuaSpriteScrollFactor('hill', 0.94, 0.94);

        makeLuaSprite('stage', 'Flippy/Burnt/nevada_stage', -350, -220); --the stage where everybody sings!
	addLuaSprite('stage', false);
	setProperty('stage.scale.x', getProperty('stage.scale.x') + 0.75);
	setProperty('stage.scale.y', getProperty('stage.scale.y') + 0.8);

        makeLuaSprite('speaker', 'Flippy/Burnt/Destroyed_boombox', -770, -170);
	setScrollFactor('speaker', 1, 1);
        setProperty('speaker.scale.x', getProperty('speaker.scale.x') - 0.1);
        setProperty('speaker.scale.y', getProperty('speaker.scale.y') - 0.1);
        addLuaSprite('speaker', false);

        makeLuaSprite('blood', 'Flippy/Burnt/Pool-Blood2', -100, 790);
        setScrollFactor('blood', 1.0, 1.0);
        addLuaSprite('blood', false);

        makeLuaSprite('blood2', 'Flippy/Burnt/Pool-Blood', -800, 1020);
        setScrollFactor('blood2', 1.0, 1.0);
        addLuaSprite('blood2', false);

        makeLuaSprite('Flip-blood', 'Flippy/Burnt/Pool-Blood', 980, 920);
        setScrollFactor('Flip-blood', 1.0, 1.0);
        addLuaSprite('Flip-blood', false);

        makeLuaSprite('buddies', 'Flippy/Burnt/buddies', -890, -100);
        setScrollFactor('buddies', 1.0, 1.0);
        setProperty('buddies.scale.x', getProperty('buddies.scale.x') - 0.1);
        setProperty('buddies.scale.y', getProperty('buddies.scale.y') - 0.1);
        addLuaSprite('buddies', false);

if not lowQuality then
	makeLuaSprite('foreground', 'Flippy/Burnt/nevada_foreground', -400, -60); --the foreground, aka tent with the word MADNESS on it
	addLuaSprite('foreground', false);
	setProperty('foreground.scale.x', getProperty('foreground.scale.x') + 0.3);
	setProperty('foreground.scale.y', getProperty('foreground.scale.y') + 0.4);
end

if hideHud == false then
        makeLuaSprite('bloodedHB', 'HealthBar-Skins/healthBar2', -50, -200);
	setObjectCamera('bloodedHB', 'hud');
	setScrollFactor('bloodedHB', 0.9, 0.9);
	addLuaSprite('bloodedHB', true);
end
        makeLuaSprite('BlackBords', 'cooloutline', 0, 0);
        setObjectCamera('BlackBords', 'hud');
        setProperty('BlackBords.alpha', 0);
	addLuaSprite('BlackBords', true);

        makeLuaSprite('Start', '', 0, 0);
	makeGraphic('Start',1280,720,'000000');
	setObjectCamera('Start', 'other');
        setProperty('Start.alpha', 1);
	addLuaSprite('Start', true);

        setObjectOrder('city', 1);
        setObjectOrder('fire', 2);
	setObjectOrder('hill', 3);
	setObjectOrder('stage', 10);
        setObjectOrder('blood', 11);
        setObjectOrder('speaker', 12);
        setObjectOrder('blood2', 11);
        setObjectOrder('Flip-blood', 11);
        setObjectOrder('dadGroup', 16);
        setObjectOrder('buddies', 17);
	setObjectOrder('boyfriendGroup', 17)
        setObjectOrder('foreground', 18);

        setProperty('defaultCamZoom', 0.9);
end

function onCreatePost()
        setProperty('bloodedHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('bloodedHB.x', getProperty('healthBar.x') - 30);

        setProperty('bloodedHB.angle', getProperty('healthBar.angle'));
        setProperty('bloodedHB.y', getProperty('healthBar.y') - 15);
        setProperty('bloodedHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('bloodedHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('BlackBords', 1);
        setObjectOrder('bloodedHB', 4);
        setObjectOrder('healthBar', 3);
	setObjectOrder('healthBarBG', 2);

        setProperty('timeBar.color', getColorFromHex('FF3200'))
        setProperty('timeTxt.color', getColorFromHex('FF3200'))
        setProperty('scoreTxt.color', getColorFromHex('FF3200'))
        setProperty('botplayTxt.color', getColorFromHex('FF3200'))
        setProperty('healthText.color', getColorFromHex('FF3200'))
        setProperty('songWM.color', getColorFromHex('FF3200'))  

        setProperty('underlay.color', getColorFromHex('FF3200'))
        setProperty('ComboText.color', getColorFromHex('FF3200'))  
        setProperty('SicksText.color', getColorFromHex('FF3200'))
        setProperty('GoodsText.color', getColorFromHex('FF3200'))
        setProperty('BadsText.color', getColorFromHex('FF3200'))
        setProperty('ShitsText.color', getColorFromHex('FF3200'))
        setProperty('MissText.color', getColorFromHex('FF3200'))   
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

function onSongStart()
      doTweenAlpha('graphicAlpha', 'Start', 0, 90, 'quintOut');
end

function onStepHit()
if curStep == 10 then
      doTweenAlpha('graphicAlpha', 'Start', 0, 40, 'quintOut');
      doTweenZoom('zoom', 'camGame', 0.57, 4.3, 'sineInOut');
      setProperty('defaultCamZoom', 0.57);
end
if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
if curStep == 64 then
      removeLuaSprite('Start',true);
      setProperty('BlackBords.alpha', 1);
      doTweenAlpha('underlay', 'underlay', 0, 0.5, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0, 0.5, 'linear');
      fadeDadStrum(0, 0.5)
      fadeBfStrum(0, 0.5)
      fadeItem(0, 0.5)
end
if curStep == 288 then
      setProperty('BlackBords.alpha', 0);
      doTweenAlpha('underlay', 'underlay', 0.6, 0.3, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0.5, 0.3, 'linear');
      fadeDadStrum(1, 0.3)
      fadeBfStrum(1, 0.3)
      fadeItem(1, 0.3)
end
if curStep == 1600 then
      setProperty('BlackBords.alpha', 1);
      doTweenAlpha('underlay', 'underlay', 0, 0.5, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0, 0.5, 'linear');
      fadeDadStrum(0, 0.5)
      fadeBfStrum(0, 0.5)
      fadeItem(0, 0.5)
end
if curStep == 1856 then
      setProperty('BlackBords.alpha', 0);
      doTweenAlpha('underlay', 'underlay', 0.6, 0.3, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0.5, 0.3, 'linear');
      fadeDadStrum(1, 0.3)
      fadeBfStrum(1, 0.3)
      fadeItem(1, 0.3)
end
if curStep == 1867 then--esto es por si el juego se traba por la burn granada y no se quita el BlackBords
      setProperty('BlackBords.alpha', 0);
      doTweenAlpha('underlay', 'underlay', 0.6, 0.3, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0.5, 0.3, 'linear');
      fadeDadStrum(1, 0.3)
      fadeBfStrum(1, 0.3)
      fadeItem(1, 0.3)
end
if curStep == 2752 then
      xx2 = 800; 
      yy2 = 590;
      setProperty('BlackBords.alpha', 1);
      doTweenAlpha('underlay', 'underlay', 0, 0.5, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0, 0.5, 'linear');
      fadeDadStrum(0, 0.5)
      fadeBfStrum(0, 0.5)
      fadeItem(0, 0.5)
end
if curStep == 2878 then
      fadeDadStrum(0.5, 0.5)
end
if curStep == 3004 then
      fadeBfStrum(1, 2.0)
end 
if curStep == 3008 then
      setProperty('BlackBords.alpha', 0);
      doTweenAlpha('underlay', 'underlay', 0.6, 0.3, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0.5, 0.3, 'linear');
      fadeDadStrum(1, 0.3)
      fadeItem(1, 0.3)
end
if curStep == 3521 then
      setProperty('BlackBords.alpha', 1);
      doTweenAlpha('underlay', 'underlay', 0, 0.5, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0, 0.5, 'linear');
      fadeDadStrum(0, 0.5)
      fadeBfStrum(0, 0.5)
      fadeItem(0, 0.5)
end
if curStep == 3632 then
      setProperty('BlackBords.alpha', 0);
      doTweenAlpha('underlay', 'underlay', 0.6, 0.3, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0.5, 0.3, 'linear');
      fadeDadStrum(1, 0.3)
      fadeBfStrum(1, 0.3)
      fadeItem(1, 0.3)
end
end
if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
if curStep == 64 then
      removeLuaSprite('Start',true);
      setProperty('BlackBords.alpha', 1);
      doTweenAlpha('underlay', 'underlay', 0, 0.5, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0, 0.5, 'linear');
      fadeDadStrum(0, 0.5)
      fadeBfStrum(0, 0.5)
      fadeItem(0, 0.5)
end
if curStep == 288 then
      setProperty('BlackBords.alpha', 0);
      doTweenAlpha('underlay', 'underlay', 0.6, 0.3, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0.5, 0.3, 'linear');
      fadeDadStrum(0.5, 0.3)
      fadeBfStrum(1, 0.3)
      fadeItem(1, 0.3)
end
if curStep == 1600 then
      setProperty('BlackBords.alpha', 1);
      doTweenAlpha('underlay', 'underlay', 0, 0.5, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0, 0.5, 'linear');
      fadeDadStrum(0, 0.5)
      fadeBfStrum(0, 0.5)
      fadeItem(0, 0.5)
end
if curStep == 1856 then
      setProperty('BlackBords.alpha', 0);
      doTweenAlpha('underlay', 'underlay', 0.6, 0.3, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0.5, 0.3, 'linear');
      fadeDadStrum(0.5, 0.3)
      fadeBfStrum(1, 0.3)
      fadeItem(1, 0.3)
end
if curStep == 1867 then--esto es por si el juego se traba por la burn granada y no se quita el BlackBords
      setProperty('BlackBords.alpha', 0);
      doTweenAlpha('underlay', 'underlay', 0.6, 0.3, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0.5, 0.3, 'linear');
      fadeDadStrum(0.5, 0.3)
      fadeBfStrum(1, 0.3)
      fadeItem(1, 0.3)
end
if curStep == 2752 then
      xx2 = 800; 
      yy2 = 590;
      setProperty('BlackBords.alpha', 1);
      doTweenAlpha('underlay', 'underlay', 0, 0.5, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0, 0.5, 'linear');
      fadeDadStrum(0, 0.5)
      fadeBfStrum(0, 0.5)
      fadeItem(0, 0.5)
end
if curStep == 2878 then
      fadeDadStrum(0.5, 0.5)
end
if curStep == 3004 then
      fadeBfStrum(1, 2.0)
end 
if curStep == 3008 then
      setProperty('BlackBords.alpha', 0);
      doTweenAlpha('underlay', 'underlay', 0.6, 0.3, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0.5, 0.3, 'linear');
      fadeItem(1, 0.3)
end
if curStep == 3521 then
      setProperty('BlackBords.alpha', 1);
      doTweenAlpha('underlay', 'underlay', 0, 0.5, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0, 0.5, 'linear');
      fadeDadStrum(0, 0.5)
      fadeBfStrum(0, 0.5)
      fadeItem(0, 0.5)
end
if curStep == 3632 then
      setProperty('BlackBords.alpha', 0);
      doTweenAlpha('underlay', 'underlay', 0.6, 0.3, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0.5, 0.3, 'linear');
      fadeDadStrum(0.5, 0.3)
      fadeBfStrum(1, 0.3)
      fadeItem(1, 0.3)
end
end
if curStep == 2143 then
      setProperty('defaultCamZoom', 0.60);
end
if curStep == 2175 then
      setProperty('defaultCamZoom', 0.57);
end
if curStep == 2207 then
      setProperty('defaultCamZoom', 0.60);
end
if curStep == 2240 then
      setProperty('defaultCamZoom', 0.57);
end
if curStep == 2272 then
      setProperty('defaultCamZoom', 0.60);
end
if curStep == 2303 then
      setProperty('defaultCamZoom', 0.57);
end
if curStep == 2496 then--opponent camera
      setProperty('cameraSpeed', 3);
      xx2 = 240; 
      yy2 = 540;
end
if curStep == 2497 then
      setProperty('cameraSpeed', 1);
end
if curStep == 2559 then--player camera
      setProperty('cameraSpeed', 3);
      xx2 = 800; 
      yy2 = 590;
end
if curStep == 2560 then
      setProperty('cameraSpeed', 1);
end
if curStep == 2591 then--opponent camera
      setProperty('cameraSpeed', 3);
      xx2 = 240; 
      yy2 = 540;
end
if curStep == 2592 then
      setProperty('cameraSpeed', 1);
end
if curStep == 2688 then--player camera
      setProperty('cameraSpeed', 3);
      xx2 = 800; 
      yy2 = 590;
end
if curStep == 2689 then
      setProperty('cameraSpeed', 1);
end
if curStep == 2720 then--opponent camera
      setProperty('cameraSpeed', 3);
      xx2 = 240; 
      yy2 = 540;
end
if curStep == 2720 then
      setProperty('cameraSpeed', 1);
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
    health = getProperty('health')
    if getProperty('health') > 0.015 then
        setProperty('health', health- 0.015);
    end
end

function fadeDadStrum(alph, duration)
     noteTweenAlpha('noteDAD0', 0, alph,duration,'linear');
     noteTweenAlpha('noteDAD1', 1, alph,duration,'linear');
     noteTweenAlpha('noteDAD2', 2, alph,duration,'linear');
     noteTweenAlpha('noteDAD3', 3, alph,duration,'linear');
end

function fadeBfStrum(alph, duration)
     noteTweenAlpha('noteBF4', 4, alph,duration,'linear');
     noteTweenAlpha('noteBF5', 5, alph,duration,'linear');
     noteTweenAlpha('noteBF6', 6, alph,duration,'linear');
     noteTweenAlpha('noteBF7', 7, alph,duration,'linear');
end

function fadeItem(alph, duration)
     doTweenAlpha('scoreTxt', 'scoreTxt', alph, duration, 'linear');
     doTweenAlpha('timeTxt',  'timeTxt', alph, duration, 'linear');
     doTweenAlpha('timeBar', 'timeBar', alph, duration, 'linear');
     doTweenAlpha('timeBarBG', 'timeBarBG', alph, duration, 'linear');

     doTweenAlpha('iconP1', 'iconP1', alph, duration, 'linear');
     doTweenAlpha('iconP2',  'iconP2', alph, duration, 'linear');
     doTweenAlpha('fireHB', 'fireHB', alph, duration, 'linear');
     doTweenAlpha('bloodedHB', 'bloodedHB', alph, duration, 'linear');
     doTweenAlpha('healthBarBG', 'healthBarBG', alph, duration, 'linear');
     doTweenAlpha('healthBar', 'healthBar', alph, duration, 'linear');
     doTweenAlpha('healthBarWithAnim', 'healthBarWithAnim', alph, duration, 'linear');

     doTweenAlpha('ratings', 'ratings', alph, duration, 'linear');
     doTweenAlpha('healthText', 'healthText', alph, duration, 'linear');
     doTweenAlpha('songWM', 'songWM', alph, duration, 'linear');

     doTweenAlpha('ComboText', 'ComboText', alph, duration, 'linear');
     doTweenAlpha('SicksText',  'SicksText', alph, duration, 'linear');
     doTweenAlpha('GoodsText', 'GoodsText', alph, duration, 'linear');
     doTweenAlpha('BadsText', 'BadsText', alph, duration, 'linear');
     doTweenAlpha('ShitsText', 'ShitsText', alph, duration, 'linear');
     doTweenAlpha('MissText',  'MissText', alph, duration, 'linear');
end
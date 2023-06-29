local xx = 750;
local yy = 400;
local xx2 = 750;
local yy2 = 400;
local ofs = 10;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
        setPropertyFromClass('GameOverSubstate', 'characterName', 'flippy-phantasm');

        makeLuaSprite('bg', 'Flippy/Cave/bg', -1800, -1600);
        addLuaSprite('bg', false);

	makeLuaSprite('cavebacking2', 'Flippy/Cave/cavebacking2', -1800, -600);
	setScrollFactor('cavebacking2', 1.3, 1.25);
        addLuaSprite('cavebacking1', false);

	makeLuaSprite('cavebacking1', 'Flippy/Cave/cavebacking1', -1800, -500)
        setScrollFactor('cavebacking1', 1.2, 1.15);
        addLuaSprite('cavebacking1', false);

        makeLuaSprite('stalagmite', 'Flippy/Cave/cavebase', -1800, -1400);
        setScrollFactor('stalagmite', 1.11, 1.11);
        addLuaSprite('stalagmite', false);

	makeLuaSprite('speakers', 'Flippy/Cave/speakers', -320, -1100)
	addLuaSprite('speakers', false)

	makeLuaSprite('floor', 'Flippy/Cave/floor', -1800, 610);
	addLuaSprite('floor', false);
    
        makeAnimatedLuaSprite('rock', 'Flippy/Cave/asshole', 80, 70);
        addAnimationByPrefix('rock','tumami','motherfucker instance 1', 24, true);
        setProperty('rock.scale.x', 1);
	setProperty('rock.scale.y', 1);
        addLuaSprite('rock', false);

        makeLuaSprite('redbg', '', 0, 0);
        makeGraphic('redbg',1280,720,'FF0000');
	setLuaSpriteScrollFactor('redbg', 1, 1);
        screenCenter('redbg', 'xy');
        setProperty('redbg.scale.x', 5.5);
	setProperty('redbg.scale.y', 5.5);
        setProperty('redbg.alpha', 0);
        addLuaSprite('redbg', false);

if hideHud == false then
        makeLuaSprite('sacorgHB', 'HealthBar-Skins/healthbarSacorg',  -50, -200);
	setObjectCamera('sacorgHB', 'hud');
        setScrollFactor('sacorgHB', 0.9, 0.9);
	addLuaSprite('sacorgHB', true);
end
        makeLuaSprite('shadow', 'vinetca', -640, -300);
        setObjectCamera('shadow', 'other'); 
        setProperty('shadow.scale.x', 0.5);
	setProperty('shadow.scale.y', 0.6);
        addLuaSprite('shadow', false);

        setProperty('bg.alpha', 0);
        setProperty('cavebacking2.alpha', 0);
        setProperty('cavebacking1.alpha', 0);
        setProperty('stalagmite.alpha', 0);
        setProperty('speakers.alpha', 0);
        setProperty('floor.alpha', 0);
        setProperty('rock.alpha', 0);

        addCharacterToList('yourselffps', 'dad')
        addCharacterToList('yourself', 'dad')
	addCharacterToList('bf-flippy', 'boyfriend')		
end

function onCreatePost()
        setProperty('sacorgHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));
 
        setProperty('sacorgHB.x', getProperty('healthBar.x') - 53);

        setProperty('sacorgHB.angle', getProperty('healthBar.angle'));
        setProperty('sacorgHB.y', getProperty('healthBar.y') - 22);
        setProperty('sacorgHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('sacorgHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('sacorgHB', 4);
        setObjectOrder('healthBar', 3);
	setObjectOrder('healthBarBG', 2);

        setProperty('timeBar.color', getColorFromHex('C8DDAE'))
        setProperty('timeTxt.color', getColorFromHex('C8DDAE'))
        setProperty('scoreTxt.color', getColorFromHex('C8DDAE'))
        setProperty('botplayTxt.color', getColorFromHex('C8DDAE'))
        setProperty('healthText.color', getColorFromHex('C8DDAE'))
        setProperty('songWM.color', getColorFromHex('C8DDAE'))

        setProperty('underlay.color', getColorFromHex('C8DDAE'))
        setProperty('ComboText.color', getColorFromHex('C8DDAE'))  
        setProperty('SicksText.color', getColorFromHex('C8DDAE'))
        setProperty('GoodsText.color', getColorFromHex('C8DDAE'))
        setProperty('BadsText.color', getColorFromHex('C8DDAE'))
        setProperty('ShitsText.color', getColorFromHex('C8DDAE'))
        setProperty('MissText.color', getColorFromHex('C8DDAE'))    
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
     setPropertyFromClass('ClientPrefs', 'camZooms', false) 
     setProperty('camHUD.alpha', 0);
     setProperty('boyfriend.alpha', 0);
     setProperty('dad.alpha', 0);
     setProperty('iconP2.alpha', 0);
end

function onStepHit()
if curStep == 50 then

     doTweenAlpha('hud', 'camHUD', 1, 10, 'linear');
end

if curStep == 188 then

     doTweenAlpha('piedraBf', 'rock', 1, 2.9, 'linear');  
end

if curStep == 415 then

     doTweenZoom('zoom', 'camGame', 0.35, 2.1, 'linear');
     doTweenAlpha('assholeAlpha', 'rock', 0, 2.3, 'linear');
     doTweenAlpha('hud', 'camHUD', 0, 1.8, 'linear');
end

if curStep == 441 then

     setPropertyFromClass('ClientPrefs', 'camZooms', true)
     doTweenZoom('zoom', 'camGame', 0.9, 0.01, 'linear');
     doTweenAlpha('dad', 'dad', 1, 2.3, 'linear');
end

if curStep == 448 then

     doTweenAlpha('hud', 'camHUD', 1, 0.3, 'linear');
end

if curStep == 704 then

     setProperty('bg.alpha', 1);
     setProperty('cavebacking2.alpha', 1);
     setProperty('cavebacking1.alpha', 1);
     setProperty('stalagmite.alpha', 1);
     setProperty('speakers.alpha', 1);
     setProperty('floor.alpha', 1);

     setProperty('iconP2.alpha', 1);
     setProperty('boyfriend.alpha', 1);
     setProperty('defaultCamZoom', 0.45);

     setCharacterX('dad', -10);
     setCharacterY('dad', 40);
     ofs = 35;
     xx = 630;
     xx2 = 870;
end

if curStep == 960 then

     setProperty('defaultCamZoom', 0.75);
     setProperty('redbg.alpha', 1);
     doTweenColor('fliqpy', 'dad', '000000', 0.001);
     doTweenColor('flippy', 'boyfriend', '000000', 0.001);
end

if curStep == 1088 then

     setProperty('defaultCamZoom', 0.45);
     setProperty('redbg.alpha', 0);
     doTweenColor('fliqpy', 'dad', 'FFFFFF', 0.001);
     doTweenColor('flippy', 'boyfriend', 'FFFFFF', 0.001);
end

if curStep >= 960 and curStep < 1088 then

     triggerEvent('Screen Shake', '0.5, 0.01', '0.5, 0.007');
end

if curStep == 1280 then --opponent section

     xx = 320;
     xx2 = 320;
     yy = 460;
     yy2 = 460;
     setProperty('cameraSpeed', 100);
     doTweenZoom('zoom', 'camGame', 0.85, 0.1, 'circInOut');
     setProperty('defaultCamZoom', 0.85);
end

if curStep == 1281 then --opponent camera

     setProperty('cameraSpeed', 1);
end

if curStep == 1296 then --player section

     setProperty('cameraSpeed', 100);
     xx = 1300;
     xx2 = 1300;
end

if curStep == 1297 then --player camera

     setProperty('cameraSpeed', 1);
end

if curStep == 1312 then --opponent section

     setProperty('cameraSpeed', 100);
     xx = 320;
     xx2 = 320;
end

if curStep == 1313 then --opponent camera

     setProperty('cameraSpeed', 1);
end

if curStep == 1328 then --dual section

     xx = 740;
     xx2 = 740;
     yy = 400;
     yy2 = 400;
     setProperty('cameraSpeed', 100);
     doTweenZoom('zoom', 'camGame', 0.65, 0.01, 'circInOut');
     setProperty('defaultCamZoom', 0.65);
end

if curStep == 1329 then

     setProperty('cameraSpeed', 1);
end

if curStep == 1331 then

     setProperty('defaultCamZoom', 0.55);
end

if curStep == 1336 then --dual section

     setProperty('defaultCamZoom', 0.45);
end

if curStep == 1344 then

     setProperty('cameraSpeed', 1);

     setProperty('bg.alpha', 0);
     setProperty('cavebacking2.alpha', 0);
     setProperty('cavebacking1.alpha', 0);
     setProperty('stalagmite.alpha', 0);
     setProperty('speakers.alpha', 0);
     setProperty('floor.alpha', 0);

     setProperty('iconP2.alpha', 0);
     setProperty('boyfriend.alpha', 0);
     setProperty('defaultCamZoom', 0.9);

     setCharacterX('dad', 100);
     setCharacterY('dad', 60);
     ofs = 10;
     xx = 750;
     xx2 = 750;
end

if curStep == 1440 then

     setProperty('defaultCamZoom', 1.0);
end

if curStep == 1471 then

     setProperty('defaultCamZoom', 0.9);
end

if curStep == 1760 then

     setProperty('bg.alpha', 1);
     setProperty('cavebacking2.alpha', 1);
     setProperty('cavebacking1.alpha', 1);
     setProperty('stalagmite.alpha', 1);
     setProperty('speakers.alpha', 1);
     setProperty('floor.alpha', 1);

     setProperty('iconP2.alpha', 1);
     setProperty('boyfriend.alpha', 1);
     setProperty('defaultCamZoom', 0.5);

     setCharacterX('dad', -10);
     setCharacterY('dad', 40);
     ofs = 35;
     xx = 630;
     xx2 = 870;
end

if curStep == 2207 then --opponent section

     setProperty('cameraSpeed', 100);
     doTweenZoom('zoom', 'camGame', 0.85, 0.01, 'circInOut');
     setProperty('defaultCamZoom', 0.85);
     xx = 320;
     xx2 = 320;
     yy = 460;
     yy2 = 460;
end

if curStep == 2208 then --opponent camera

     setProperty('cameraSpeed', 1);
end

if curStep == 2223 then --player section

     setProperty('cameraSpeed', 100);
     xx = 1300;
     xx2 = 1300;
end

if curStep == 2224 then --player camera

     setProperty('cameraSpeed', 1);
end

if curStep == 2239 then --opponent section

     setProperty('cameraSpeed', 100);
     xx = 320;
     xx2 = 320;
end

if curStep == 2240 then --opponent camera

     setProperty('cameraSpeed', 1);
end

if curStep == 2255 then --dual section

     xx = 740;
     xx2 = 740;
     yy = 400;
     yy2 = 400;
     setProperty('cameraSpeed', 100);
     doTweenZoom('zoom', 'camGame', 0.5, 0.01, 'circInOut');
     setProperty('defaultCamZoom', 0.5);
end

if curStep == 2256 then

     setProperty('cameraSpeed', 1);
end

if curStep == 2259 then --opponent section

     setProperty('defaultCamZoom', 0.4);
end

if curStep == 2268 then --opponent section

     setProperty('defaultCamZoom', 0.3);
end

if curStep == 2304 then

     setProperty('camHUD.visible', false);
     setProperty('camGame.visible', false);
end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
     if curStep >= 704 and getProperty('health') > 0.05 then
	setProperty('health', getProperty('health') - 0.02);
    end
end
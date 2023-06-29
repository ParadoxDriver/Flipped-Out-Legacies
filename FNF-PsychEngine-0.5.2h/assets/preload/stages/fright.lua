local xx = 370;
local yy = 180;
local xx2 = 900;
local yy2 = 500;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
        makeLuaSprite('lol', 'Flippy/Fright/iminyourwalls', -390, -230);
        scaleObject('lol', 1.6, 1.6);
        addLuaSprite('lol', false);
    
        makeLuaSprite('aftonSucks', 'Flippy/Fright/floor', -390, -250);
        scaleObject('aftonSucks', 1.6, 1.6);
        addLuaSprite('aftonSucks', false);
    
        makeLuaSprite('bruh', 'Flippy/Fright/gradient', 0, 0);
        setObjectCamera('bruh', 'hud');
        addLuaSprite('bruh', false);

if hideHud == false then
        makeLuaSprite('sacorgHB', 'HealthBar-Skins/healthbarSacorg',  -50, -200);
        setObjectCamera('sacorgHB', 'hud');
        setScrollFactor('sacorgHB', 0.9, 0.9);
        addLuaSprite('sacorgHB', true); 
end
        makeLuaSprite('shadow', 'vinetca', -640, -300);
        setObjectCamera('shadow', 'hud'); 
        setProperty('shadow.scale.x', 0.5);
        setProperty('shadow.scale.y', 0.6);
        addLuaSprite('shadow', false);
end

function onCreatePost()
        setProperty('sacorgHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

        setProperty('sacorgHB.x', getProperty('healthBar.x') - 53);

        setProperty('sacorgHB.angle', getProperty('healthBar.angle'));
        setProperty('sacorgHB.y', getProperty('healthBar.y') - 22);
        setProperty('sacorgHB.scale.x', getProperty('healthBar.scale.x'));
        setProperty('sacorgHB.scale.y', getProperty('healthBar.scale.y'));
        setObjectOrder('bruh', 1);
        setObjectOrder('sacorgHB', 5);
        setObjectOrder('healthBar', 4);
	setObjectOrder('healthBarBG', 3);

        setTextFont('botplayTxt', "Five at Freddy's-Regular.ttf");
        setTextFont('scoreTxt', "Five at Freddy's-Regular.ttf");
        setTextFont('timeTxt', "Five at Freddy's-Regular.ttf");
        setTextFont('songWM', "Five at Freddy's-Regular.ttf");
        setTextFont('healthText', "Five at Freddy's-Regular.ttf");

        setTextFont('ComboText', "Five at Freddy's-Regular.ttf");
        setTextFont('SicksText', "Five at Freddy's-Regular.ttf");
        setTextFont('GoodsText', "Five at Freddy's-Regular.ttf");
        setTextFont('BadsText', "Five at Freddy's-Regular.ttf");
        setTextFont('ShitsText', "Five at Freddy's-Regular.ttf");
        setTextFont('MissText', "Five at Freddy's-Regular.ttf");  

        setProperty('timeTxt.color', getColorFromHex('5F8614'))
        setProperty('timeBar.color', getColorFromHex('5F8614'))
        setProperty('scoreTxt.color', getColorFromHex('5F8614'))
        setProperty('botplayTxt.color', getColorFromHex('5F8614'))
        setProperty('healthText.color', getColorFromHex('5F8614'))
        setProperty('songWM.color', getColorFromHex('5F8614'))
        
        setProperty('underlay.color', getColorFromHex('5F8614'))
        setProperty('ComboText.color', getColorFromHex('5F8614'))  
        setProperty('SicksText.color', getColorFromHex('5F8614'))
        setProperty('GoodsText.color', getColorFromHex('5F8614'))
        setProperty('BadsText.color', getColorFromHex('5F8614'))
        setProperty('ShitsText.color', getColorFromHex('5F8614'))
        setProperty('MissText.color', getColorFromHex('5F8614'))  
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
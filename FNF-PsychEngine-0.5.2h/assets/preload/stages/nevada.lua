local xx = 220;
local yy = 520;
local xx2 = 750;
local yy2 = 580;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
	makeLuaSprite('city', 'Flippy/Nevada/Nevada_City', -600, -100); --the background
	addLuaSprite('city', false);
	setProperty('city.scale.x', getProperty('city.scale.x') + 0.6);
	setProperty('city.scale.y', getProperty('city.scale.y') + 0.2);

        makeAnimatedLuaSprite('sanford', 'Flippy/Nevada/Stanford', 1233, -117); --sanford's sprites. bool statement means if the animation should loop or not.
	addAnimationByPrefix('sanford', 'idle', 'stanford dance', 14, true);
	setProperty('sanford.scale.x', getProperty('sanford.scale.x') + 0.26);
	setProperty('sanford.scale.y', getProperty('sanford.scale.y') + 0.26);
	setLuaSpriteScrollFactor('sanford', 0.94, 0.94);
        addLuaSprite('sanford', false);
	
	makeAnimatedLuaSprite('deimos', 'Flippy/Nevada/Deimous', -625, 17); --deimos's sprites
	addAnimationByPrefix('deimos', 'idle', 'deimous dance', 14, true);
	addAnimationByPrefix('deimos', 'shoot', 'deimous shoot', 20, false);
	setProperty('deimos.scale.x', getProperty('deimos.scale.x') + 0.26);
	setProperty('deimos.scale.y', getProperty('deimos.scale.y') + 0.26);
	setLuaSpriteScrollFactor('deimos', 0.94, 0.94);
        addLuaSprite('deimos', false);
	
	makeLuaSprite('hill', 'Flippy/Nevada/Nevada_Hill', -150, 100); --the hill that deimos and sanford occupy.
	addLuaSprite('hill', false);
	setProperty('hill.scale.x', getProperty('hill.scale.x') + 0.8);
	setProperty('hill.scale.y', getProperty('hill.scale.y') + 0.6);
	setLuaSpriteScrollFactor('hill', 0.94, 0.94);

        makeLuaSprite('stage', 'Flippy/Nevada/Nevada_Stage', -350, -220); --the stage where everybody sings!
	addLuaSprite('stage', false);
	setProperty('stage.scale.x', getProperty('stage.scale.x') + 0.75);
	setProperty('stage.scale.y', getProperty('stage.scale.y') + 0.8);

        makeAnimatedLuaSprite('speaker', 'Flippy/Nevada/boombox', 80, 448);
        luaSpriteAddAnimationByPrefix('speaker', 'bop', 'speakers', 24, false);
        objectPlayAnimation('speaker', 'bop');
	setScrollFactor('speaker', 1, 1);
        addLuaSprite('speaker', false);

        makeAnimatedLuaSprite('tiger', 'Flippy/Nevada/General_Tiger', 285, 9);
	luaSpriteAddAnimationByPrefix('tiger', 'idle', 'tiger idle', 24, false);
        objectPlayAnimation('tiger', 'idle', true);
	setScrollFactor('tiger', 1.0, 1.0);
        addLuaSprite('tiger', false);

        makeAnimatedLuaSprite('engineer', 'characters/tigerbf', -912, 350);
	luaSpriteAddAnimationByPrefix('engineer', 'idle', 'BF idle dance', 16, true);
	setScrollFactor('engineer', 1.0, 1.0);
        setPropertyLuaSprite('engineer', 'flipX', true);
        addLuaSprite('engineer', false);

        makeAnimatedLuaSprite('agent', 'characters/tigerbf', 1140, 590);
	luaSpriteAddAnimationByPrefix('agent', 'idle', 'BF idle dance', 16, true);
	setScrollFactor('agent', 1.0, 1.0);
        addLuaSprite('agent', false);

if not lowQuality then
	makeLuaSprite('foreground', 'Flippy/Nevada/Nevada_Foreground', -400, -80); --the foreground, aka tent with the word MADNESS on it
	addLuaSprite('foreground', false);
	setProperty('foreground.scale.x', getProperty('foreground.scale.x') + 0.3);
	setProperty('foreground.scale.y', getProperty('foreground.scale.y') + 0.4);
end

if hideHud == false then
        makeLuaSprite('sacorgHB', 'HealthBar-Skins/healthbarSacorg',  -50, -200);
	setObjectCamera('sacorgHB', 'hud');
        setScrollFactor('sacorgHB', 0.9, 0.9);
	addLuaSprite('sacorgHB', true);
end
        setObjectOrder('city', 1);
	setObjectOrder('hill', 3);
	setObjectOrder('deimos', 4);
	setObjectOrder('sanford', 5);
	setObjectOrder('stage', 10);
        setObjectOrder('speaker', 12);
        setObjectOrder('tiger', 13);
        setObjectOrder('engineer', 14);
        setObjectOrder('agent', 18);
        setObjectOrder('dadGroup', 16);
	setObjectOrder('boyfriendGroup', 17)
        setObjectOrder('foreground', 18);
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

        setProperty('timeBar.color', getColorFromHex('53E52C'))
        setProperty('timeTxt.color', getColorFromHex('53E52C'))
        setProperty('scoreTxt.color', getColorFromHex('53E52C'))
        setProperty('botplayTxt.color', getColorFromHex('53E52C'))
        setProperty('healthText.color', getColorFromHex('53E52C'))
        setProperty('songWM.color', getColorFromHex('53E52C'))

        setProperty('underlay.color', getColorFromHex('53E52C'))
        setProperty('ComboText.color', getColorFromHex('53E52C'))  
        setProperty('SicksText.color', getColorFromHex('53E52C'))
        setProperty('GoodsText.color', getColorFromHex('53E52C'))
        setProperty('BadsText.color', getColorFromHex('53E52C'))
        setProperty('ShitsText.color', getColorFromHex('53E52C'))
        setProperty('MissText.color', getColorFromHex('53E52C'))    
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

function onCountdownTick(counter)
if counter % 1 == 0 then
     objectPlayAnimation('speaker', 'bop')
     objectPlayAnimation('tiger', 'idle')
end
end

function onBeatHit()
if curBeat % 2 == 0 then
     objectPlayAnimation('speaker', 'bop', true)
     objectPlayAnimation('tiger', 'idle', true)
end
end
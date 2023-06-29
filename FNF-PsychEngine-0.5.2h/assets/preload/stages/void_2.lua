local xx = 100;
local yy = 1050;
local xx2 = 600;
local yy2 = 1050;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
swingFactor = 15;

function onCreate() 
	makeLuaSprite('white', '', -1300, 0);
        makeGraphic('white',1280,720,'ffffff');
	setLuaSpriteScrollFactor('white',1,1);
        scaleObject('white', 5.5, 5.5);
        addLuaSprite('white', false);

	makeAnimatedLuaSprite('void', 'Flippy/Agoti/The_Void', -1300, 400);
	addAnimationByPrefix('void', 'void', 'VoidShift', 24, true);
	scaleObject('void', 2.5, 2.5);
        addLuaSprite('void', false);

        makeAnimatedLuaSprite('efect', 'Flippy/Agoti/The_Void', -300, 400);
	addAnimationByPrefix('efect', 'void', 'VoidShift', 24, true);
	scaleObject('efect', 2.5, 2.5);
        setPropertyLuaSprite('efect', 'flipX', true);
        addLuaSprite('efect', false);

        makeLuaSprite('tower', 'Flippy/Agoti/Tower', -1300, 0);
        addLuaSprite('tower', false);

if not lowQuality then
        makeLuaSprite('lol', 'Flippy/Agoti/Void_Back', -1300, 0);
        addLuaSprite('lol', false);
end
        makeLuaSprite('fg', 'Flippy/Agoti/Floor', -1300, 0);
        addLuaSprite('fg', false);

if hideHud == false then
        makeLuaSprite('sacorgHB', 'HealthBar-Skins/healthbarSacorg',  -50, -200);
	setObjectCamera('sacorgHB', 'hud');
        setScrollFactor('sacorgHB', 0.9, 0.9);
        addLuaSprite('sacorgHB', false);
end
        setProperty('introSoundsSuffix', '-entity') 
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

        setProperty('timeBar.color', getColorFromHex('BA1E24'))
        setProperty('timeTxt.color', getColorFromHex('BA1E24'))
        setProperty('scoreTxt.color', getColorFromHex('BA1E24'))
        setProperty('botplayTxt.color', getColorFromHex('BA1E24'))
        setProperty('healthText.color', getColorFromHex('BA1E24'))
        setProperty('songWM.color', getColorFromHex('BA1E24'))  

        setProperty('underlay.color', getColorFromHex('BA1E24'))     
        setProperty('ComboText.color', getColorFromHex('BA1E24'))  
        setProperty('SicksText.color', getColorFromHex('BA1E24'))
        setProperty('GoodsText.color', getColorFromHex('BA1E24'))
        setProperty('BadsText.color', getColorFromHex('BA1E24'))
        setProperty('ShitsText.color', getColorFromHex('BA1E24'))
        setProperty('MissText.color', getColorFromHex('BA1E24'))         
end

function onUpdate()
for i = 0, getProperty('unspawnNotes.length')-1 do
swing = ((getPropertyFromClass('Conductor', 'songPosition') / 1000)*(bpm/84))
setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY1 + 12  * math.sin((swing + i*0.25) * math.pi), i)
end
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
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NoteSkins/LegacyNote_assets');
		end
	end

	for i = 0, getProperty('playerStrums.length') -1 do
		if getPropertyFromGroup('playerStrums', i, 'texture') == 'NOTE_assets' then 
			setPropertyFromGroup('playerStrums', i, 'texture', 'NoteSkins/LegacyNote_assets');
		end
	end

	for i = 0, getProperty('unspawnNotes.length') -1 do
		if getPropertyFromGroup('unspawnNotes', i, 'texture') == '' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/LegacyNote_assets');
		end

		setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'SplashesSkins/LegacySplashes');
	end
end
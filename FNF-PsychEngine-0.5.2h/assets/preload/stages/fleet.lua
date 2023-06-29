local followchars = true
local modchart = true
local xx = 960
local yy = 690
local xx2 = 960
local yy2 = 690
local ofs = 35
local del = 0
local del2 = 0
local bgs = {'fleet', 'sonic'}

function onCreate()
	precacheImage('NoteSkins/BNOTE_assets');
	precacheImage('SplashesSkins/BloodSplashes');
	precacheImage('HealthBar-Skins/healthBar2');
        precacheImage('HealthBar-Skins/sacorgHB');

	makeAnimatedLuaSprite('fx', 'Flippy/Chaos/vintage', 0, 0)
	addAnimationByPrefix('fx', 'idle', 'idle', 16, true)
	scaleObject('fx', 3, 3)
	setObjectCamera('fx', 'camHud')
	objectPlayAnimation('fx', 'idle', true)
	setProperty('fx.alpha', 0)

	for i = 1,2 do
		makeLuaSprite(bgs[i], 'Flippy/Chaos/'..bgs[i], 0, 100)
		addLuaSprite(bgs[i], false)
	end

if hideHud == false then
        makeLuaSprite('sacorgHB', 'HealthBar-Skins/healthbarSacorg',  -50, -200);
	setObjectCamera('sacorgHB', 'hud');
        setScrollFactor('sacorgHB', 0.9, 0.9);
	addLuaSprite('sacorgHB', true);
end
	addCharacterToList('fliqpy-phantasm', 'boyfriend')
	precacheSound('stat')

	setPropertyFromClass('GameOverSubstate', 'characterName', 'flippy-phantasm')
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
end

function onCountdownStarted()
	makeLuaSprite('healthBarBG2', 'HealthBar-Skins/healthBar2', getProperty('healthBarBG.x') - 25, getProperty('healthBarBG.y') -12);
	setObjectCamera('healthBarBG2', 'hud');
	setObjectOrder('healthBarBG2', getObjectOrder('healthBarBG') + 1);
	addLuaSprite('healthBarBG2', true);
	setProperty('healthBarBG2.visible', false);
end

function onSongStart()
	addLuaSprite('fx', true)
end

function onUpdate(elapsed)
	if modchart == true then
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
		end
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
		  if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
			triggerEvent('Camera Follow Pos',xx2,yy2)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			triggerEvent('Camera Follow Pos',xx2,yy2)
		  end
		end
	else
		triggerEvent('Camera Follow Pos','','')
	end
end

function onStartCountdown()
        setProperty('timeTxt.color', getColorFromHex('53E52C'))
        setProperty('timeBar.color', getColorFromHex('53E52C'))
        setProperty('scoreTxt.color', getColorFromHex('53E52C'))
        setProperty('botplayTxt.color', getColorFromHex('53E52C'))
        setProperty('healthText.color', getColorFromHex('53E52C'))
        setProperty('songWM.color', getColorFromHex('53E52C'))
        setProperty('engineText.color', getColorFromHex('53E52C'))

        setProperty('underlay.color', getColorFromHex('53E52C'))
        setProperty('ComboText.color', getColorFromHex('53E52C'))  
        setProperty('SicksText.color', getColorFromHex('53E52C'))
        setProperty('GoodsText.color', getColorFromHex('53E52C'))
        setProperty('BadsText.color', getColorFromHex('53E52C'))
        setProperty('ShitsText.color', getColorFromHex('53E52C'))
        setProperty('MissText.color', getColorFromHex('53E52C')) 

	setProperty('gf.alpha', 0)
	setProperty('dad.alpha', 0)
	setProperty('iconP2.alpha', 0)

	return Function_Continue
end

fleetStep = {384, 768, 1151, 1172, 1276, 1282, 1304, 1536, 1922, 1937, 1943, 1956}
sonicStep = {640, 1024, 1154, 1176, 1279, 1300, 1408, 1792, 1926, 1940, 1946, 1960}

fleetCount = 1;
sonicCount = 1;

coloredNoteSplashes = false;

function onStepHit()
	if curStep == 10 then
		modchart = false
	end

	if curStep == fleetStep[fleetCount] then
		fleetON()
	end

	if curStep == sonicStep[sonicCount] then
		fleetOFF()
	end

	if curStep == fleetStep[fleetCount] - 33 or curStep == fleetStep[fleetCount + 1] - 33  or curStep == fleetStep[fleetCount + 2] - 33 then
		coloredNoteSplashes = true;
	end

	if curStep == sonicStep[sonicCount] - 36 or curStep == sonicStep[sonicCount + 1] - 36  or curStep == sonicStep[sonicCount + 2] - 36 then
		coloredNoteSplashes = false;
	end

	if coloredNoteSplashes and not (curStep >= 1168 - 33 and curStep < 1176 - 36) then
		for i = 0, 4 do
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'SplashesSkins/BloodSplashes');
		end
	end

end

function fleetON()
	setProperty('fx.alpha', 0.8)
	setProperty('sonic.alpha', 0)
        doTweenAlpha('fleetON', 'fx', 0, 1, 'linear')

	setProperty('timeTxt.color', getColorFromHex('E80A0A'))
        setProperty('timeBar.color', getColorFromHex('E80A0A'))
        setProperty('scoreTxt.color', getColorFromHex('E80A0A'))
        setProperty('botplayTxt.color', getColorFromHex('E80A0A'))
        setProperty('healthText.color', getColorFromHex('E80A0A'))
        setProperty('songWM.color', getColorFromHex('E80A0A'))
        setProperty('engineText.color', getColorFromHex('E80A0A'))

        setProperty('underlay.color', getColorFromHex('E80A0A'))
        setProperty('ComboText.color', getColorFromHex('E80A0A'))  
        setProperty('SicksText.color', getColorFromHex('E80A0A'))
        setProperty('GoodsText.color', getColorFromHex('E80A0A'))
        setProperty('BadsText.color', getColorFromHex('E80A0A'))
        setProperty('ShitsText.color', getColorFromHex('E80A0A'))
        setProperty('MissText.color', getColorFromHex('E80A0A')) 

	playSound('stat', 0.3)
	triggerEvent('Change Character', 0, 'fliqpy-phantasm')
        setProperty('sacorgHB.visible', false);

	if hideHud == false then
		setProperty('healthBarBG2.visible', true);
	end

	for i = 0, getProperty('playerStrums.length') - 1 do
		setPropertyFromGroup('playerStrums', i, 'texture', 'NoteSkins/BNOTE_assets');
	end

	fleetCount = fleetCount + 1;
end

function fleetOFF()
	setProperty('fx.alpha', 0.8)
	setProperty('sonic.alpha', 1)
	doTweenAlpha('fleetON', 'fx', 0, 1, 'linear')

        setProperty('timeTxt.color', getColorFromHex('53E52C'))
        setProperty('timeBar.color', getColorFromHex('53E52C'))
        setProperty('scoreTxt.color', getColorFromHex('53E52C'))
        setProperty('botplayTxt.color', getColorFromHex('53E52C'))
        setProperty('healthText.color', getColorFromHex('53E52C'))
        setProperty('songWM.color', getColorFromHex('53E52C'))
        setProperty('engineText.color', getColorFromHex('53E52C'))

        setProperty('underlay.color', getColorFromHex('53E52C'))
        setProperty('ComboText.color', getColorFromHex('53E52C'))  
        setProperty('SicksText.color', getColorFromHex('53E52C'))
        setProperty('GoodsText.color', getColorFromHex('53E52C'))
        setProperty('BadsText.color', getColorFromHex('53E52C'))
        setProperty('ShitsText.color', getColorFromHex('53E52C'))
        setProperty('MissText.color', getColorFromHex('53E52C')) 

	playSound('stat', 0.3)
	triggerEvent('Change Character', 0, 'flippy-phantasm')
	setProperty('healthBarBG2.visible', false);
        setProperty('sacorgHB.visible', true);

	for i = 0, getProperty('playerStrums.length') - 1 do
		setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
	end

	sonicCount = sonicCount + 1;
end

function onGameOver()
	modchart = false
	return Function_Continue;
end
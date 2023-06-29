function onCreate()
    makeLuaText('engineText', "Mashup By The Blaster", 0, 2, 680);
    setTextAlignment('engineText', 'left');
    setTextSize('engineText', 17);
    setTextBorder('engineText', 1, '000000');
    setObjectCamera('engineText', 'hud');
    setTextColor('engineText', 'E80A0A');
    setTextFont('engineText', "Slasher.ttf");
    addLuaText('engineText');

    makeLuaSprite('spoopy', 'spoopyvignette', -700, -400);
    setObjectCamera('spoopy', 'other');
    setProperty('spoopy.scale.x', 0.90);
    setProperty('spoopy.scale.y', 0.90);
    addLuaSprite('spoopy', true);

    makeAnimatedLuaSprite('disclaimer', 'aurora_disclaimer', -3000, 15);
    addAnimationByPrefix('disclaimer', 'appear', 'aurorapopup_appear', 24, false);
    setObjectCamera('disclaimer', 'other');
    setProperty('disclaimer.scale.x', 0.40);
    setProperty('disclaimer.scale.y', 0.40);
    addLuaSprite('disclaimer', true);

    setObjectOrder('spoopy', 1);
end

function onEvent(name, value1, value2)
if name == "Jumpscare" then
    makeLuaSprite('jumpscare', 'auroraJumpscare', 0, 0);
    setObjectCamera('jumpscare', 'hud');
    setProperty('jumpscare.antialiasing', true);
    addLuaSprite('jumpscare', true);

         setProperty('jumpscare.alpha', value1);
         cameraShake('camHUD', 0.01015625, value2);
            runTimer('wait', value2);
    end
end

function onCountdownStarted()
    setProperty('camHUD.visible', false);
    setProperty('camGame.alpha', 0);
end

function onSongStart()
    doTweenZoom('zoom', 'camGame', 0.9, 0.01, 'circInOut');
    setProperty('defaultCamZoom', 0.9);
    doTweenX('MoveInBox', 'disclaimer', -1860, 1, 'cubeOut');
    objectPlayAnimation('disclaimer', 'appear', true);

	runTimer('warningTime', 3)
end

function onTimerCompleted(tag)
	if tag == 'warningTime' then
       doTweenX('goodbye', 'disclaimer', -3050, 2, 'cubeOut');
       objectPlayAnimation('disclaimer', 'appear', false);
        runTimer('delete', 1)
	end
    if tag == 'delete' then
	  removeLuaSprite('disclaimer', true);
   end
    if tag == 'wait' then
	 doTweenAlpha('byebye', 'jumpscare', 0, 0.1, 'quartOut');
    end
end

function onTweenCompleted(tag)
    if tag == 'byebye' then
        removeLuaSprite('jumpscare', true);
    end
end

function onStepHit()
if curStep == 1 then    
    doTweenAlpha('ScreenOut', 'camGame', 1, 6.2, 'linear');
end
if curStep == 257 then
    doTweenZoom('zoom', 'camGame', 0.6, 0.01, 'circInOut');
    setProperty('defaultCamZoom', 0.6);
    setProperty('camHUD.visible', true);
    removeLuaSprite('spoopy',true);
end
if curStep == 768 then
    setProperty('defaultCamZoom', 0.9);
end
if curStep == 823 then
   triggerEvent('Jumpscare', '0.95', '0.8');
end
if curStep == 984 then
   triggerEvent('Jumpscare', '0.95', '0.7');
end
if curStep == 1024 then
    setProperty('defaultCamZoom', 0.6);
end
if curStep == 1336 then
   triggerEvent('Jumpscare', '0.95', '0.7');
end
if curStep == 1536 then
   triggerEvent('Jumpscare', '0.95', '0.8');
end
end

function onUpdate(elapsed)
for i = 0,3 do
	setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
  end
end

function onBeatHit()
if curBeat >= 65 and curBeat < 192 or curBeat >= 257 and curBeat < 384 then
   if curBeat % 2 == 0 then
       triggerEvent('Add Camera Zoom', '0.15', '0.07');
     end
   end
end
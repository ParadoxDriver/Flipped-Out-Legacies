local defaultNotePos = {};
local spin = false;
local arrowMoveX = 25;
local arrowMoveY = -14;
 
function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
end

function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor', 'songPosition');
    currentBeat = (songPos / 1000) * (bpm / 280)
    if spin == true then 
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + arrowMoveX * math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*0.25) * math.pi))
        end
    end
       if curStep == 255 then
		spin = true
	end
       if curStep == 1536 then
		arrowMoveX = 40;
	end
      if curStep == 1792 then
		arrowMoveX = 25;
       end
end

function onCreate()
       makeLuaSprite('Start', '', 0, 0);
       makeGraphic('Start',1280,720,'000000');
       setObjectCamera('Start', 'other');
       setProperty('Start.alpha', 1);
       addLuaSprite('Start', true);

if hideHud == false then
       makeAnimatedLuaSprite('fireHB', 'HealthBar-Skins/healthBarBurn',  0, 0);
       luaSpriteAddAnimationByPrefix('fireHB', 'idle', 'healthbar', 24, false);
       objectPlayAnimation('fireHB', 'idle');
       setObjectCamera('fireHB', 'hud');
       addLuaSprite('fireHB', true);
end
       makeLuaText('engineText', "Remake Vocals By Silly_Nex", 0, 2, 700);
       setTextAlignment('engineText', 'left');
       setTextSize('engineText', 17);
       setTextBorder('engineText', 1, '000000');
       setObjectCamera('engineText', 'hud');
       setTextColor('engineText', 'E80A0A');
       addLuaText('engineText');

       setProperty('skipCountdown', true)
end

function onCreatePost()
       setProperty('fireHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));
       setProperty('fireHB.x', getProperty('healthBar.x') - 10);
       setProperty('fireHB.y', getProperty('healthBar.y') - 61);
       setProperty('fireHB.scale.x', getProperty('healthBar.scale.x') - 0.01);
       setProperty('fireHB.scale.y', getProperty('healthBar.scale.y'));
       setObjectOrder('fireHB', 4);
end

function onBeatHit()
if curBeat % 1 == 0 then
       objectPlayAnimation('fireHB', 'idle', true);
   end
end

function onCountdownTick(counter)
if counter % 2 == 0 then
       objectPlayAnimation('fireHB', 'idle');
   end
end

function onCountdownStarted()
       setObjectCamera('topBar', 'other');
       setObjectCamera('bottomBar', 'other');
       doTweenZoom('zoom', 'camGame', 0.7, 0.01, 'circInOut');
       setProperty('defaultCamZoom', 0.7);
       doTweenAlpha('graphicAlpha', 'Start', 0, 30, 'quintOut');
       setProperty('camHUD.visible', false);
end

function onStepHit()
if curStep >= 1 and curStep < 513 or curStep >= 529 and curStep < 1260 or curStep >= 1280 and curStep < 1792 or curStep >= 1808 and curStep < 2417 then
       cameraShake('camGame', 0.0008, 0.4)
       cameraShake('camHUD', 0.0008, 0.4)
end
if curStep == 256 then
       setProperty('defaultCamZoom', 0.63);
       setObjectCamera('topBar', 'hud');
       setObjectCamera('bottomBar', 'hud');
       setProperty('camHUD.visible', true);
end
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.017 then
        setProperty('health', health- 0.017);
    end
end
function onCreate()
if hideHud == false then
       makeAnimatedLuaSprite('fireHB', 'HealthBar-Skins/healthBarBurn',  0, 0);
       luaSpriteAddAnimationByPrefix('fireHB', 'idle', 'healthbar', 24, false);
       objectPlayAnimation('fireHB', 'idle');
       setObjectCamera('fireHB', 'hud');
       addLuaSprite('fireHB', true);
end
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
      setProperty('fireHB.visible', false);
end

function onStepHit()
if curStep == 1280 then
      setProperty('fireHB.visible', true);
end
if curStep == 2176 then
      setProperty('fireHB.visible', false);
end
if curStep == 2713 then
      setProperty('fireHB.visible', true);
end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 512 and getProperty('health') > 0.022 then
		setProperty('health', getProperty('health') - 0.022);
	end
end			
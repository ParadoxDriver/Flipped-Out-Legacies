function onCreate()
        precacheImage('Effects/Red_Pulse');
        makeAnimatedLuaSprite('thered', 'Effects/Red_Pulse', 0, 0);
	addAnimationByPrefix('thered', 'idle', 'Red Pulsing', 16, false);
	setGraphicSize('thered', 1280, 720);
	setProperty('thered.alpha', '0');
        objectPlayAnimation('thered', 'idle');
	setObjectCamera('thered', 'hud');
        addLuaSprite('thered', true);

if lowQuality then
        precacheImage('Flippy/Autopsy-Turvy/Red_Pulse');
        makeAnimatedLuaSprite('thered', 'Flippy/Autopsy-Turvy/Red_Pulse', 0, 0);
	setGraphicSize('thered', 1280, 720);
	setProperty('thered.alpha', '0');
	setObjectCamera('thered', 'hud');
        addLuaSprite('thered', true)
end
end

function onCreatePost()
       setObjectOrder('thered', true);
end

function onBeatHit()
	objectPlayAnimation('thered', 'idle', true);
end

function onEvent(name,value1,value2)
	if name == 'Red Stuff' then
            doTweenAlpha('redalpha', 'thered', tonumber(value1), tonumber(value2), 'linear');
		--debugPrint('Event triggered: ', name, duration, targetAlpha);
	end
end
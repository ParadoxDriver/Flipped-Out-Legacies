function onCreate()
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
       makeLuaSprite('topBar', empty, 0, 0);
       makeGraphic('topBar', 1280, 85, '000000');
       setObjectCamera('topBar', 'hud');

       makeLuaSprite('bottomBar', empty, 0, 625);
       makeGraphic('bottomBar', 1280, 120, '000000');
       setObjectCamera('bottomBar', 'hud');
end

if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
       makeLuaSprite('topBar', empty, 0, -40);
       makeGraphic('topBar', 1280, 150, '000000');
       setObjectCamera('topBar', 'hud');

       makeLuaSprite('bottomBar', empty, 0, 615);
       makeGraphic('bottomBar', 1280, 150, '000000');
       setObjectCamera('bottomBar', 'hud');
end
end

function onCreatePost()
if songName == 'Slaughter' or songName == 'Assault' or songName == 'Extinction' or songName == 'FlashBack' or songName == 'Shell-Shanked' or songName == 'LSD' or songName == 'Playdate' or songName == 'Nightmares' or songName == 'Crucify' or songName == 'In-The-End' or songName == 'Incident' or songName == 'Funny' then
       addLuaSprite('topBar', false);
       addLuaSprite('bottomBar', false);
       setObjectOrder('topBar', true);
       setObjectOrder('bottomBar', true);
end
end

function onGameOver()
       removeLuaSprite('topBar');
       removeLuaSprite('bottomBar');
end
function onCreate()--codigo hecho por paradox
if hideHud == false then
     makeLuaSprite('funnicube','',0,677);
     makeGraphic('funnicube',1280,22,'000000');
     setObjectCamera('funnicube','hud');
     setProperty('funnicube.alpha', 0.5);
     addLuaSprite('funnicube',false);
end
end

function onCreatePost()
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then

     setProperty('funnicube.y', 677);
end

if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

     setProperty('funnicube.y', 116);
end
end
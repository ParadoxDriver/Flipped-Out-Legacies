function onCreate()
if hideHud == false then
     makeLuaText('healthText', 'Health: ' .. math.floor(getProperty("health") * 50) .. '%', 270, screenWidth / 2 - 300 / 2, screenHeight / 2 - -316 / 1.5)
     setTextSize('healthText', 20);
     setObjectCamera('healthText', 'hud');
     addLuaText('healthText')
end
end

function onCreatePost()
if downscroll and not botPlay then

     setProperty('healthText.y', 610);
end

if downscroll and week == 'guerrilla week' or week == 'additional guerrilla week' or songName == 'Eye-to-Eye' then

     setProperty('healthText.y', 15);
end

if not downscroll and week == 'guerrilla week' or week == 'additional guerrilla week' or songName == 'Eye-to-Eye' then

     setProperty('healthText.y', 575);
end

if downscroll and middlescroll then

     setProperty('healthText.y', 10);
end
end

function onUpdate(elapsed)
if songName == 'Suicide-Out' then
     setTextString('healthText', 'Energy: ' .. math.floor(getProperty("health") * 50) .. '%')
else if songName == 'Unknown-Suffering' then
     setTextString('healthText', 'Sanity: ' .. math.floor(getProperty("health") * 50) .. '%')
else
     -- start of "update", some variables weren't updated yet
     setTextString('healthText', 'Health: ' .. math.floor(getProperty("health") * 50) .. '%')
end
end
end
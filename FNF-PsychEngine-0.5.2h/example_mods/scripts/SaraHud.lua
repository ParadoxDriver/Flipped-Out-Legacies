function onCreate()
if hideHud == false then
       makeLuaText('songWM', '', 1250, 0, 600);
       setObjectCamera('songWM', 'hud');
       setTextString('songWM',' - ' .. songName .. ' ['..difficultyName..'] - ')
       setTextSize('songWM', 22);
       addLuaText('songWM');
end
end

function onCreatePost()
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then

       setProperty('songWM.y', 600);--WTF
end

if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

       setProperty('songWM.y', 40);
end
end
       
function onUpdatePost()
       setProperty('iconP1.x', screenWidth - 430);
       setProperty('iconP2.x', 285);
end       
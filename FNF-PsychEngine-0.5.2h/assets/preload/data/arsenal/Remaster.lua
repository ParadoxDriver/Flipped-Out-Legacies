function onCreate()
    makeLuaSprite('Start', '', 0, 0);
    makeGraphic('Start',1280,720,'000000');
    setObjectCamera('Start', 'other');
    setProperty('Start.alpha', 1);
    addLuaSprite('Start', true);

    makeLuaText('engineText', "Remake By Venesio", 0, 2, 700);
    setTextAlignment('engineText', 'left');
    setTextSize('engineText', 17);
    setTextBorder('engineText', 1, '000000');
    setObjectCamera('engineText', 'hud');
    setTextColor('engineText', 'E80A0A');
    addLuaText('engineText');
end

function onSongStart()
     doTweenAlpha('graphicAlpha', 'Start', 0, 2, 'quintOut');
end
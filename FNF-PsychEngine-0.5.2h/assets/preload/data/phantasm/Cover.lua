function onCreate()
    makeLuaText('engineText', "Cover By V.Nitro", 0, 2, 700);
    setTextAlignment('engineText', 'left');
    setTextSize('engineText', 17);
    setTextBorder('engineText', 1, '000000');
    setObjectCamera('engineText', 'hud');
    addLuaText('engineText');
end
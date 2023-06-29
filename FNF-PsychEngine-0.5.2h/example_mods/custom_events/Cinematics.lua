function onCreatePost()
	makeLuaSprite('bartop', nil, 0, 0);
        makeGraphic('bartop', screenWidth, 350, '000000');
        setObjectCamera('bartop', 'hud');
        addLuaSprite('bartop', false);

	makeLuaSprite('barbot', nil, 0, 0);
	makeGraphic('barbot', screenWidth, 350, '000000');
        setObjectCamera('barbot', 'hud');
	addLuaSprite('barbot', false);
	
	setProperty('bartop.y', 720);
	setProperty('barbot.y', -350);

        setObjectOrder('bartop',2);
        setObjectOrder('barbot',2);
end

function onEvent(name, value1, value2)
	if name == "Cinematics" then
		whatsup = tonumber(value1)
		Speed = tonumber(value2)
		if whatsup == 1 then
			doTweenY('Cinematics1', 'bartop', 600, Speed, 'QuadOut');
			doTweenY('Cinematics2', 'barbot', -230, Speed, 'QuadOut');
                end

                if downscroll and whatsup == 1 then
                        doTweenY('Cinematics1', 'bartop', 595, Speed, 'QuadOut');
			doTweenY('Cinematics2', 'barbot', -212, Speed, 'QuadOut');
                end

		if whatsup == 2 then
			doTweenY('Cinematics1', 'bartop',  720, Speed, 'QuadIn');
			doTweenY('Cinematics2', 'barbot', -350, Speed, 'QuadIn');
		end
	end
end
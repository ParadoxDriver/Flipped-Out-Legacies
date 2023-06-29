function onCreate()--codigo hecho por paradox
        makeLuaSprite('underlay', 'judge-underlay', -230, 0);
        setObjectCamera('underlay', 'hud');
        setProperty('underlay.scale.x', 0.35);
	setProperty('underlay.scale.y', 0.30);
        setProperty('underlay.alpha', '0.75');
        setPropertyLuaSprite('underlay', 'flipX', true);
        addLuaSprite('underlay', true);

        makeLuaText('ComboText', 'Combos: ' .. getProperty('combo'), 200, 15, 325);
        setTextAlignment('ComboText', 'left');
        setTextSize('ComboText', 20);
        setObjectCamera('ComboText', 'hud');
        setTextFont('ComboText', "vcr.ttf");
        setTextBorder('ComboText', 2, '000000');
        setProperty('ComboText.alpha', '1');
        addLuaText('ComboText');

	makeLuaText('SicksText', 'Sicks: ' .. getProperty('sicks'), 200, 15, 350);
        setTextAlignment('SicksText', 'left');
        setTextSize('SicksText', 20);
        setObjectCamera('SicksText', 'hud');
        setTextFont('SicksText', "vcr.ttf");
        setTextBorder('SicksText', 2, '000000');
        setProperty('SicksText.alpha', '1');
        addLuaText('SicksText');

	makeLuaText('GoodsText', 'Goods: ' .. getProperty('goods'), 200, 15, 375);
        setTextAlignment('GoodsText', 'left');
        setTextSize('GoodsText', 20);
        setObjectCamera('GoodsText', 'hud');
        setTextFont('GoodsText', "vcr.ttf");
        setTextBorder('GoodsText', 2, '000000');
        setProperty('GoodsText.alpha', '1');
        addLuaText('GoodsText');

	makeLuaText('BadsText', 'Bads: ' .. getProperty('bads'), 200, 15, 400);
        setTextSize('BadsText', 20);
        setTextAlignment('BadsText', 'left');
        setObjectCamera('BadsText', 'hud');
        setTextFont('BadsText', "vcr.ttf");
        setTextBorder('BadsText', 2, '000000');
        setProperty('BadsText.alpha', '1'); 
        addLuaText('BadsText');

	makeLuaText('ShitsText', 'Shits: ' .. getProperty('shits'), 200, 15, 425);
	setTextSize('ShitsText', 20);
	setTextAlignment('ShitsText', 'left');
        setObjectCamera('ShitsText', 'hud');
        setTextFont('ShitsText', "vcr.ttf");
        setTextBorder('ShitsText', 2, '000000');
        setProperty('ShitsText.alpha', '1');
	addLuaText('ShitsText');

        makeLuaText('MissText', 'Misses: ' .. getProperty('songMisses'), 200, 15, 448);
	setTextSize('MissText', 20);
	setTextAlignment('MissText', 'left');
        setObjectCamera('MissText', 'hud');
        setTextFont('MissText', "vcr.ttf");
        setTextBorder('MissText', 2, '000000');
        setProperty('MissText.alpha', '1');
	addLuaText('MissText');
end

function onUpdate(elapsed)
        setTextString('ComboText', 'Combos: ' .. getProperty('combo'))
	setTextString('SicksText', 'Sicks: ' .. getProperty('sicks'));
	setTextString('GoodsText', 'Goods: ' .. getProperty('goods'));
	setTextString('BadsText', 'Bads: ' .. getProperty('bads'));
	setTextString('ShitsText', 'Shits: ' .. getProperty('shits'));
        setTextString('MissText', 'Misses: ' .. getProperty('songMisses'))
end
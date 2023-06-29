function onCreatePost()--Hecho por Nickobelit Modificado por Paradox
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
    setProperty('scoreTxt.visible', false)
    setProperty('funnicube.visible', false);
    setProperty('underlay.visible', false);
    setProperty('ComboText.visible', false);
    setProperty('SicksText.visible', false);
    setProperty('GoodsText.visible', false);
    setProperty('BadsText.visible', false);
    setProperty('ShitsText.visible', false);
    setProperty('MissText.visible', false);
    setProperty('ratings.x', 990);
    
    scaleObject('timeTxt', 0.65, 0.65);
    scaleObject('timeBarBG', 3.15, 1);
    scaleObject('timeBar', 3.15, 1);
    setProperty('timeBar.x', getProperty('timeBar.x') - 422);
    setProperty('timeBar.y', getProperty('timeBar.y') + 670);
    setProperty('timeBarBG.x', getProperty('timeBarBG.x') - 421);
    setProperty('timeBarBG.y', getProperty('timeBarBG.y') + 672);
    
    setProperty('timeTxt.x', getProperty('timeTxt.x') - 10);
    setProperty('timeTxt.y', getProperty('timeTxt.y') + 676);
    setTextFont('timeTxt','Disney.ttf');
    setTextAlignment('timeTxt', 'Center'); 
    setTextBorder('timeTxt',3,'000000');
    setTextSize('timeTxt', 20);
    scaleObject('timeTxt', 1, 1);

    setObjectCamera('timeTxt', 'hud');    
    setObjectCamera('timeBar', 'hud');
    setObjectCamera('timeBarBG', 'hud');

    makeLuaText('Score','', 0, 23, 600);
    setTextAlignment('Score', 'Left'); 
    setTextFont('Score','Disney.ttf');
    scaleObject('Score', 1.35, 1.35);
    setTextSize('Score', 22);
    addLuaText('Score');
    setObjectCamera('Score', 'hud');
    setTextBorder('Score',3,'000000');

    makeLuaText('Misses','', 0, 23, 630);
    setTextAlignment('Misses', 'Left');
    setTextFont('Misses','Disney.ttf');
    scaleObject('Misses', 1.35, 1.35);
    setTextSize('Misses', 22);
    addLuaText('Misses');
    setObjectCamera('Misses', 'hud');
    setTextBorder('Misses',3,'000000');

    makeLuaText('Accuracy','', 0, 23, 660);
    setTextAlignment('Accuracy', 'Left'); 
    setTextFont('Accuracy','Disney.ttf');
    scaleObject('Accuracy', 1.35, 1.35);
    setTextSize('Accuracy', 22);
    addLuaText('Accuracy');
    setObjectCamera('Accuracy', 'hud');
    setTextBorder('Accuracy',3,'000000');

    makeLuaText('Sick', 'Sick: ' .. getProperty('sicks'), 390, 1150, 570);
    setTextFont('Sick','Disney.ttf');
    scaleObject('Sick', 1.35, 1.35);
    setTextSize('Sick', 22);
    setObjectCamera('Sick', 'hud');
    setTextBorder('Sick',3,'000000');
    setTextAlignment('Sick', 'Left'); 

    makeLuaText('Good', 'Good: ' .. getProperty('goods'), 390, 1150, 600);
    setTextFont('Good','Disney.ttf');
    scaleObject('Good', 1.35, 1.35);
    setTextSize('Good', 22);
    setObjectCamera('Good', 'hud');
    setTextBorder('Good',3,'000000');
    setTextAlignment('Good', 'Left');
    
    makeLuaText('Bad', 'Bad: ' .. getProperty('bads'), 390, 1150, 630);
    setTextFont('Bad','Disney.ttf');
    scaleObject('Bad', 1.35, 1.35);
    setTextSize('Bad', 22);
    setObjectCamera('Bad', 'hud');
    setTextBorder('Bad',3,'000000');
    setTextAlignment('Bad', 'Left'); 

    makeLuaText('Shit', 'Shit: ' .. getProperty('shits'), 390, 1150, 660);
    setTextFont('Shit','Disney.ttf');
    scaleObject('Shit', 1.35, 1.35);
    setTextSize('Shit', 22);
    setObjectCamera('Shit', 'hud');
    setTextBorder('Shit',3,'000000');
    setTextAlignment('Shit', 'Left'); 
    
    addLuaText('Sick');
    addLuaText('Good');
    addLuaText('Bad');
    addLuaText('Shit');
end
 
if getPropertyFromClass('ClientPrefs', 'downScroll') == true then    
    setProperty('scoreTxt.visible', false)
    setProperty('funnicube.visible', false);
    setProperty('underlay.visible', false);
    setProperty('ComboText.visible', false);
    setProperty('SicksText.visible', false);
    setProperty('GoodsText.visible', false);
    setProperty('BadsText.visible', false);
    setProperty('ShitsText.visible', false);
    setProperty('MissText.visible', false);
    setProperty('ratings.x', 990);
    setProperty('ratings.y', -10);

    scaleObject('timeBarBG', 3.15, 1);
    scaleObject('timeBar', 3.15, 1);
    setProperty('timeBar.x', getProperty('timeBar.x') - 421);
    setProperty('timeBarBG.x', getProperty('timeBarBG.x') - 421);
    setProperty('timeBar.y', getProperty('timeBar.y') - 675);
    setProperty('timeBarBG.y', getProperty('timeBarBG.y') - 675);
    setObjectCamera('timeBar', 'hud');--Detalles pa ,Detalles
    setObjectCamera('timeBarBG', 'hud');

    setProperty('timeTxt.x', getProperty('timeTxt.x') - 10);
    setProperty('timeTxt.y', getProperty('timeTxt.y') - 670);
    setTextFont('timeTxt','Disney.ttf');
    setTextAlignment('timeTxt', 'Center'); 
    setTextBorder('timeTxt',3,'000000');
    setTextSize('timeTxt', 20);
    scaleObject('timeTxt', 1, 1);

    makeLuaText('Score','', 0, 23, 40);
    setTextAlignment('Score', 'Left');
    setTextFont('Score','Disney.ttf');
    scaleObject('Score', 1.35, 1.35);
    setTextSize('Score', 22)
    addLuaText('Score');
    setObjectCamera('Score', 'hud');
    setTextBorder('Score',3,'000000');

    makeLuaText('Misses','', 0, 23, 65);
    setTextAlignment('Misses', 'Left'); 
    setTextFont('Misses','Disney.ttf');
    scaleObject('Misses', 1.35, 1.35);
    setTextSize('Misses', 22);
    addLuaText('Misses');
    setObjectCamera('Misses', 'hud');
    setTextBorder('Misses',3,'000000');

    makeLuaText('Accuracy','', 0, 23, 90);
    setTextAlignment('Accuracy', 'Left');
    setTextFont('Accuracy','Disney.ttf');
    scaleObject('Accuracy', 1.35, 1.35);
    setTextSize('Accuracy', 22);
    addLuaText('Accuracy');
    setObjectCamera('Accuracy', 'hud');
    setTextBorder('Accuracy',3,'000000');

    makeLuaText('Sick', 'Sick: ' .. getProperty('sicks'), 390, 1150, 40);
    setTextFont('Sick','Disney.ttf');
    scaleObject('Sick', 1.35, 1.35);
    setTextSize('Sick', 22);
    setObjectCamera('Sick', 'hud');
    setTextBorder('Sick',3,'000000');
    setTextAlignment('Sick', 'Left');
     
    makeLuaText('Good', 'Good: ' .. getProperty('goods'), 390, 1150, 65);
    setTextFont('Good','Disney.ttf');
    scaleObject('Good', 1.35, 1.35);
    setTextSize('Good', 22);
    setObjectCamera('Good', 'hud');
    setTextBorder('Good',3,'000000');
    setTextAlignment('Good', 'Left'); 
    
    makeLuaText('Bad', 'Bad: ' .. getProperty('bads'), 390, 1150, 90);
    setTextFont('Bad','Disney.ttf');
    scaleObject('Bad', 1.35, 1.35);
    setTextSize('Bad', 22);
    setObjectCamera('Bad', 'hud');
    setTextBorder('Bad',3,'000000');
    setTextAlignment('Bad', 'Left');

    makeLuaText('Shit', 'Shit: ' .. getProperty('shits'), 390, 1150, 115);
    setTextFont('Shit','Disney.ttf');
    scaleObject('Shit', 1.35, 1.35);
    setTextSize('Shit', 22);
    setObjectCamera('Shit', 'hud');
    setTextBorder('Shit',3,'000000');
    setTextAlignment('Shit', 'Left');

    
    addLuaText('Sick');
    addLuaText('Good');
    addLuaText('Bad');
    addLuaText('Shit');
end
end

function onRecalculateRating()
   setTextString('Sick', 'Sick: ' .. getProperty('sicks'));
   setTextString('Good', 'Good: ' .. getProperty('goods'));
   setTextString('Bad', 'Bad: ' .. getProperty('bads'));
   setTextString('Shit', 'Shit: ' .. getProperty('shits'));
end

function roundDecimal(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0);
    return math.floor(num * mult) / mult;
end

function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)

    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end

function onUpdate()
    setTextString('Score', 'Score: '..score..'')
    setTextString('Misses', 'Misses: '..misses..'')
    setTextString('Accuracy', 'Accuracy: '..math.floor(rating * 100)..'%')
end

function onUpdatePost(elapsed)
setPropertyFromClass('ClientPrefs', 'timeBarType', 'Time Elapsed')
    setTextString('timeTxt', formatTime(getSongPosition() - noteOffset) .. ' - ' .. formatTime(songLength))
end
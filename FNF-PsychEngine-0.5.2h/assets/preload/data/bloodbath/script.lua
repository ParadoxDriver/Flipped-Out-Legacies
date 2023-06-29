function onCreate()
      makeLuaText('engineText', "Remix By Midsanity", 0, 2, 700);--no tengo ni idea de quien esta persona ni mucho menos si cuenta con alguna red social para añadirlo a la seccion de creditos
      setTextAlignment('engineText', 'left');
      setTextSize('engineText', 17);
      setTextBorder('engineText', 1, '000000');
      setObjectCamera('engineText', 'hud');
      setTextColor('engineText', 'E80A0A');
      addLuaText('engineText');

      makeLuaSprite('shadow', 'vinetca', -640, -300);
      setObjectCamera('shadow', 'hud'); 
      setProperty('shadow.scale.x', 0.5);
      setProperty('shadow.scale.y', 0.6);
      setProperty('shadow.alpha', 0);
      addLuaSprite('shadow', false);

      setObjectOrder('shadow', 1);
end
function onStepHit()
if curStep == 1 then
   --setPropertyFromClass('ClientPrefs', 'camZooms', false)
end

if curStep == 779 then
    doTweenColor('skyRed', 'sky', 'FF0000', 0.3);
    doTweenColor('backTreesRed', 'backTrees', 'FF0000', 0.3);
    doTweenColor('treesRed', 'trees', 'FF0000', 0.3);
    doTweenColor('groundRed', 'ground', 'FF0000', 0.3);
    doTweenColor('boxRed', 'boombox', 'FF0000', 0.3);
    doTweenColor('flakyAzul', 'Flaky', 'FF0000', 0.3);
    doTweenColor('speakerRed', 'speaker', 'FF0000', 0.3);
    doTweenColor('campfireRed', 'campfire', 'FF0000', 0.3);
    doTweenColor('tableRed', 'table', 'FF0000', 0.3);

    doTweenColor('healthBar', 'healthBar', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FF0000', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FF0000', 0.3);

    doTweenColor('dadRed', 'dad', 'FF0000', 0.3);
    doTweenColor('bfRed', 'boyfriend', 'FF0000', 0.3);
end

if curStep == 794 then
    doTweenColor('skyRed', 'sky', 'FFFFFF', 0.3);
    doTweenColor('backTreesRed', 'backTrees', 'FFFFFF', 0.3);
    doTweenColor('treesRed', 'trees', 'FFFFFF', 0.3);
    doTweenColor('groundRed', 'ground', 'FFFFFF', 0.3);
    doTweenColor('boxRed', 'boombox', 'FFFFFF', 0.3);
    doTweenColor('flakyAzul', 'Flaky', 'FFFFFF', 0.3);
    doTweenColor('speakerRed', 'speaker', 'FFFFFF', 0.3);
    doTweenColor('campfireRed', 'campfire', 'FFFFFF', 0.3);
    doTweenColor('tableRed', 'table', 'FFFFFF', 0.3);

    doTweenColor('healthBar', 'healthBar', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FFFFFF', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FFFFFF', 0.3);

    doTweenColor('dadRed', 'dad', 'FFFFFF', 0.3);
    doTweenColor('bfRed', 'boyfriend', 'FFFFFF', 0.3);
end

if curStep == 840 then
    doTweenColor('skyRed', 'sky', 'FF0000', 0.3);
    doTweenColor('backTreesRed', 'backTrees', 'FF0000', 0.3);
    doTweenColor('treesRed', 'trees', 'FF0000', 0.3);
    doTweenColor('groundRed', 'ground', 'FF0000', 0.3);
    doTweenColor('boxRed', 'boombox', 'FF0000', 0.3);
    doTweenColor('flakyAzul', 'Flaky', 'FF0000', 0.3);
    doTweenColor('speakerRed', 'speaker', 'FF0000', 0.3);
    doTweenColor('campfireRed', 'campfire', 'FF0000', 0.3);
    doTweenColor('tableRed', 'table', 'FF0000', 0.3);

    doTweenColor('healthBar', 'healthBar', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FF0000', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FF0000', 0.3);

    doTweenColor('dadRed', 'dad', 'FF0000', 0.3);
    doTweenColor('bfRed', 'boyfriend', 'FF0000', 0.3);
end

if curStep == 855 then
    doTweenColor('skyRed', 'sky', 'FFFFFF', 0.3);
    doTweenColor('backTreesRed', 'backTrees', 'FFFFFF', 0.3);
    doTweenColor('treesRed', 'trees', 'FFFFFF', 0.3);
    doTweenColor('groundRed', 'ground', 'FFFFFF', 0.3);
    doTweenColor('boxRed', 'boombox', 'FFFFFF', 0.3);
    doTweenColor('flakyAzul', 'Flaky', 'FFFFFF', 0.3);
    doTweenColor('speakerRed', 'speaker', 'FFFFFF', 0.3);
    doTweenColor('campfireRed', 'campfire', 'FFFFFF', 0.3);
    doTweenColor('tableRed', 'table', 'FFFFFF', 0.3);

    doTweenColor('healthBar', 'healthBar', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FFFFFF', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FFFFFF', 0.3);

    doTweenColor('dadRed', 'dad', 'FFFFFF', 0.3);
    doTweenColor('bfRed', 'boyfriend', 'FFFFFF', 0.3);
end

if curStep == 977 then
    setProperty('defaultCamZoom', 0.85);
end

if curStep == 1100 then
    setProperty('defaultCamZoom', 0.65);
end

if curStep == 1467 then
    doTweenAlpha('shadowAlpha', 'shadow', 0.8, 1.2, 'quintOut');
    setProperty('defaultCamZoom', 0.85);
end

if curStep == 1496 then
    doTweenColor('skyRed', 'sky', 'FF0000', 0.3);
    doTweenColor('backTreesRed', 'backTrees', 'FF0000', 0.3);
    doTweenColor('treesRed', 'trees', 'FF0000', 0.3);
    doTweenColor('groundRed', 'ground', 'FF0000', 0.3);
    doTweenColor('boxRed', 'boombox', 'FF0000', 0.3);
    doTweenColor('flakyAzul', 'Flaky', 'FF0000', 0.3);
    doTweenColor('speakerRed', 'speaker', 'FF0000', 0.3);
    doTweenColor('campfireRed', 'campfire', 'FF0000', 0.3);
    doTweenColor('tableRed', 'table', 'FF0000', 0.3);

    doTweenColor('healthBar', 'healthBar', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FF0000', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FF0000', 0.3);

    doTweenColor('dadRed', 'dad', 'FF0000', 0.3);
    doTweenColor('bfRed', 'boyfriend', 'FF0000', 0.3);
end

if curStep == 1504 then
    doTweenColor('skyRed', 'sky', 'FFFFFF', 0.3);
    doTweenColor('backTreesRed', 'backTrees', 'FFFFFF', 0.3);
    doTweenColor('treesRed', 'trees', 'FFFFFF', 0.3);
    doTweenColor('groundRed', 'ground', 'FFFFFF', 0.3);
    doTweenColor('boxRed', 'boombox', 'FFFFFF', 0.3);
    doTweenColor('flakyAzul', 'Flaky', 'FFFFFF', 0.3);
    doTweenColor('speakerRed', 'speaker', 'FFFFFF', 0.3);
    doTweenColor('campfireRed', 'campfire', 'FFFFFF', 0.3);
    doTweenColor('tableRed', 'table', 'FFFFFF', 0.3);

    doTweenColor('healthBar', 'healthBar', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FFFFFF', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FFFFFF', 0.3);
 
    doTweenColor('dadRed', 'dad', 'FFFFFF', 0.3);
    doTweenColor('bfRed', 'boyfriend', 'FFFFFF', 0.3);
end

if curStep == 1574 then
    doTweenColor('skyRed', 'sky', 'FF0000', 0.3);
    doTweenColor('backTreesRed', 'backTrees', 'FF0000', 0.3);
    doTweenColor('treesRed', 'trees', 'FF0000', 0.3);
    doTweenColor('groundRed', 'ground', 'FF0000', 0.3);
    doTweenColor('boxRed', 'boombox', 'FF0000', 0.3);
    doTweenColor('flakyAzul', 'Flaky', 'FF0000', 0.3);
    doTweenColor('speakerRed', 'speaker', 'FF0000', 0.3);
    doTweenColor('campfireRed', 'campfire', 'FF0000', 0.3);
    doTweenColor('tableRed', 'table', 'FF0000', 0.3);

    doTweenColor('healthBar', 'healthBar', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FF0000', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FF0000', 0.3);

    doTweenColor('dadRed', 'dad', 'FF0000', 0.3);
    doTweenColor('bfRed', 'boyfriend', 'FF0000', 0.3);
end

if curStep == 1588 then
    doTweenColor('skyRed', 'sky', 'FFFFFF', 0.3);
    doTweenColor('backTreesRed', 'backTrees', 'FFFFFF', 0.3);
    doTweenColor('treesRed', 'trees', 'FFFFFF', 0.3);
    doTweenColor('groundRed', 'ground', 'FFFFFF', 0.3);
    doTweenColor('boxRed', 'boombox', 'FFFFFF', 0.3);
    doTweenColor('flakyAzul', 'Flaky', 'FFFFFF', 0.3);
    doTweenColor('speakerRed', 'speaker', 'FFFFFF', 0.3);
    doTweenColor('campfireRed', 'campfire', 'FFFFFF', 0.3);
    doTweenColor('tableRed', 'table', 'FFFFFF', 0.3);

    doTweenColor('healthBar', 'healthBar', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FFFFFF', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FFFFFF', 0.3);

    doTweenColor('dadRed', 'dad', 'FFFFFF', 0.3);
    doTweenColor('bfRed', 'boyfriend', 'FFFFFF', 0.3);
end

if curStep == 1589 then
    setProperty('defaultCamZoom', 0.65);
end

if curStep == 1634 then
    doTweenColor('skyRed', 'sky', 'FF0000', 0.3);
    doTweenColor('backTreesRed', 'backTrees', 'FF0000', 0.3);
    doTweenColor('treesRed', 'trees', 'FF0000', 0.3);
    doTweenColor('groundRed', 'ground', 'FF0000', 0.3);
    doTweenColor('boxRed', 'boombox', 'FF0000', 0.3);
    doTweenColor('flakyAzul', 'Flaky', 'FF0000', 0.3);
    doTweenColor('speakerRed', 'speaker', 'FF0000', 0.3);
    doTweenColor('campfireRed', 'campfire', 'FF0000', 0.3);
    doTweenColor('tableRed', 'table', 'FF0000', 0.3);

    doTweenColor('healthBar', 'healthBar', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FF0000', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FF0000', 0.3);

    doTweenColor('dadRed', 'dad', 'FF0000', 0.3);
    doTweenColor('bfRed', 'boyfriend', 'FF0000', 0.3);
end

if curStep == 1649 then
    doTweenColor('skyRed', 'sky', 'FFFFFF', 0.3);
    doTweenColor('backTreesRed', 'backTrees', 'FFFFFF', 0.3);
    doTweenColor('treesRed', 'trees', 'FFFFFF', 0.3);
    doTweenColor('groundRed', 'ground', 'FFFFFF', 0.3);
    doTweenColor('boxRed', 'boombox', 'FFFFFF', 0.3);
    doTweenColor('flakyAzul', 'Flaky', 'FFFFFF', 0.3);
    doTweenColor('speakerRed', 'speaker', 'FFFFFF', 0.3);
    doTweenColor('campfireRed', 'campfire', 'FFFFFF', 0.3);
    doTweenColor('tableRed', 'table', 'FFFFFF', 0.3);

    doTweenColor('healthBar', 'healthBar', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FFFFFF', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FFFFFF', 0.3);

    doTweenColor('dadRed', 'dad', 'FFFFFF', 0.3);
    doTweenColor('bfRed', 'boyfriend', 'FFFFFF', 0.3);
end

if curStep == 1696 then
    doTweenColor('skyRed', 'sky', 'FF0000', 0.3);
    doTweenColor('backTreesRed', 'backTrees', 'FF0000', 0.3);
    doTweenColor('treesRed', 'trees', 'FF0000', 0.3);
    doTweenColor('groundRed', 'ground', 'FF0000', 0.3);
    doTweenColor('boxRed', 'boombox', 'FF0000', 0.3);
    doTweenColor('flakyAzul', 'Flaky', 'FF0000', 0.3);
    doTweenColor('speakerRed', 'speaker', 'FF0000', 0.3);
    doTweenColor('campfireRed', 'campfire', 'FF0000', 0.3);
    doTweenColor('tableRed', 'table', 'FF0000', 0.3);

    doTweenColor('healthBar', 'healthBar', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FF0000', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FF0000', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FF0000', 0.3);

    doTweenColor('dadRed', 'dad', 'FF0000', 0.3);
    doTweenColor('bfRed', 'boyfriend', 'FF0000', 0.3);
end

if curStep == 1711 then
    doTweenAlpha('shadowAlpha', 'shadow', 0, 1.2, 'quintOut');

    doTweenColor('skyRed', 'sky', 'FFFFFF', 0.3);
    doTweenColor('backTreesRed', 'backTrees', 'FFFFFF', 0.3);
    doTweenColor('treesRed', 'trees', 'FFFFFF', 0.3);
    doTweenColor('groundRed', 'ground', 'FFFFFF', 0.3);
    doTweenColor('boxRed', 'boombox', 'FFFFFF', 0.3);
    doTweenColor('flakyAzul', 'Flaky', 'FFFFFF', 0.3);
    doTweenColor('speakerRed', 'speaker', 'FFFFFF', 0.3);
    doTweenColor('campfireRed', 'campfire', 'FFFFFF', 0.3);
    doTweenColor('tableRed', 'table', 'FFFFFF', 0.3);

    doTweenColor('healthBar', 'healthBar', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP1', 'iconP1', 'FFFFFF', 0.3, 'linear');
    doTweenColor('iconP2',  'iconP2', 'FFFFFF', 0.3, 'linear');
    doTweenColor('ratings',  'ratings', 'FFFFFF', 0.3);

    doTweenColor('dadRed', 'dad', 'FFFFFF', 0.3);
    doTweenColor('bfRed', 'boyfriend', 'FFFFFF', 0.3);
end

if curStep == 2506 then
    setProperty('camHUD.visible', false);
    setProperty('camGame.visible', false);
end
end

function opponentNoteHit()
 health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end
end
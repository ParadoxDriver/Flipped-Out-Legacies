local defaultNotePos = {};
local spin = true;
local arrowMoveX = 7;
local arrowMoveY = 4;

function onCreate()
    makeLuaText('LyricAbajo','',400,screenWidth/2 - 220,screenHeight/2 + 160);
    setTextSize('LyricAbajo', 25, '000000');
    setTextAlignment('LyricAbajo','center'); 
    setObjectCamera('LyricAbajo', 'other');
    setProperty('LyricAbajo.antialiasing',false);
    setTextColor('LyricAbajo', 'E80A0A');
    setProperty('LyricAbajo.alpha', 0);
    addLuaText('LyricAbajo');

    makeLuaText('songWM', '', 1250, 0, 600);
    setObjectCamera('songWM', 'hud');
    setTextString('songWM',' - In-The-End [Hard] - ');
    setTextSize('songWM', 22);
    addLuaText('songWM');

    setProperty('introSoundsSuffix', '-nightcore') 
end

function onCreatePost()
    setTextString('botplayTxt', 'TRAPCITY');

    setProperty('scoreTxt.visible', false);
    setProperty('funnicube.visible', false);
    setProperty('timeTxt.visible', false);
    setProperty('timeBar.visible', false);
    setProperty('timeBarBG.visible', false);

    setProperty('iconP1.visible', false);
    setProperty('iconP2.visible', false);
    setProperty('healthBarWithAnim.visible', false);
    setProperty('bloodedHB.visible', false);
    setProperty('healthBar.visible', false);
    setProperty('healthBarBG.visible', false);

    setProperty('ratings.visible', false);
    setProperty('songWM.visible', false);
    setProperty('healthText.visible', false);
 
    setProperty('underlay.visible', false);
    setProperty('ComboText.visible', false);
    setProperty('SicksText.visible', false);
    setProperty('GoodsText.visible', false);
    setProperty('BadsText.visible', false);
    setProperty('ShitsText.visible', false);
    setProperty('MissText.visible', false);
end

function onUpdatePost()
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
    setProperty('songWM.y', 600);
end
if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
    setProperty('songWM.y', 40);
end
end
 
function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
end

function onUpdatePost(elapsed)
    songPos = getPropertyFromClass('Conductor', 'songPosition');
    currentBeat = (songPos / 1000) * (bpm / 140)
    if spin == true then 
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + arrowMoveX * math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*0.25) * math.pi))
        end
    end
end

function onStepHit()
if curStep == 35 then--empieza el sitema de lyrics
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "It' starts");
end
if curStep == 44 then
    setTextString('LyricAbajo', "with");
end
if curStep == 52 then
    setTextString('LyricAbajo', "ONE");
end
if curStep == 66 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 139 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "All l");
end
if curStep == 152 then
    setTextString('LyricAbajo', "Know");
end
if curStep == 165 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 240 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "So unreal");
end
if curStep == 269 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 344 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "Watch you go");
end
if curStep == 372 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 468 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "I tried so");
end
if curStep == 483 then
    setTextString('LyricAbajo', "HARD");
end
if curStep == 488 then
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 494 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "and got so far");
end
if curStep == 510 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 524 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "But in the end");
end
if curStep == 535 then
    setProperty('LyricAbajo.alpha', 0.5);
    setTextString('LyricAbajo', "In the end");
end
if curStep == 541 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 545 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "It doesn't");
end
if curStep == 586 then
    setTextString('LyricAbajo', "EVEN");
end
if curStep == 559 then
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 571 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "I had to");
end
if curStep == 586 then
    setTextString('LyricAbajo', "FALL");
end
if curStep == 590 then
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 596 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "To lose it all");
end
if curStep == 609 then
    setProperty('LyricAbajo.alpha', 0.5);
    setTextString('LyricAbajo', "It all");
end
if curStep == 616 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 626 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "But in the end");
end
if curStep == 637 then
    setProperty('LyricAbajo.alpha', 0.5);
    setTextString('LyricAbajo', "In the end");
end
if curStep == 642 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 647 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "It doesn't even");
end
if curStep == 659 then
    setTextString('LyricAbajo', "MATTER");
end
if curStep == 672 then
    setTextString('LyricAbajo', "I tried so");
end
if curStep == 688 then
    setTextString('LyricAbajo', "HARD");
end
if curStep == 693 then
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 698 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "and got so far");
end
if curStep == 714 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 728 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "But in the end");
end
if curStep == 740 then
    setProperty('LyricAbajo.alpha', 0.5);
    setTextString('LyricAbajo', "In the end");
end
if curStep == 745 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 748 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "It doesn't even");
end
if curStep == 764 then
    setTextString('LyricAbajo', "Matter");
end
if curStep == 765 then
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 770 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 774 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "I had to");
end
if curStep == 790 then
    setTextString('LyricAbajo', "FALL");
end
if curStep == 793 then
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 798 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "To lose it all");
end
if curStep == 812 then
    setTextString('LyricAbajo', "It all");
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 818 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 829 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "But in the end");
end
if curStep == 840 then
    setTextString('LyricAbajo', "In the end");
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 847 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 850 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "It doesn't even");
end
if curStep == 862 then
    setTextString('LyricAbajo', "MATTER");
end
if curStep == 885 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 901 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "It' starts");
end
if curStep == 909 then
    setTextString('LyricAbajo', "with");
end
if curStep == 917 then
    setTextString('LyricAbajo', "ONE");
end
if curStep == 931 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1005 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "All l");
end
if curStep == 1018 then
    setTextString('LyricAbajo', "Know");
end
if curStep == 1031 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1106 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "So unreal");
end
if curStep == 1133 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1209 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "Watch you go");
end
if curStep == 1238 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1333 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "I tried so");
end
if curStep == 1349 then
    setTextString('LyricAbajo', "HARD");
end
if curStep == 1354 then
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 1359 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "and got so far");
end
if curStep == 1377 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1389 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "But in the end");
end
if curStep == 1402 then
    setProperty('LyricAbajo.alpha', 0.5);
    setTextString('LyricAbajo', "In the end");
end
if curStep == 1406 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1410 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "It doesn't");
end
if curStep == 1425 then
    setTextString('LyricAbajo', "EVEN");
end
if curStep == 1427 then
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 1437 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "I had to");
end
if curStep == 1450 then
    setTextString('LyricAbajo', "FALL");
end
if curStep == 1456 then
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 1460 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "To lose it all");
end
if curStep == 1475 then
    setProperty('LyricAbajo.alpha', 0.5);
    setTextString('LyricAbajo', "it all");
end
if curStep == 1480 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1490 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "But in the end");
end
if curStep == 1503 then
    setProperty('LyricAbajo.alpha', 0.5);
    setTextString('LyricAbajo', "In the end");
end
if curStep == 1507 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1511 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "It doesn't even");
end
if curStep == 1524 then
    setTextString('LyricAbajo', "MATTER");
end
if curStep == 1538 then
    setTextString('LyricAbajo', "I tried so");
end
if curStep == 1553 then
    setTextString('LyricAbajo', "HARD");
end
if curStep == 1557 then
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 1562 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "and got so far");
end
if curStep == 1580 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1594 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "But in the end");
end
if curStep == 1604 then
    setProperty('LyricAbajo.alpha', 0.5);
    setTextString('LyricAbajo', "In the end");
end
if curStep == 1610 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1614 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "It doesn't even");
end
if curStep == 1629 then
    setTextString('LyricAbajo', "Matter");
end
if curStep == 1630 then
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 1637 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1639 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "I had to");
end
if curStep == 1654 then
    setTextString('LyricAbajo', "FALL");
end
if curStep == 1659 then
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 1664 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "To lose it all");
end
if curStep == 1679 then
    setTextString('LyricAbajo', "It all");
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 1685 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1695 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "But in the end");
end
if curStep == 1705 then
    setTextString('LyricAbajo', "In the end");
    setProperty('LyricAbajo.alpha', 0.5);
end
if curStep == 1711 then
    setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1716 then
    setProperty('LyricAbajo.alpha', 1);
    setTextString('LyricAbajo', "It doesn't even");
end
if curStep == 1728 then
    setTextString('LyricAbajo', "MATTER");
end
if curStep == 1751 then--finaliza el sistema de lyrics
    setProperty('LyricAbajo.alpha', 0);
end
end

function onGameOver()
    removeLuaText('LyricAbajo', true);
    return Function_Continue;
end
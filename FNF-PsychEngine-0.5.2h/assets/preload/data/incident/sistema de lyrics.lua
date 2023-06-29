font = "Five at Freddy's-Regular.ttf" -- the font that the text will use.

function onCreate()
     makeLuaSprite('Start', '', 0, 0);
     makeGraphic('Start',1280,720,'000000');
     setObjectCamera('Start', 'other');
     setProperty('Start.alpha', 1);
     addLuaSprite('Start', true);

     makeLuaText('LyricAbajo','',400,screenWidth/2 - 220,screenHeight/2 + 160);
     setTextSize('LyricAbajo', 25, '000000');
     setTextAlignment('LyricAbajo','center'); 
     setObjectCamera('LyricAbajo', 'other');
     setProperty('LyricAbajo.antialiasing',false);
     setTextColor('LyricAbajo', 'E80A0A');
     setProperty('LyricAbajo.alpha', 0);
     addLuaText('LyricAbajo');

     makeLuaText('songWM', '', 1260, 0, 600);
     setObjectCamera('songWM', 'hud');
     setTextString('songWM',' - Incident [Hard] - ');
     setTextSize('songWM', 22);
     addLuaText('songWM');
end

function onUpdatePost()
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
     setProperty('songWM.y', 600);
end
if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
     setProperty('songWM.y', 40);
end
end

function onCountdownStarted()
     setObjectCamera('topBar', 'other');
     setObjectCamera('bottomBar', 'other');
     setProperty('camHUD.visible', false);
end

function onSongStart()
     doTweenAlpha('graphicAlpha', 'Start', 0, 5, 'linear');
end

function onStepHit()
if curStep == 1 then
   --setPropertyFromClass('ClientPrefs', 'camZooms', false)
end
if curStep == 83 then--empieza el sitema de lyrics
     setProperty('LyricAbajo.alpha', 1);
     setTextString('LyricAbajo', "I dunno what i was thinking");
     setTextFont('LyricAbajo', font);
end
if curStep == 87 then--por si el juego se traba por el cambio al inicio
     setProperty('LyricAbajo.alpha', 1);
     setTextString('LyricAbajo', "I dunno what i was thinking");
     setTextFont('LyricAbajo', font);
end
if curStep == 100 then
     setTextString('LyricAbajo', "Leaving my child behind");
end
if curStep == 119 then
     setTextString('LyricAbajo', "Now I suffer the curse and now I am blind");
end
if curStep == 159 then
     setTextString('LyricAbajo', "With all this anger, guilt");
end
if curStep == 172 then
     setTextString('LyricAbajo', "and sadness");
end
if curStep == 180 then
     setTextString('LyricAbajo', "coming to haunt me forever");
end
if curStep == 200 then
     setTextString('LyricAbajo', "I can'wait for the cliff");
end
if curStep == 212 then
     setTextString('LyricAbajo', "at the end of the river");
end
if curStep == 226 then
     setProperty('LyricAbajo.alpha', 0);
end
if curStep == 240 then
     setObjectCamera('topBar', 'hud');
     setObjectCamera('bottomBar', 'hud');
     setProperty('camHUD.visible', true);
end
if curStep == 242 then
     setProperty('LyricAbajo.alpha', 1);
     setTextColor('LyricAbajo', '53E52C');
     setTextString('LyricAbajo', "Is this revenge i am seeking?");
     setTextFont('LyricAbajo', 'vcr.ttf');
end
if curStep == 260 then
     setTextString('LyricAbajo', "Or seeking someone to avenge me?");
end
if curStep == 278 then
     setTextString('LyricAbajo', "Stuck in my own paradox");--no jodas se volvio canon de golpe (0_0)
end
if curStep == 292 then
     setTextString('LyricAbajo', "I want to set myself free");
end
if curStep == 306 then
     setProperty('LyricAbajo.alpha', 0);
end
if curStep == 320 then
     setProperty('LyricAbajo.alpha', 1);
     setTextString('LyricAbajo', "Maybe I should chase");
end
if curStep == 334 then
     setTextString('LyricAbajo', "and find before they'II try");
end
if curStep == 349 then
     setTextString('LyricAbajo', "Stop it");
end
if curStep == 359 then
     setTextString('LyricAbajo', "It won't be long before");
end
if curStep == 374 then
     setTextString('LyricAbajo', "I'll become a puppet");
end
if curStep == 389 then
     setProperty('LyricAbajo.alpha', 0);
end
if curStep == 398 then
     setProperty('LyricAbajo.alpha', 1);
     setTextString('LyricAbajo', "It's been so long");
end
if curStep == 417 then
     setTextString('LyricAbajo', "Since l last have");
end
if curStep == 425 then
     setTextString('LyricAbajo', "Seen my son");
end
if curStep == 433 then
     setTextString('LyricAbajo', "Lost to this monster");
end
if curStep == 448 then
     setTextString('LyricAbajo', "To the man behind");
end
if curStep == 459 then
     setTextColor('LyricAbajo', 'E80A0A');
     setTextString('LyricAbajo', "Slaughter");
end
if curStep == 469 then
     setProperty('LyricAbajo.alpha', 0);
end
if curStep == 478 then
     setProperty('LyricAbajo.alpha', 1);
     setTextColor('LyricAbajo', '53E52C');
     setTextString('LyricAbajo', "Since you've been gone");
end
if curStep == 497 then
     setTextString('LyricAbajo', "I've been singing this");
end
if curStep == 506 then
     setTextString('LyricAbajo', "Stupid song");
end
if curStep == 513 then
     setTextString('LyricAbajo', "So i could ponder");
end
if curStep == 527 then
     setTextString('LyricAbajo', "The sanity of you mother");
end
if curStep == 547 then
     setProperty('LyricAbajo.alpha', 0);
end
if curStep == 560 then
     setTextString('botplayTxt', 'ALWAYS COME BACK');
end
if curStep == 720 then
     setTextFont('LyricAbajo', font);
     setTextString('LyricAbajo', "I wish i lived in the present");
     setProperty('LyricAbajo.alpha', 1);
     setTextColor('LyricAbajo', 'E80A0A');
end
if curStep == 738 then
     setTextString('LyricAbajo', "With the gift of my past mistakes");
end
if curStep == 758 then
     setTextString('LyricAbajo', "But the future keeps luring");
end
if curStep == 770 then
     setTextString('LyricAbajo', "In like a pack of snakes");
end
if curStep == 787 then
     setProperty('LyricAbajo.alpha', 0);
end
if curStep == 798 then
     setTextString('LyricAbajo', "Your sweet");
     setProperty('LyricAbajo.alpha', 1);
end
if curStep == 805 then
     setTextString('LyricAbajo', "Little eyes");
end
if curStep == 813 then
     setTextString('LyricAbajo', "your little slime");
end
if curStep == 826 then
     setTextString('LyricAbajo', "Is all remember");
end
if curStep == 838 then
     setTextString('LyricAbajo', "Those fuzzy memories");
end
if curStep == 852 then
     setTextString('LyricAbajo', "Mess with my temper");
end
if curStep == 867 then
     setProperty('LyricAbajo.alpha', 0);
end
if curStep == 881 then
     setTextFont('LyricAbajo', 'vcr.ttf');
     setProperty('LyricAbajo.alpha', 1);
     setTextColor('LyricAbajo', '8D09C7');
     setTextString('LyricAbajo', "Justification is");
end
if curStep == 890 then
     setTextString('LyricAbajo', "Kiking me");
end
if curStep == 900 then
     setTextString('LyricAbajo', "But killing isn't justifide");
end
if curStep == 919 then
     setTextString('LyricAbajo', "What happened to my");
end
if curStep == 928 then
     setTextString('LyricAbajo', "Son, i'm terrified");
end
if curStep == 945 then
     setProperty('LyricAbajo.alpha', 0);
end
if curStep == 958 then
     setProperty('LyricAbajo.alpha', 1);
     setTextString('LyricAbajo', "It lingers in my mind and");
end
if curStep == 977 then
     setTextString('LyricAbajo', "The thought keeps on getting bigger");
end
if curStep == 998 then
     setTextString('LyricAbajo', "I'm sorry my sweet baby");
end
if curStep == 1013 then
     setTextString('LyricAbajo', "I wish i've been there");
end
if curStep == 1029 then
     setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1043 then
     setProperty('LyricAbajo.alpha', 1);
     setTextString('LyricAbajo', "It's been so long");
end
if curStep == 1058 then
     setTextString('LyricAbajo', "Since l last have");
end
if curStep == 1065 then
     setTextString('LyricAbajo', "Seen my son");
end
if curStep == 1073 then
     setTextString('LyricAbajo', "Lost to this monster");
end
if curStep == 1087 then
     setTextString('LyricAbajo', "To the man behind");
end
if curStep == 1100 then
     setTextColor('LyricAbajo', 'E80A0A');
     setTextString('LyricAbajo', "Slaughter");
end
if curStep == 1108 then
     setProperty('LyricAbajo.alpha', 0);
end
if curStep == 1117 then
     setProperty('LyricAbajo.alpha', 1);
     setTextColor('LyricAbajo', '8D09C7');
     setTextString('LyricAbajo', "Since you've been gone");
end
if curStep == 1137 then
     setTextString('LyricAbajo', "I've been singing this");
end
if curStep == 1145 then
     setTextString('LyricAbajo', "Stupid song");
end
if curStep == 1153 then
     setTextString('LyricAbajo', "So i could ponder");
end
if curStep == 1168 then
     setTextString('LyricAbajo', "The sanity of you mother");
end
if curStep == 1191 then
   --setPropertyFromClass('ClientPrefs', 'camZooms', true)
     setProperty('LyricAbajo.alpha', '0');
end
if curStep == 1200 then
     doTweenAlpha('graphicAlpha', 'Start', 4, 58, 'linear');
end
if curStep == 1353 then
     setProperty('LyricAbajo.alpha', 1);
     setTextColor('LyricAbajo', 'E80A0A');
     setTextFont('LyricAbajo', font);
     screenCenter('LyricAbajo', XY);
     setTextString('LyricAbajo', "IS'ME");
end
if curStep == 1357 then--finaliza el sistema de lyrics me costo menos que funny jaja
     setProperty('LyricAbajo.alpha', 0);
end
end

function onGameOver()
    removeLuaText('LyricAbajo', true);
    return Function_Continue;
end
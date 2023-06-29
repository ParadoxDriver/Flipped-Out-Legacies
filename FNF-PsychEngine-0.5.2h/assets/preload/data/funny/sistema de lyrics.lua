function onCreate()
     makeLuaSprite('Start', '', 0, 0);
     makeGraphic('Start',1280,720,'000000');
     setObjectCamera('Start', 'other');
     setProperty('Start.alpha', 1);
     addLuaSprite('Start', true);

     makeLuaText('LyricAbajo','',400,screenWidth/2 - 220,screenHeight/2 + 160);
     setTextSize('LyricAbajo', 25, '000000');
     setTextAlignment('LyricAbajo','center'); 
     setTextColor('LyricAbajo', '53E52C')
     setObjectCamera('LyricAbajo', 'other')
     setProperty('LyricAbajo.antialiasing',false)
     setProperty('LyricAbajo.alpha', '0');
     addLuaText('LyricAbajo');

     makeLuaText('songWM', '', 1260, 0, 600);
     setObjectCamera('songWM', 'hud');
     setTextString('songWM',' - Funny [Hard] - ');
     setTextSize('songWM', 22);
     addLuaText('songWM');

--sexy counter
     makeLuaSprite('get', 'Countdowns/FullMetal/set', screenWidth / 2 - 180, screenHeight / 2 - 150);
     setObjectCamera('get','other');
     setProperty('get.alpha', '0');
     addLuaSprite('get', true);	

     makeLuaSprite('ready', 'Countdowns/FullMetal/ready', screenWidth / 2 - 180, screenHeight / 2 - 150);
     setObjectCamera('ready','other');
     setProperty('ready.alpha', '0');
     addLuaSprite('ready', true);	

     makeLuaSprite('set', 'Countdowns/FullMetal/get-reday', screenWidth / 2 - 180, screenHeight / 2 - 150);
     setObjectCamera('set','other');
     setProperty('set.alpha', '0');
     addLuaSprite('set', true);
end

function onCreatePost()
     setTextString('botplayTxt', "WHEN THE FLIPPY\nIS A SUS");
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
     doTweenZoom('zoom', 'camGame', 1.3, 0.70, 'elasticInOut');
     setProperty('defaultCamZoom', 1.3);
     triggerEvent('Sexy Camera Zoom', '1', '');
end

function onSongStart()
     doTweenAlpha('graphicAlpha', 'Start', 0, 1.5, 'sineInOut');
end

function onStepHit()
if curStep == 25 then
     triggerEvent('Change Character', 'dad', 'flippy-cool');
end

if curStep == 77 then
     triggerEvent('Sexy Camera Zoom', '0', '');
end

if curStep == 86 then
     setProperty('defaultCamZoom', 0.65);
     setObjectCamera('topBar', 'hud');
     setObjectCamera('bottomBar', 'hud')
     setProperty('camHUD.visible', true);
end
if curStep == 87 then--empieza el sistema de lyrics
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 93 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 102 then
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 108 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 119 then
    setTextString('LyricAbajo', "My muscles");
end
if curStep == 134 then
    setTextString('LyricAbajo', "Involuntarily flex");
end
if curStep == 146 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 151 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 156 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 166 then
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 172 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 182 then
    setTextString('LyricAbajo', "My muscles");
end
if curStep == 198 then
    setTextString('LyricAbajo', "Involuntarily flex");
end
if curStep == 210 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 215 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Two pickup trucks");
end
if curStep == 225 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 232 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Making love");
end
if curStep == 240 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 247 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "American made");
end
if curStep == 256 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 264 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Built ford tought");
end
if curStep == 274 then
    setTextString('LyricAbajo', "Two beautiful");
end
if curStep == 281 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 288 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Murder machines");
end
if curStep == 298 then
    setTextString('LyricAbajo', "American angels");
end
if curStep == 307 then
    setTextString('LyricAbajo', "In the sky");
end
if curStep == 316 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 328 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Grown men cry");
end
if curStep == 339 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 342 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 349 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 354 then
    setTextString('LyricAbajo', "oh yes");
end
if curStep == 359 then
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 365 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 370 then
    setTextString('LyricAbajo', "oh yes");
end
if curStep == 375 then
    setTextString('LyricAbajo', "My muscles");
end
if curStep == 393 then
    setTextString('LyricAbajo', "Involuntarily flex");
end
if curStep == 402 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 407 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 412 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 418 then
    setTextString('LyricAbajo', "oh yes");
end
if curStep == 424 then
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 429 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 434 then
    setTextString('LyricAbajo', "oh yes");
end
if curStep == 439 then
    setTextString('LyricAbajo', "My muscles");
end
if curStep == 457 then
    setTextString('LyricAbajo', "Involuntarily flex");
end
if curStep == 468 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 471 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Right by my side");
end
if curStep == 480 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 486 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "There's zz top");
end
if curStep == 495 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 503 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "and robert z'dar");
end
if curStep == 518 then
    setTextString('LyricAbajo', "From maniac cop");
end
if curStep == 530 then
    setProperty('LyricAbajo.alpha', '0');
    setProperty('get.alpha', '1');
    triggerEvent('Add Camera Zoom', '0.015', '0.03');
end
if curStep == 532 then
    setProperty('get.alpha', '0');
    setProperty('ready.alpha', '1');
    triggerEvent('Add Camera Zoom', '0.09', '0.09');
end
if curStep == 536 then
    setProperty('ready.alpha', '0');
    setProperty('set.alpha', '1');
    triggerEvent('Add Camera Zoom', '0.3', '0.1');
end
if curStep == 540 then
    setProperty('set.alpha', '0');
end
if curStep == 552 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "This bbq could bring");
end
if curStep == 562 then
    setTextString('LyricAbajo', "Your knees");
end
if curStep == 572 then
    setProperty('set.alpha', '0');
end
if curStep == 583 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "and so could these");
end
if curStep == 598 then
    setTextString('LyricAbajo', "Two trucks");
end
if curStep == 603 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 667 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "*bars, bars, and more bars*");
end
if curStep == 728 then
    setTextString('LyricAbajo', "Two trucks");
end
if curStep == 732 then
    setTextString('LyricAbajo', "Holding hands");
end
if curStep == 742 then
    setTextString('LyricAbajo', "Two trucks");
end
if curStep == 748 then
    setTextString('LyricAbajo', "Holding hands");
end
if curStep == 759 then
    setTextString('LyricAbajo', "The passion");
end
if curStep == 774 then
    setTextString('LyricAbajo', "Is more than i can");
end
if curStep == 784 then
    setTextString('LyricAbajo', "Withstand");
end
if curStep == 787 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 791 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Two trucks");
end
if curStep == 796 then
    setTextString('LyricAbajo', "Holding hands");
end
if curStep == 806 then
    setTextString('LyricAbajo', "Two trucks");
end
if curStep == 812 then
    setTextString('LyricAbajo', "Holding hands");
end
if curStep == 822 then
    setTextString('LyricAbajo', "The passion");
end
if curStep == 839 then
    setTextString('LyricAbajo', "My big fat heart");
end
if curStep == 848 then
    setTextString('LyricAbajo', "Expands");
end
if curStep == 855 then
    setTextString('LyricAbajo', "Two pickup");
end
if curStep == 861 then
    setTextString('LyricAbajo', "Trucks");
end
if curStep == 864 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 871 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "one cylinder block");
end
if curStep == 879 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 888 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Cruch my body");
end
if curStep == 896 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 904 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Like a rock");
end
if curStep == 914 then
    setTextString('LyricAbajo', "so");
end
if curStep == 916 then
    setTextString('LyricAbajo', "Beautiful");
end
if curStep == 921 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 927 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "No stars tonight just");
end
if curStep == 934 then
    setTextString('LyricAbajo', "Fireworks");
end
if curStep == 947 then
    setTextString('LyricAbajo', "and eagles in the sky");
end
if curStep == 960 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 966 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "The founding fathers cry");
end
if curStep == 979 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 983 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 988 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 993 then
    setTextString('LyricAbajo', "oh yes");
end
if curStep == 998 then
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 1004 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 1010 then
    setTextString('LyricAbajo', "oh yes");
end
if curStep == 1014 then
    setTextString('LyricAbajo', "My muscles");
end
if curStep == 1030 then
    setTextString('LyricAbajo', "Involuntarily flex");
end
if curStep == 1043 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 1046 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 1053 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 1057 then
    setTextString('LyricAbajo', "oh yes");
end  
if curStep == 1062 then
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 1068 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 1074 then
    setTextString('LyricAbajo', "oh yes");
end
if curStep == 1077 then
    setTextString('LyricAbajo', "My muscles");
end
if curStep == 1094 then
    setTextString('LyricAbajo', "Involuntarily flex");
end
if curStep == 1104 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 1110 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "huh");
end
if curStep == 1112 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 1118 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "FLEX!");
end
if curStep == 1119 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 1262 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 1269 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 1278 then
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 1284 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 1294 then
    setTextString('LyricAbajo', "My muscles");
end
if curStep == 1311 then
    setTextString('LyricAbajo', "InvoluntarilY");
end
if curStep == 1324 then
    setTextString('LyricAbajo', "FLEX!");
    triggerEvent('Add Camera Zoom', '0.3', '0.1');
end
if curStep == 1327 then
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 1332 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 1342 then
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 1348 then
    setTextString('LyricAbajo', "Having Sex");
end
if curStep == 1358 then
    setTextString('LyricAbajo', "My muscles");
end
if curStep == 1375 then
    setTextString('LyricAbajo', "Involuntarily");
end
if curStep == 1388 then
    setTextString('LyricAbajo', "FLEX");
    triggerEvent('Add Camera Zoom', '0.3', '0.1');
end
if curStep == 1393 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 1520 then
    setProperty('LyricAbajo.alpha', '1');
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 1529 then
    setTextString('LyricAbajo', "Having sex");
end
if curStep == 1536 then
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 1546 then
    setTextString('LyricAbajo', "Having sex");
end
if curStep == 1552 then
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 1562 then
    setTextString('LyricAbajo', "Having sex");
end
if curStep == 1584 then
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 1594 then
    setTextString('LyricAbajo', "Having sex");
end
if curStep == 1600 then
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 1610 then
    setTextString('LyricAbajo', "Having sex");
end
if curStep == 1616 then
    setTextString('LyricAbajo', "Two Trucks");
end
if curStep == 1626 then
    setTextString('LyricAbajo', "Having sex");
end
if curStep == 1649 then
    setProperty('LyricAbajo.alpha', '0');
end
if curStep == 1749 then--finaliza el sitema de lyric amen
    doTweenZoom('zoom', 'camGame', 0.95, 0.01, 'circInOut');
    setProperty('defaultCamZoom', 0.95);
    setProperty('LyricAbajo.y', '470');
    setProperty('LyricAbajo.alpha', '1');
    setTextSize('LyricAbajo', 70, '000000');
    setTextFont('LyricAbajo', 'SusFont.ttf');
    setTextColor('LyricAbajo', 'ffffff');
    setTextString('LyricAbajo', "AMONG US");
end
end

function onGameOver()
    removeLuaText('LyricAbajo', true);
    return Function_Continue;
end
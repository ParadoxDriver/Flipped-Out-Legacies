function onCreate()
    makeLuaSprite('card', 'nothing', -400, 250);
    setObjectCamera('card', 'other');
    addLuaSprite('card');
    scaleObject('card', 0.45, 0.45);

    makeLuaText('songname', 'Song: Outbreak', '430', -482, 255);
    setTextSize('songname', 24);
    setObjectCamera('songname', 'other');
    setTextColor('songname', 'A4A4A4');
    setTextFont('songname', 'stratum2-medium-webfont.ttf');
    setTextBorder('songname', '0','A4A4A4');
    setObjectOrder('songname', 98);
    addLuaText('songname');

    makeLuaText('desc', 'Song by: ThunderGhost', '455', -517, 290);
    setTextSize('desc', 18);
    setObjectCamera('desc', 'other');
    setTextColor('desc', 'A4A4A4');
    setTextFont('desc', 'stratum2-medium-webfont.ttf');
    setTextBorder('desc', '0','A4A4A4');
    setObjectOrder('desc', 99);
    addLuaText('desc');

    makeLuaSprite('Start', '', 0, 0);
    makeGraphic('Start',1280,720,'000000');
    setObjectCamera('Start', 'hud');
    setProperty('Start.alpha', 1);
    addLuaSprite('Start', true);

    setObjectOrder('Start', 1);
end

function onStepHit()
if curStep == 1 then
   doTweenAlpha('graphicAlpha', 'Start', 0, 20, 'linear');
end
if curStep == 66 then
   doTweenAlpha('graphicAlpha', 'Start', 0, 5, 'linear');
end
end

function onBeatHit()
if curBeat >= 33 and curBeat < 228 or curBeat >= 270 and curBeat < 303 then
   if curBeat % 1 == 0 then
       triggerEvent('Add Camera Zoom', '0.07', '0.09');
     end
   end
end

function onCountdownTick(counter)
if counter == 0 then
       doTweenX('card','card', '0', 1, 'expoInOut')
       doTweenX('name','songname', '-102', 1, 'expoInOut')
       doTweenX('line1','desc', '-137', 1, 'expoInOut')
	  runTimer('cardback', 4)
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'cardback' then
       doTweenX('dawg','card', '-400', 1, 'expoInOut')
       doTweenX('andnamowashisnamo','songname', '-462', 1, 'expoInOut')
       doTweenX('lineo1','desc', '-517', 1, 'expoInOut')
   end
end

function onTweenCompleted(tag)
if tag == 'dawg' then
       removeLuaSprite('dawg', true);
       removeLuaText('desc', true);
       removeLuaText('songname', true);
   end
end
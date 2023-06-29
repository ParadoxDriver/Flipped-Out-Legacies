local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('KapowCutscene');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onCreate()
     makeLuaSprite('Start', '', 0, 0);
     makeGraphic('Start',1280,720,'000000');
     setObjectCamera('Start', 'other');
     setProperty('Start.alpha', 1);
     addLuaSprite('Start', true);

     makeLuaText('engineText', "Remix By Silly_Nex", 0, 2, 700);
     setTextAlignment('engineText', 'left');
     setTextSize('engineText', 17);
     setTextBorder('engineText', 1, '000000');
     setObjectCamera('engineText', 'hud');
     setTextColor('engineText', '576661');
     addLuaText('engineText');
end

function onSongStart()
     doTweenAlpha('graphicAlpha', 'Start', 0, 2, 'quintOut'); 
end

function onStepHit()
if curStep == 262 then
    doTweenColor('scoreTxt', 'scoreTxt', 'FF0000', 1.3, 'linear');
    doTweenColor('timeTxt',  'timeTxt', 'FF0000', 1.3, 'linear');
    doTweenColor('timeBar',  'timeBar', 'FF0000', 1.3, 'linear');
    doTweenColor('botplayTxt', 'botplayTxt', 'FF0000', 1.3, 'linear');
    doTweenColor('healthText',  'healthText', 'FF0000', 1.3, 'linear');
    doTweenColor('songWM', 'songWM', 'FF0000', 1.3, 'linear');
    doTweenColor('engineText',  'engineText', 'FF0000', 1.3, 'linear');

    setProperty('underlay.color', getColorFromHex('FF0000'))
    doTweenColor('ComboText', 'ComboText', 'FF0000', 1.3, 'linear');
    doTweenColor('SicksText',  'SicksText', 'FF0000', 1.3, 'linear');
    doTweenColor('GoodsText',  'GoodsText', 'FF0000', 1.3, 'linear');
    doTweenColor('BadsText', 'BadsText', 'FF0000', 1.3, 'linear');
    doTweenColor('ShitsText',  'ShitsText', 'FF0000', 1.3, 'linear');
    doTweenColor('MissText',  'MissText', 'FF0000', 1.3, 'linear');
end

if curStep == 640 then
   doTweenColor('scoreTxt', 'scoreTxt', '576661', 0.8, 'linear');
   doTweenColor('timeTxt',  'timeTxt', '576661', 0.8, 'linear');
   doTweenColor('timeBar',  'timeBar', '576661', 0.8, 'linear');
   doTweenColor('botplayTxt', 'botplayTxt', '576661', 0.8, 'linear');
   doTweenColor('healthText',  'healthText', '576661', 0.8, 'linear');
   doTweenColor('songWM', 'songWM', '576661', 0.8, 'linear');
   doTweenColor('engineText',  'engineText', '576661', 0.8, 'linear');

   setProperty('underlay.color', getColorFromHex('576661'))
   doTweenColor('ComboText', 'ComboText', '576661', 0.8, 'linear');
   doTweenColor('SicksText',  'SicksText', '576661', 0.8, 'linear');
   doTweenColor('GoodsText',  'GoodsText', '576661', 0.8, 'linear');
   doTweenColor('BadsText', 'BadsText', '576661', 0.8, 'linear');
   doTweenColor('ShitsText',  'ShitsText', '576661', 0.8, 'linear');
   doTweenColor('MissText',  'MissText', '576661', 0.8, 'linear');
end

if curStep == 896 then
   doTweenColor('scoreTxt', 'scoreTxt', 'FF0000', 0.9, 'linear');
   doTweenColor('timeTxt',  'timeTxt', 'FF0000', 0.9, 'linear');
   doTweenColor('timeBar',  'timeBar', 'FF0000', 0.9, 'linear');
   doTweenColor('botplayTxt', 'botplayTxt', 'FF0000', 0.9, 'linear');
   doTweenColor('healthText',  'healthText', 'FF0000', 0.9, 'linear');
   doTweenColor('songWM', 'songWM', 'FF0000', 0.9, 'linear');
   doTweenColor('engineText',  'engineText', 'FF0000', 0.9, 'linear');

   setProperty('underlay.color', getColorFromHex('FF0000'))
   doTweenColor('ComboText', 'ComboText', 'FF0000', 0.9, 'linear');
   doTweenColor('SicksText',  'SicksText', 'FF0000', 0.9, 'linear');
   doTweenColor('GoodsText',  'GoodsText', 'FF0000', 0.9, 'linear');
   doTweenColor('BadsText', 'BadsText', 'FF0000', 0.9, 'linear');
   doTweenColor('ShitsText',  'ShitsText', 'FF0000', 0.9, 'linear');
   doTweenColor('MissText',  'MissText', 'FF0000', 0.9, 'linear');
end

if curStep == 1151 then
   doTweenColor('scoreTxt', 'scoreTxt', '576661', 0.7, 'linear');
   doTweenColor('timeTxt',  'timeTxt', '576661', 0.7, 'linear');
   doTweenColor('timeBar',  'timeBar', '576661', 0.7, 'linear');
   doTweenColor('botplayTxt', 'botplayTxt', '576661', 0.7, 'linear');
   doTweenColor('healthText',  'healthText', '576661', 0.7, 'linear');
   doTweenColor('songWM', 'songWM', '576661', 0.7, 'linear');
   doTweenColor('engineText',  'engineText', '576661', 0.7, 'linear');

   setProperty('underlay.color', getColorFromHex('576661'))
   doTweenColor('ComboText', 'ComboText', '576661', 0.7, 'linear');
   doTweenColor('SicksText',  'SicksText', '576661', 0.7, 'linear');
   doTweenColor('GoodsText',  'GoodsText', '576661', 0.7, 'linear');
   doTweenColor('BadsText', 'BadsText', '576661', 0.7, 'linear');
   doTweenColor('ShitsText',  'ShitsText', '576661', 0.7, 'linear');
   doTweenColor('MissText',  'MissText', '576661', 0.7, 'linear');
end

if curStep == 1168 then
   doTweenColor('scoreTxt', 'scoreTxt', 'FF0000', 0.7, 'linear');
   doTweenColor('timeTxt',  'timeTxt', 'FF0000', 0.7, 'linear');
   doTweenColor('timeBar',  'timeBar', 'FF0000', 0.7, 'linear');
   doTweenColor('botplayTxt', 'botplayTxt', 'FF0000', 0.7, 'linear');
   doTweenColor('healthText',  'healthText', 'FF0000', 0.7, 'linear');
   doTweenColor('songWM', 'songWM', 'FF0000', 0.7, 'linear');
   doTweenColor('engineText',  'engineText', 'FF0000', 0.7, 'linear');

   setProperty('underlay.color', getColorFromHex('FF0000'))
   doTweenColor('ComboText', 'ComboText', 'FF0000', 0.7, 'linear');
   doTweenColor('SicksText',  'SicksText', 'FF0000', 0.7, 'linear');
   doTweenColor('GoodsText',  'GoodsText', 'FF0000', 0.7, 'linear');
   doTweenColor('BadsText', 'BadsText', 'FF0000', 0.7, 'linear');
   doTweenColor('ShitsText',  'ShitsText', 'FF0000', 0.7, 'linear');
   doTweenColor('MissText',  'MissText', 'FF0000', 0.7, 'linear');
end

if curStep == 1776 then
   doTweenColor('scoreTxt', 'scoreTxt', '576661', 1.3, 'linear');
   doTweenColor('timeTxt',  'timeTxt', '576661', 1.3, 'linear');
   doTweenColor('timeBar',  'timeBar', '576661', 1.3, 'linear');
   doTweenColor('botplayTxt', 'botplayTxt', '576661', 1.3, 'linear');
   doTweenColor('healthText',  'healthText', '576661', 1.3, 'linear');
   doTweenColor('songWM', 'songWM', '576661', 0.8, 'linear');
   doTweenColor('engineText',  'engineText', '576661', 1.3, 'linear');

   setProperty('underlay.color', getColorFromHex('576661'))
   doTweenColor('ComboText', 'ComboText', '576661', 1.3, 'linear');
   doTweenColor('SicksText',  'SicksText', '576661', 1.3, 'linear');
   doTweenColor('GoodsText',  'GoodsText', '576661', 1.3, 'linear');
   doTweenColor('BadsText', 'BadsText', '576661', 1.3, 'linear');
   doTweenColor('ShitsText',  'ShitsText', '576661', 1.3, 'linear');
   doTweenColor('MissText',  'MissText', '576661', 1.3, 'linear');
end
end
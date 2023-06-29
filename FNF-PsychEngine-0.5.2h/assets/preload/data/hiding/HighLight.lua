local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('HidingCutscene');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onCreate()
       makeLuaText('engineText', "Remix By Neutroa", 0, 2, 700);
       setTextAlignment('engineText', 'left');
       setTextSize('engineText', 17);
       setTextBorder('engineText', 1, '000000');
       setObjectCamera('engineText', 'hud');
       setTextColor('engineText', '8D09C7');
       setTextFont('engineText', "neon2.ttf");
       addLuaText('engineText');

       makeLuaSprite('Start', '', 0, 0);
       makeGraphic('Start',1280,720,'000000');
       setObjectCamera('Start', 'other');
       setProperty('Start.alpha', 1);
       addLuaSprite('Start', true);
end
 
function onSongStart()
       doTweenAlpha('graphicAlpha', 'Start', 0, 2, 'quintOut');
end

function goodNoteHit(id, direction, noteType, isSustainNote)
if direction == 0 then
            makeLuaSprite("left_l","Effects/Lights/LEFTL",-140,-50);
            addLuaSprite("left_l",true);
            setObjectCamera('left_l','other');
            setBlendMode("left_l","add");
            doTweenColor('purple_hi', 'left_l', 'FFFFFFFF', 0.2, 'quartIn');
            runTimer("purple",0.1);
elseif direction == 2 then
            makeLuaSprite("up_l","Effects/Lights/UPL",-140,-50);
            addLuaSprite("up_l",true);
            setObjectCamera('up_l','other');
            setBlendMode("up_l","add");
            doTweenColor('green_hi', 'up_l', 'FFFFFFFF', 0.2, 'quartIn');
            runTimer("green",0.1);
elseif direction == 3 then
            makeLuaSprite("right_l","Effects/Lights/RIGHTL",-140,-50);
            addLuaSprite("right_l",true);
            setObjectCamera('right_l','other');
            setBlendMode("right_l","add");
            doTweenColor('red_hi', 'right_l', 'FFFFFFFF', 0.2, 'quartIn');
            runTimer("red",0.1);
elseif direction == 1 then
            makeLuaSprite("down_l","Effects/Lights/DOWNL",-140,-50);
            addLuaSprite("down_l",true);
            setObjectCamera('down_l','other');
            setBlendMode("down_l","add");
            doTweenColor('cyan_hi', 'down_l', 'FFFFFFFF', 0.2, 'quartIn');
            runTimer("cyan",0.1);
        end
end

function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'purple' then
        doTweenAlpha('purple_l', 'left_l',0,0.25, 'linear');
    end
    if tag == 'red' then
        doTweenAlpha('red_l', 'right_l',0,0.25, 'linear');
    end
    if tag == 'cyan' then
        doTweenAlpha('cyan_l', 'down_l',0,0.25, 'linear');
    end
    if tag == 'green' then
        doTweenAlpha('green_l', 'up_l',0,0.25, 'linear');
    end
end

function onTweenCompleted(tag)
    if tag == 'purple_l' then
        removeLuaSprite('left_l', true);
    end
    if tag == 'red_l' then
        removeLuaSprite('right_l', true);
    end
    if tag == 'cyan_l' then
        removeLuaSprite('down_l', true);
    end
    if tag == 'green_l' then
        removeLuaSprite('up_l', true);
    end
end

function onBeatHit()
if curBeat > 224 then
   if curBeat % 2 == 0 then
   setProperty('healthBar.color', getColorFromHex('FF0000'))
   setProperty('timeCool.color', getColorFromHex('FF0000'))
   setProperty('timeBar.color', getColorFromHex('FF0000'))
   setProperty('scoreTxt.color', getColorFromHex('FF0000'))
   setProperty('timeTxt.color', getColorFromHex('FF0000'))
   setProperty('songWM.color', getColorFromHex('FF0000'))
   setProperty('healthText.color', getColorFromHex('FF0000'))
   setProperty('botplayTxt.color', getColorFromHex('FF0000'))
   setProperty('engineText.color', getColorFromHex('FF0000'))
   setProperty('underlay.color', getColorFromHex('FF0000'))
   setProperty('ComboText.color', getColorFromHex('FF0000'))
   setProperty('SicksText.color', getColorFromHex('FF0000'))
   setProperty('GoodsText.color', getColorFromHex('FF0000'))
   setProperty('BadsText.color', getColorFromHex('FF0000'))
   setProperty('ShitsText.color', getColorFromHex('FF0000'))
   setProperty('MissText.color', getColorFromHex('FF0000'))
end

   if curBeat % 4 == 0 then
   setProperty('healthBar.color', getColorFromHex('3F029C'))
   setProperty('timeCool.color', getColorFromHex('3F029C'))
   setProperty('timeBar.color', getColorFromHex('3F029C'))
   setProperty('scoreTxt.color', getColorFromHex('3F029C'))
   setProperty('timeTxt.color', getColorFromHex('3F029C'))
   setProperty('songWM.color', getColorFromHex('3F029C'))
   setProperty('healthText.color', getColorFromHex('3F029C'))
   setProperty('botplayTxt.color', getColorFromHex('3F029C'))
   setProperty('engineText.color', getColorFromHex('3F029C'))
   setProperty('underlay.color', getColorFromHex('3F029C'))
   setProperty('ComboText.color', getColorFromHex('3F029C'))
   setProperty('SicksText.color', getColorFromHex('3F029C'))
   setProperty('GoodsText.color', getColorFromHex('3F029C'))
   setProperty('BadsText.color', getColorFromHex('3F029C'))
   setProperty('ShitsText.color', getColorFromHex('3F029C'))
   setProperty('MissText.color', getColorFromHex('3F029C'))
end

   if curBeat % 6 == 0 then
   setProperty('healthBar.color', getColorFromHex('0008FF'))
   setProperty('timeCool.color', getColorFromHex('0008FF'))
   setProperty('timeBar.color', getColorFromHex('0008FF'))
   setProperty('scoreTxt.color', getColorFromHex('0008FF'))
   setProperty('timeTxt.color', getColorFromHex('0008FF'))
   setProperty('songWM.color', getColorFromHex('0008FF'))
   setProperty('healthText.color', getColorFromHex('0008FF'))
   setProperty('botplayTxt.color', getColorFromHex('0008FF'))
   setProperty('engineText.color', getColorFromHex('0008FF'))
   setProperty('underlay.color', getColorFromHex('0008FF'))
   setProperty('ComboText.color', getColorFromHex('0008FF'))
   setProperty('SicksText.color', getColorFromHex('0008FF'))
   setProperty('GoodsText.color', getColorFromHex('0008FF'))
   setProperty('BadsText.color', getColorFromHex('0008FF'))
   setProperty('ShitsText.color', getColorFromHex('0008FF'))
   setProperty('MissText.color', getColorFromHex('0008FF'))
end

   if curBeat % 8 == 0 then
   setProperty('healthBar.color', getColorFromHex('3F029C'))
   setProperty('timeCool.color', getColorFromHex('3F029C'))
   setProperty('timeBar.color', getColorFromHex('3F029C'))
   setProperty('scoreTxt.color', getColorFromHex('3F029C'))
   setProperty('timeTxt.color', getColorFromHex('3F029C'))
   setProperty('songWM.color', getColorFromHex('3F029C'))
   setProperty('healthText.color', getColorFromHex('3F029C'))
   setProperty('botplayTxt.color', getColorFromHex('3F029C'))
   setProperty('engineText.color', getColorFromHex('3F029C'))
   setProperty('underlay.color', getColorFromHex('3F029C'))
   setProperty('ComboText.color', getColorFromHex('3F029C'))
   setProperty('SicksText.color', getColorFromHex('3F029C'))
   setProperty('GoodsText.color', getColorFromHex('3F029C'))
   setProperty('BadsText.color', getColorFromHex('3F029C'))
   setProperty('ShitsText.color', getColorFromHex('3F029C'))
   setProperty('MissText.color', getColorFromHex('3F029C'))
end

   if curBeat % 10 == 0 then
   setProperty('healthBar.color', getColorFromHex('26FF00'))
   setProperty('timeCool.color', getColorFromHex('26FF00'))
   setProperty('timeBar.color', getColorFromHex('26FF00'))
   setProperty('scoreTxt.color', getColorFromHex('26FF00'))
   setProperty('timeTxt.color', getColorFromHex('26FF00'))
   setProperty('songWM.color', getColorFromHex('26FF00'))
   setProperty('healthText.color', getColorFromHex('26FF00'))
   setProperty('botplayTxt.color', getColorFromHex('26FF00'))
   setProperty('engineText.color', getColorFromHex('26FF00'))
   setProperty('underlay.color', getColorFromHex('26FF00'))
   setProperty('ComboText.color', getColorFromHex('26FF00'))
   setProperty('SicksText.color', getColorFromHex('26FF00'))
   setProperty('GoodsText.color', getColorFromHex('26FF00'))
   setProperty('BadsText.color', getColorFromHex('26FF00'))
   setProperty('ShitsText.color', getColorFromHex('26FF00'))
   setProperty('MissText.color', getColorFromHex('26FF00'))
end

   if curBeat % 12 == 0 then
   setProperty('healthBar.color', getColorFromHex('00FFFF'))
   setProperty('timeCool.color', getColorFromHex('00FFFF'))
   setProperty('timeBar.color', getColorFromHex('00FFFF'))
   setProperty('scoreTxt.color', getColorFromHex('00FFFF'))
   setProperty('timeTxt.color', getColorFromHex('00FFFF'))
   setProperty('songWM.color', getColorFromHex('00FFFF'))
   setProperty('healthText.color', getColorFromHex('00FFFF'))
   setProperty('botplayTxt.color', getColorFromHex('00FFFF'))
   setProperty('engineText.color', getColorFromHex('00FFFF'))
   setProperty('underlay.color', getColorFromHex('00FFFF'))
   setProperty('ComboText.color', getColorFromHex('00FFFF'))
   setProperty('SicksText.color', getColorFromHex('00FFFF'))
   setProperty('GoodsText.color', getColorFromHex('00FFFF'))
   setProperty('BadsText.color', getColorFromHex('00FFFF'))
   setProperty('ShitsText.color', getColorFromHex('00FFFF'))
   setProperty('MissText.color', getColorFromHex('00FFFF'))
end

   if curBeat % 14 == 0 then
   setProperty('healthBar.color', getColorFromHex('00F2FF'))
   setProperty('timeCool.color', getColorFromHex('00F2FF'))
   setProperty('timeBar.color', getColorFromHex('00F2FF'))
   setProperty('scoreTxt.color', getColorFromHex('00F2FF'))
   setProperty('timeTxt.color', getColorFromHex('00F2FF'))
   setProperty('songWM.color', getColorFromHex('00F2FF'))
   setProperty('healthText.color', getColorFromHex('00F2FF'))
   setProperty('botplayTxt.color', getColorFromHex('00F2FF'))
   setProperty('engineText.color', getColorFromHex('00F2FF'))
   setProperty('underlay.color', getColorFromHex('00F2FF'))
   setProperty('ComboText.color', getColorFromHex('00F2FF'))
   setProperty('SicksText.color', getColorFromHex('00F2FF'))
   setProperty('GoodsText.color', getColorFromHex('00F2FF'))
   setProperty('BadsText.color', getColorFromHex('00F2FF'))
   setProperty('ShitsText.color', getColorFromHex('00F2FF'))
   setProperty('MissText.color', getColorFromHex('00F2FF'))
end

   if curBeat % 16 == 0 then
   setProperty('healthBar.color', getColorFromHex('FF7700'))
   setProperty('timeCool.color', getColorFromHex('FFF700'))
   setProperty('timeBar.color', getColorFromHex('FFF700'))
   setProperty('scoreTxt.color', getColorFromHex('FFF700'))
   setProperty('timeTxt.color', getColorFromHex('FFF700'))
   setProperty('songWM.color', getColorFromHex('FFF700'))
   setProperty('healthText.color', getColorFromHex('FFF700'))
   setProperty('botplayTxt.color', getColorFromHex('FFF700'))
   setProperty('engineText.color', getColorFromHex('FFF700'))
   setProperty('underlay.color', getColorFromHex('FFF700'))
   setProperty('ComboText.color', getColorFromHex('FFF700'))
   setProperty('SicksText.color', getColorFromHex('FFF700'))
   setProperty('GoodsText.color', getColorFromHex('FFF700'))
   setProperty('BadsText.color', getColorFromHex('FFF700'))
   setProperty('ShitsText.color', getColorFromHex('FFF700'))
   setProperty('MissText.color', getColorFromHex('FFF700'))
end
end
end
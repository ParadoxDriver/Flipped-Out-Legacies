function onCreate()
       makeLuaText('creditsText', "Cover By V,Nitro", 0, 2, 700);
       setTextAlignment('creditsText', 'left');
       setTextSize('creditsText', 17);
       setTextBorder('creditsText', 1, '000000');
       setTextColor('creditsText', 'E80A0A');
       setTextFont('creditsText', "Slasher.ttf");
       setObjectCamera('creditsText', 'hud');
       addLuaText('creditsText');

       makeLuaText('engineText', "Fusion Vocals By Paradox", 0, 1065, 700);
       setTextAlignment('engineText', 'right');
       setTextSize('engineText', 17);
       setTextBorder('engineText', 1, '000000');
       setTextColor('engineText', 'E80A0A');
       setTextFont('engineText', "Slasher.ttf");
       setObjectCamera('engineText', 'hud');
       addLuaText('engineText');

       makeLuaSprite('Start', '', 0, 0);
       makeGraphic('Start',1280,720,'000000');
       setObjectCamera('Start', 'other');
       setProperty('Start.alpha', 1);
       addLuaSprite('Start', true);
end

function onStartCountdown()
       doTweenAlpha('graphicAlpha', 'Start', 0, 56, 'quintOut');
       setProperty('camHUD.visible', false);
       doTweenZoom('zoom', 'camGame', 0.80, 0.09, 'circInOut');
       setProperty('defaultCamZoom', 0.80);

       return Function_Continue
end

function onStepHit()
if curStep == 128 then
        setProperty('camHUD.visible', true);
        doTweenZoom('zoom', 'camGame', 0.65, 0.02, 'circInOut');
        setProperty('defaultCamZoom', 0.65);
        doTweenAlpha('graphicAlpha', 'Start', 0, 0.01, 'quintOut');
end

if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
if curStep == 1023 then
        noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 + 120, 0.25, 'expoOut')
        noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 + 110, 0.25, 'expoOut')
        noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 + 100, 0.25, 'expoOut')
        noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 + 90, 0.25, 'expoOut')
        noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 - 90, 0.25, 'expoOut')
        noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 - 100, 0.25, 'expoOut')
        noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 - 110, 0.25, 'expoOut')
        noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 - 120, 0.25, 'expoOut')
	triggerEvent('3rdstrum',true,'')
end
end

if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
if curStep == 1023 then
	triggerEvent('3rdstrum',true,'')
end
end

if curStep == 2175 then
        setProperty('camHUD.visible', false);
end

if curStep == 2240 then
        doTweenAlpha('graphicAlpha', 'Start', 4, 17, 'linear');
end
end

function opponentNoteHit()
 health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end
end

function onCreatePost() 
        setProperty('scoreTxt.alpha', 0); 
        setProperty('gf.visible', true);

if hideHud == false then
	makeLuaText('kadescore','Score: 0 | Combo Breaks: 0 | Accuracy: 0 % • N/A',0,0,0);
	setProperty('kadescore.y',getProperty('scoreTxt.y')+2);
	setProperty('kadescore.x',getProperty('scoreTxt.x'));
	setTextAlignment('kadescore','CENTER');
	setTextWidth('kadescore',getTextWidth('scoreTxt'));
	setTextSize('kadescore', 20);
        setObjectCamera('kadescore', 'hud');
        setTextColor('kadescore', 'E80A0A');
        setTextFont('kadescore', "Slasher.ttf");
	addLuaText('kadescore');  
end 
end

function onRecalculateRating()
if ratingName == 'Perfect!!' then
	ratingName = 'AAA'
	ratingFC = 'MFC'
elseif ratingName == 'Sick!' then
	ratingName = 'AA'
elseif ratingName == 'Great' then
	ratingName = 'B'
elseif ratingName == 'Good' then
	ratingName = 'C'
elseif ratingName == 'Meh' then
	ratingName = 'D'
elseif ratingName == 'Bruh' then
	ratingName = 'F'
elseif ratingName == 'Bad' then
	ratingName = 'F'
elseif ratingName == 'Shit' then
	ratingName = 'F'
elseif ratingName == 'You Suck!' then
	ratingName = 'FAIL'
end
       setTextString('kadescore','Score: '..score..' | Combo Breaks: '..misses..' | Accuracy: '..round(rating * 100,2)..' % • ('..ratingFC..') '..ratingName)
end  

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end 
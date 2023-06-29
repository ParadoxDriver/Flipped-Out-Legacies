local allowCountdown = false
local warningimage = 'loading/Mechanics/LockjawWarning'
local confirmed = 0

function onCreate()
    makeLuaText('engineText', "Cover By Silly_Nex", 0, 2, 693);
    setTextAlignment('engineText', 'left');
    setTextSize('engineText', 18);
    setTextBorder('engineText', 1, '000000');
    setTextColor('engineText', 'E80A0A');
    setTextFont('engineText', "Impact.ttf");
    setObjectCamera('engineText', 'hud');
    addLuaText('engineText');

    makeLuaText('madness', 'JUST DO WHAT COMES NATURAL', 0, 490, 5)
    setTextColor('madness', 'E80A0A');
    setObjectCamera('madness', 'hud');
    setTextFont('madness', "Impact.ttf");
    setTextSize('madness', 23);

    makeLuaSprite('ok', 'Flippy/Scary/lockjaw', -450, 430);
    setObjectCamera('ok', 'other');
    addLuaSprite('ok', true);

    makeLuaSprite('warningimage', warningimage, 0, 0);
    screenCenter('warningimage', 'xy');
    setObjectCamera('warningimage', 'other');
    addLuaSprite('warningimage', true);
 
    setProperty('skipCountdown', true)
end

function onCreatePost()
if getPropertyFromClass('ClientPrefs', 'downScroll') == false then

    setProperty('madness.y', 17);
end

if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

    setProperty('madness.y', 672);
end
end

function onStartCountdown()
 if not allowCountdown then
  return Function_Stop
 end
 if allowCountdown then
  return Function_Continue
 end
end

function onTimerCompleted(tag)
  if tag == 'startcount' then
    startCountdown()
end
end

function onUpdate()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and confirmed == 0 then
    allowCountdown = true
    runTimer('startcount', 1);
    doTweenAlpha('nomorewarningimage', 'warningimage', 0, 1, sineOut);
    playSound('confirmMenu');
    confirmed = 1
end
end

function onCountdownStarted()
    doTweenZoom('zoom', 'camGame', 2.0, 0.01, 'sineInOut');
    setProperty('camHUD.alpha', 0);
    setProperty('timeTxt.visible', false);
    addLuaText('madness');
end

function onStepHit()
if curStep == 16 then
     doTweenZoom('zoom', 'camGame', 0.7, 21, 'sineInOut');
end

if curStep == 79 then
     doTweenX('MoveInOne', 'ok', 30, 1, 'CircInOut');
end

if curStep == 82 then
     doTweenAlpha('hudalpha', 'camHUD', 1, 5);
end

if curStep == 99 then
     doTweenZoom('zoom', 'camGame', 0.6, 2, 'sineInOut');
end

if curStep == 117 then
     doTweenAlpha('AlphaTween1', 'ok', 0, 0.5);
end

if curStep == 128 then
     setProperty('timeTxt.visible', true);
     setProperty('madness.visible', false);
end

if curStep == 768 then
     triggerEvent('Change Character', 'bf', 'bf-nomask');
     triggerEvent('Alt Idle Animation', 'gf', '-alt');
end

if curStep == 1030 then
     --setPropertyFromClass('ClientPrefs', 'camZooms', false)
end

if curStep == 1040 then
     doTweenAlpha('funnicube', 'funnicube', 0, 3, 'linear');
     doTweenAlpha('scoreTxt', 'scoreTxt', 0, 3, 'linear');
     doTweenAlpha('timeCool', 'timeCool', 0, 3, 'linear');
     doTweenAlpha('timeTxt',  'timeTxt', 0, 3, 'linear');
     doTweenAlpha('timeBar', 'timeBar', 0, 3, 'linear');
     doTweenAlpha('timeBarBG', 'timeBarBG', 0, 3, 'linear');
     doTweenAlpha('engineText', 'engineText', 0, 3, 'linear');
  
     doTweenAlpha('underlay', 'underlay', 0, 3, 'linear');
     doTweenAlpha('ComboText', 'ComboText', 0, 3, 'linear');
     doTweenAlpha('SicksText', 'SicksText', 0, 3, 'linear');
     doTweenAlpha('GoodsText', 'GoodsText', 0, 3, 'linear');
     doTweenAlpha('BadsText', 'BadsText', 0, 3, 'linear');
     doTweenAlpha('ShitsText', 'ShitsText', 0, 3, 'linear');
     doTweenAlpha('MissText',  'MissText', 0, 3, 'linear');
end

if curStep == 1151 then
     doTweenAlpha('ratings', 'ratings', 0, 3, 'linear');
     doTweenAlpha('healthText', 'healthText', 0, 3, 'linear');
     doTweenAlpha('songWM', 'songWM', 0, 3, 'linear');
     doTweenAlpha('iconP1', 'iconP1', 0, 3, 'linear');
     doTweenAlpha('iconP2',  'iconP2', 0, 3, 'linear');
     doTweenAlpha('hankHB', 'hankHB', 0, 3, 'linear');
     doTweenAlpha('healthBarBG', 'healthBarBG', 0, 3, 'linear');
     doTweenAlpha('healthBar', 'healthBar', 0, 3, 'linear');
     doTweenAlpha('healthBarWithAnim', 'healthBarWithAnim', 0, 3, 'linear');
end

if curStep == 1184 then 
     doTweenAlpha('hudalpha', 'camHUD', 0, 3);
end

if curStep == 1200 then
     doTweenZoom('zoom', 'camGame', 0.6, 19, 'sineInOut');
     setProperty('defaultCamZoom', 0.6);
end
end

function noteMiss()
     characterPlayAnim('gf', 'sad', true);
end
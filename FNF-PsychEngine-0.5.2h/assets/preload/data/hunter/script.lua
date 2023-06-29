local defaultNotePos = {};
local spin = false;
local arrowMoveX = 6;
local arrowMoveY = 14;
local allowCountdown = false
local warningimage = 'loading/Mechanics/HunterWarning'
local confirmed = 0

function onCreate()
     makeLuaSprite('Start', '', 0, 0);
     makeGraphic('Start',1280,720,'000000');
     setObjectCamera('Start', 'other');
     setProperty('Start.alpha', 1);
     addLuaSprite('Start', true);

     makeLuaSprite('BlackBords', 'cooloutline', 0, 0);
     setObjectCamera('BlackBords', 'other');
     setProperty('BlackBords.alpha', '0');
     addLuaSprite('BlackBords', true);

     makeLuaText('engineText', "FanSong By Conquers", 0, 2, 700);
     setTextAlignment('engineText', 'left');
     setTextSize('engineText', 17);
     setTextBorder('engineText', 1, '000000');
     setTextColor('engineText', 'E80A0A');
     setTextFont('engineText', "Slasher.ttf")
     setObjectCamera('engineText', 'hud');
     addLuaText('engineText');

if isStoryMode then
     makeLuaSprite('warningimage', warningimage, 0, 0);
     screenCenter('warningimage', 'xy');
     setObjectCamera('warningimage', 'other');
     addLuaSprite('warningimage', true);
end
end

function onUpdate()
if isStoryMode then
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and confirmed == 0 then
    allowCountdown = true
    runTimer('startcount', 1);
    doTweenAlpha('nomorewarningimage', 'warningimage', 0, 1, sineOut);
    playSound('confirmMenu');
    confirmed = 1
end
end
end

function onStartCountdown()
 if not allowCountdown and isStoryMode then
  return Function_Stop
 end
 if allowCountdown and isStoryMode then
  return Function_Continue
 end
end

function onTimerCompleted(tag)
  if tag == 'startcount' then
    startCountdown()
  end
end

function onCountdownStarted()
       setProperty('camHUD.visible', false);
end

function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
       doTweenAlpha('graphicAlpha', 'Start', 0, 1.5, 'quintOut');
end

function onStepHit()
if curStep == 98 then

      setObjectCamera('bartop', 'other');
      setObjectCamera('barbot', 'other');
      setProperty('defaultCamZoom', 0.80);
end

if curStep == 130 then

      setProperty('camHUD.visible', true);
      setProperty('defaultCamZoom', 0.65);
      setObjectCamera('bartop', 'hud');
      setObjectCamera('barbot', 'hud');
end

if curStep == 1166 then  

      doTweenAlpha('graphicAlpha', 'BlackBords', 0.85, 1.1, 'linear');

      doTweenAlpha('shadow', 'shadow', 0, 1, 'linear');
      doTweenAlpha('scoreTxt.Alpha', 'scoreTxt', 0, 1, 'linear');
      doTweenAlpha('timeTxt.Alpha', 'timeTxt', 0, 1, 'linear');
      doTweenAlpha('timeBar.Alpha', 'timeBar', 0, 1, 'linear');
      doTweenAlpha('timeBarBG.Alpha', 'timeBarBG', 0, 1, 'linear');

      doTweenAlpha('iconP1.Alpha', 'iconP1', 0, 1, 'linear');
      doTweenAlpha('iconP2.Alpha', 'iconP2', 0, 1, 'linear');
      doTweenAlpha('healthBarWithAnim.Alpha', 'healthBarWithAnim', 0, 1, 'linear');
      doTweenAlpha('bloodedHB.Alpha', 'bloodedHB', 0, 1, 'linear');
      doTweenAlpha('healthBar.Alpha', 'healthBar', 0, 1, 'linear');
      doTweenAlpha('healthBarBG.Alpha', 'healthBarBG', 0, 1, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0, 1, 'linear');

      doTweenAlpha('ratings.Alpha', 'ratings', 0, 1, 'linear');
      doTweenAlpha('songWM.Alpha', 'songWM', 0, 1, 'linear');
      doTweenAlpha('healthText.Alpha', 'healthText', 0, 1, 'linear');
      doTweenAlpha('engineText.Alpha', 'engineText', 0, 1, 'linear');

      doTweenAlpha('underlay', 'underlay', 0, 1, 'linear');
      doTweenAlpha('ComboText', 'ComboText', 0, 1, 'linear');
      doTweenAlpha('SicksText',  'SicksText', 0, 1, 'linear');
      doTweenAlpha('GoodsText', 'GoodsText', 0, 1, 'linear');
      doTweenAlpha('BadsText', 'BadsText', 0, 1, 'linear');
      doTweenAlpha('ShitsText', 'ShitsText', 0, 1, 'linear');
      doTweenAlpha('MissText',  'MissText', 0, 1, 'linear');
end

if curStep == 1168 then  

      setProperty('defaultCamZoom', 0.80);
end

if curStep == 1425 then

      doTweenAlpha('graphicAlpha', 'BlackBords', 0, 0.7, 'linear');
      setProperty('defaultCamZoom', 0.65);

      doTweenAlpha('shadow', 'shadow', 1, 1, 'linear');
      doTweenAlpha('scoreTxt.Alpha', 'scoreTxt', 1, 0.7, 'linear');
      doTweenAlpha('timeTxt.Alpha', 'timeTxt', 1, 0.7, 'linear');
      doTweenAlpha('timeBar.Alpha', 'timeBar', 1, 0.7, 'linear');
      doTweenAlpha('timeBarBG.Alpha', 'timeBarBG', 1, 0.7, 'linear');

      doTweenAlpha('iconP1.Alpha', 'iconP1', 1, 0.7, 'linear');
      doTweenAlpha('iconP2.Alpha', 'iconP2', 1, 0.7, 'linear');
      doTweenAlpha('healthBarWithAnim.Alpha', 'healthBarWithAnim', 1, 0.7, 'linear');
      doTweenAlpha('bloodedHB.Alpha', 'bloodedHB', 1, 0.7, 'linear');
      doTweenAlpha('healthBar.Alpha', 'healthBar', 1, 0.7, 'linear');
      doTweenAlpha('healthBarBG.Alpha', 'healthBarBG', 1, 0.7, 'linear');
      doTweenAlpha('funnicube', 'funnicube', 0.5, 0.7, 'linear');

      doTweenAlpha('ratings.Alpha', 'ratings', 1, 0.7, 'linear');
      doTweenAlpha('songWM.Alpha', 'songWM', 1, 0.7, 'linear');
      doTweenAlpha('healthText.Alpha', 'healthText', 1, 0.7, 'linear');
      doTweenAlpha('engineText.Alpha', 'engineText', 1, 0.7, 'linear');

      doTweenAlpha('underlay', 'underlay', 0.6, 0.7, 'linear');
      doTweenAlpha('ComboText', 'ComboText', 1, 0.7, 'linear');
      doTweenAlpha('SicksText',  'SicksText', 1, 0.7, 'linear');
      doTweenAlpha('GoodsText', 'GoodsText', 1, 0.7, 'linear');
      doTweenAlpha('BadsText', 'BadsText', 1, 0.7, 'linear');
      doTweenAlpha('ShitsText', 'ShitsText', 1, 0.7, 'linear');
      doTweenAlpha('MissText',  'MissText', 1, 0.7, 'linear');
end

if curStep == 1944 then

      doTweenAlpha('graphicAlpha', 'BlackBords', 0.85, 0.7, 'linear');
end

if curStep == 1946 then

      setProperty('defaultCamZoom', 0.75);
end

if curStep == 2058 then

      doTweenZoom('zoom', 'camGame', 0.95, 0.01, 'circInOut');
      setProperty('defaultCamZoom', 0.95);
end
end

function onUpdatePost(elapsed)
    songPos = getPropertyFromClass('Conductor', 'songPosition');
    currentBeat = (songPos / 1000) * (bpm / 170)
    if spin == true then 
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + arrowMoveX * math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*0.25) * math.pi))
        end
    end
if curStep == 128 then
	  spin = true
   end
if curStep == 524 then
          arrowMoveX = 10;
          arrowMoveY = 17;
     end
if curStep == 1164 then
          arrowMoveX = 6;
          arrowMoveY = 14;
end
if curStep == 1295 then
          arrowMoveX = 14;
          arrowMoveY = 6;
end
if curStep == 1424 then
          arrowMoveX = 10;
          arrowMoveY = 17;
end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 129 and getProperty('health') > 0.010 then
		setProperty('health', getProperty('health') - 0.010);
	end
end
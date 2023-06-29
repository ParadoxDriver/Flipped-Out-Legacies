local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('scopeCutscene');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onBeatHit()
if curBeat >= 288 and curBeat < 352 then
   if curBeat % 1 == 0 then
       triggerEvent('Add Camera Zoom', '0.09', '0.09');
     end
   end
end

function onStepHit()
if curStep == 1152 then
      setTextString('botplayTxt', "THE ZOOM CAMERA\nSHOULD BE ETERNAL");
end
if curStep == 1407 then
      setTextString('botplayTxt', "BOTPLAY");
end
if curStep == 1920 then
      setObjectCamera('bartop', 'other');
      setObjectCamera('barbot', 'other');
   end
end
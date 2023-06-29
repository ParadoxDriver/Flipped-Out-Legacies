                                --settings yay!--
local Active = true --should the notes spin on hit? Default = true

function onCreate() --main code yay!--

makeLuaText('engineText', "Mashup By Nuru", 0, 2, 700);
setTextAlignment('engineText', 'left');
setTextSize('engineText', 17);
setTextBorder('engineText', 1, '000000');
setTextColor('engineText', '308A68');
setObjectCamera('engineText', 'hud');
setTextFont('engineText', "sonic4.ttf");
addLuaText('engineText');

setProperty('skipCountdown', true)
                              
numberP = 0
end

function goodNoteHit(id, direction, noteType, isSustainNote)
if Active then
numberP = numberP + 1
if direction == 0 then 
noteTweenAngle('A' , 4 , 360 * numberP , 0.1, linear);
end
if direction == 1 then
noteTweenAngle('B', 5 , 360 * numberP , 0.1, linear);
end
if direction == 2 then
noteTweenAngle('C', 6 , 360 * numberP , 0.1, linear);
end
if direction == 3 then
noteTweenAngle('D', 7 , 360 * numberP , 0.1, linear);

end
end
end
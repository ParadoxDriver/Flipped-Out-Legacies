function onCreatePost() 
        setProperty('scoreTxt.alpha', 0); 

if hideHud == false then
	makeLuaText('kadescore','Score: 0 | Combo Breaks: 0 | Accuracy: 0 % • N/A',0,0,0);
	setProperty('kadescore.y',getProperty('scoreTxt.y'));
	setProperty('kadescore.x',getProperty('scoreTxt.x'));
	setTextAlignment('kadescore','CENTER');
	setTextWidth('kadescore',getTextWidth('scoreTxt'));
	setTextSize('kadescore', 20);
        setObjectCamera('kadescore', 'hud');
        setTextColor('kadescore', 'E80A0A'); 
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
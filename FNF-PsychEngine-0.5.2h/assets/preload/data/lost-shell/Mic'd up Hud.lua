local Nps = 0
local NoteHit = false;

function onStepHit()
    if NoteHit == true then
        Nps = Nps - 2 * 4 -- math is funny
    end    
end

function onCreatePost()
        setProperty('underlay.visible', false);
        setProperty('ComboText.visible', false);
        --setProperty('SicksText.visible', false);
        --setProperty('GoodsText.visible', false);
        --setProperty('BadsText.visible', false);
        --setProperty('ShitsText.visible', false);
        setProperty('MissText.visible', false);
        setProperty('scoreTxt.visible', false);
        setProperty('funnicube.visible', false);

	makeLuaText('micdupscore','Score: 0',0,20,0);
	setProperty('micdupscore.y',getProperty('healthBarBG.y')+25);
	setTextSize('micdupscore', 21);
        setTextColor('micdupscore', 'BA1E24');
	addLuaText('micdupscore');

	makeLuaText('micdupmiss','Misses: 0',0,20,0);
	setProperty('micdupmiss.y',getProperty('healthBarBG.y'));
	setTextSize('micdupmiss', 21);
        setTextColor('micdupmiss', 'BA1E24');
	addLuaText('micdupmiss');

	makeLuaText('micdupacc','Accuracy: 0%',0,20,0);
	setProperty('micdupacc.y',getProperty('healthBarBG.y')-25);
	setTextSize('micdupacc', 21);
        setTextColor('micdupacc', 'BA1E24');
	addLuaText('micdupacc');

	makeLuaText('nps','NPS: 0',0,20,0);
	setProperty('nps.y',getProperty('healthBarBG.y')-50);
	setTextSize('nps', 21);
        setTextColor('nps', 'BA1E24'); 
	addLuaText('nps');

        scaleObject('timeBarBG', 1.74, 1.16);
        scaleObject('timeBar', 1.75, 1.16);
        setProperty('timeBar.x', getProperty('timeBar.x') - 140);
        setProperty('timeBarBG.x', getProperty('timeBarBG.x') - 138);
        setProperty('timeBar.y', getProperty('timeBar.y') - 9);
        setProperty('timeBarBG.y', getProperty('timeBarBG.y') - 10); 
        setProperty('timeTxt.y', getProperty('timeTxt.y') - 10);

        --setProperty('ComboText.y',getProperty('healthBarBG.y')-55);
        --setProperty('ComboText.x', 1140);
        --setTextSize('ComboText', 22);

        setProperty('SicksText.y',getProperty('healthBarBG.y')-55);--30
        setProperty('SicksText.x', 1140);
        setTextSize('SicksText', 22);

        setProperty('GoodsText.y',getProperty('healthBarBG.y')-30);--5
        setProperty('GoodsText.x', 1140);
        setTextSize('GoodsText', 22);

        setProperty('BadsText.y',getProperty('healthBarBG.y')-5);--20
        setProperty('BadsText.x', 1140);
        setTextSize('BadsText', 22);

        setProperty('ShitsText.y',getProperty('healthBarBG.y')+20);
        setProperty('ShitsText.x', 1140);
        setTextSize('ShitsText', 22);

        setProperty('ratings.x', 980);

if downscroll then
        setProperty('timeBar.y', getProperty('timeBar.y') + 9);
        setProperty('timeBarBG.y', getProperty('timeBarBG.y') + 10); 
        setProperty('timeTxt.y', getProperty('timeTxt.y') + 10);

end
end

function onUpdate(elasped)
	if Nps < 0 then
        Nps = 0
        NoteHit = false;
end   
	setTextString('nps','NPS: '..Nps);
end

function onRecalculateRating()
        setTextString('micdupacc','Accuracy: '..round(rating * 100, 2)..'%');
	setTextString('micdupmiss','Misses: '..misses);
	setTextString('micdupscore','Score: '..score);
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        Nps = Nps + 1
        NoteHit = false;
    end

    ezTimer('drain', 1, function()
        NoteHit = true;
    end)  
end

timers = {}
function ezTimer(tag, timer, callback) -- Better
    table.insert(timers,{tag, callback})
    runTimer(tag, timer)
end

function onTimerCompleted(tag)
    for k,v in pairs(timers) do
        if v[1] == tag then
            v[2]()
        end
    end
end
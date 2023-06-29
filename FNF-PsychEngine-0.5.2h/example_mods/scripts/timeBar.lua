function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)

    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end

function onUpdatePost(elapsed)
if getPropertyFromClass('ClientPrefs', 'timeBarType') == 'Time Elapsed' then

     setTextString('timeTxt', formatTime(getSongPosition() - noteOffset) .. ' / ' .. formatTime(songLength))
end

if getPropertyFromClass('ClientPrefs', 'timeBarType') == 'Time Left' then

     setTextString("timeTxt", formatTime(getSongPosition() - noteOffset) .. " \\ " .. formatTime(songLength))
end
end
--Codigo base por Nickobelit
--Modificado por Paradox 

function onCreatePost()
setPropertyFromClass('ClientPrefs', 'pauseMusic','tea-time')

if songName == 'Hunter' or songName == 'Fallout' or songName == 'Disturbed' or songName == 'Disclosed' or songName == 'Cutting-Crucifixion' or songName == 'Megalophobia' or songName == 'In-The-End' then
setPropertyFromClass('ClientPrefs', 'pauseMusic','Brontofobia')
end

if songName == 'Triggered-Guerrilla' or songName == 'Slaughter-Guerrilla' or songName == 'Slaughter-Guerrilla-Old' or songName == 'Overkill-Guerrilla' or songName == 'Fallout-Guerrilla' or songName == 'Triggered-Remastered' or songName == 'Kapow-Guerrilla' or songName == 'Disturbed-Guerrilla' then
setPropertyFromClass('ClientPrefs', 'pauseMusic','Memories')
end

if songName == 'Hiding' then
setPropertyFromClass('ClientPrefs', 'pauseMusic','Breakfast_Redux')
end
    
if songName == 'Compass-Guerrilla' then
setPropertyFromClass('ClientPrefs', 'pauseMusic','Happy_Trails')
end

if songName == 'Bad-Nun' or songName == 'Crucify' or songName == 'Bazinga' then
setPropertyFromClass('ClientPrefs', 'pauseMusic','Frenzy_Town')
end

if songName == 'Nightmares' or songName == 'Incident' then
setPropertyFromClass('ClientPrefs', 'pauseMusic','Midnight')
end

if songName == 'Massacre' then
setPropertyFromClass('ClientPrefs', 'pauseMusic','Sussus_Muzak')
end

if songName == 'Shock-Shanked' or songName == 'Lost-Shell' then
setPropertyFromClass('ClientPrefs', 'pauseMusic','Paradise')
end

if songName == 'Talasofobia' then
setPropertyFromClass('ClientPrefs', 'pauseMusic','Autofobia') 
end  

if songName == 'Lockjaw' then 
setPropertyFromClass('ClientPrefs', 'pauseMusic','Armaggedon')
end 

if songName == 'Suicide-Out' then
setPropertyFromClass('ClientPrefs', 'pauseMusic','Soulless_Town')
end
end

function onGameOver()--No Tocar
setPropertyFromClass('ClientPrefs', 'pauseMusic','tea-time')
end

function onEndSong()--No Tocar
setPropertyFromClass('ClientPrefs', 'pauseMusic','tea-time')
end
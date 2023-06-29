function onCreate()
    precacheImage('NOTE_assets')
    precacheImage('NoteSkins/GreyNote_assets')
end

function onCreatePost()
    for i=0,3 do
       setPropertyFromGroup('opponentStrums', i, 'texture', 'NoteSkins/GreyNote_assets')
        setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/GreyNote_assets')
    end
end

function onUpdate(elapsed)
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/GreyNote_assets');
		end
    end
end
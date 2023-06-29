function onCreate()
    precacheImage('NoteSkins/BlueNotes')
end

function onCreatePost()
    for i=0,3 do
       setPropertyFromGroup('playerStrums', i, 'texture', 'NoteSkins/BlueNotes')
        setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/BlueNotes')
    end
end

function onUpdate(elapsed)
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'texture') == '' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NoteSkins/BlueNotes');
	     end

            setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'SplashesSkins/BlueNoteSplashes');
      end
end
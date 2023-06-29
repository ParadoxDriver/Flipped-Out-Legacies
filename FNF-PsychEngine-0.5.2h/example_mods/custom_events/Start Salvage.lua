function onEvent(name, value1, value2)
	if name == 'Start Salvage' then
		if value1 == '' then
          triggerEvent('Add Camera Zoom', '2.4', '2.4')
          setProperty('camHUD.visible', true)
          setProperty('blu.visible', false) -- this is remove because i need it for the 6am event 
         end
     end
end
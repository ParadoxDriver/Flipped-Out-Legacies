function onUpdate(e)
	local angleOfs = math.random(-7, 7)
	if getProperty('healthBar.percent') < 20 then
		setProperty('iconP1.angle', angleOfs)
    end
end
return function(config, w, h)
	local width = config.width
	local height = config.height
	
	if w > h  then
		width = config.height * w/h
		height = config.height
		
	else
		width = config.width * h/w
		height = config.width
	end

	if width*(w/width)<config.width then
		width = config.width 
		height = config.width * h/w
	end

	if height<config.height then
		width = config.height * w/h
		height = config.height
	end

	local xScale = w/width
	local yScale = h/height

	local x = w/2 - (config.width * xScale)/2
	local y = h/2 - (config.height * xScale)/2

	config.left = -(width/2-config.width/2)
	config.right = (width/2+config.width/2)
	config.top = -(height/2-config.height/2)
	config.bottom = (height/2+config.height/2)

	config.contentWidth = width
	config.contentHeight = height

	love.graphics.translate(x, y)
	love.graphics.scale(xScale, yScale)

	return config
end
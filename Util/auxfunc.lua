function randomFloat(min, max, precision)
	-- Generate a random floating point number between min and max
	--[[1]] local range = max - min
	--[[2]] local offset = range * math.random()
	--[[3]] local unrounded = min + offset

	-- Return unrounded number if precision isn't given
	if not precision then
		return unrounded
	end

	-- Round number to precision and return
	--[[1]] local powerOfTen = 10 ^ precision
	local n
	--[[2]] n = unrounded * powerOfTen
	--[[3]] n = n + 0.5
	--[[4]] n = math.floor(n)
	--[[5]] n = n / powerOfTen
	return n
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end  

function indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end

function signRandomizer()
	local sign = math.random(0, 1)*2-1
	return sign
end
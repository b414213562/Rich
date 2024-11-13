
-- Dump table function for checking tables on the fly ---------------
function dump(o)
    if type(o) == 'table' then
        local s = '{\n'
        for k,v in pairs(o) do
                if type(k) ~= 'number' then k = '"'..k..'"' end
                s = s .. '['..k..'] = ' .. dump(v) .. '\n'
        end
        return s .. '}\n'
    else
        return tostring(o)
    end
end


--This function returns a deep copy of a given table ---------------
function deepcopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end


-- This function merges table two into table one, overwriting any matching entries.
function mergeTables(t1, t2)
	for k, v in pairs(t2) do
		if (type(v) == "table") and (type(t1[k] or false) == "table") then
			mergeTables(t1[k], t2[k])
		else
			t1[tostring(k)] = v
		end
	end
	return t1
end

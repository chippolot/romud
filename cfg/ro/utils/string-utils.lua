local lib = {}
lib.FirstToUpper = function(str)
    return (str:gsub("^%l", string.upper))
end
return lib

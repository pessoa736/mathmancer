


return function (global, classname)
    for idx, ent in ipairs(global._entitys) do
        if  ent.classname == classname then
            return idx
        end
    end
end
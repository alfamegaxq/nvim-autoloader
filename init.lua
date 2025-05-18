local TablesAutoloader = {}

function TablesAutoloader.autoload(path)
    if not path then
        error("autoload must have path provided")
    end
    local tables = {}
    local files = vim.fn.readdir(vim.fn.stdpath("config").."/lua/"..path, [[v:val =~ '\.lua$']])
    for _, filename in ipairs(files) do  
        local modName = string.gsub(path:gsub("/$", ""), "/", ".").."."..filename:gsub("%.lua$", "")
        local ok, mod = pcall(require, modName)
        if ok then
            table.insert(tables, mod)
        else
            print("Failed to load file: " .. filename)
        end
    end
    return tables
end

function TablesAutoloader.autoloadPlugins(path)
    if not path then
        path = "plugins"
    end
    return TablesAutoloader.autoload(path)
end

return TablesAutoloader


-- Este es el script central (el hub) que ejecuta el loadstring.
local gameId = game.PlaceId

-- URLs de los scripts para cada juego.
local scripts = {
    [6097258548] = "https://raw.githubusercontent.com/pepegames4/Iron-man-2-script.lua/main/main.lua", -- Iron Man 2 Simulator
    [111163066268338] = "https://raw.githubusercontent.com/pepegames4/Kat-x-script.lua/main/main.lua",
}

local scriptUrl = scripts[gameId]

if scriptUrl then
    local success, content = pcall(function()
        return game:HttpGet(scriptUrl, true)
    end)
    
    if success and content then
        loadstring(content)()
        print("Script para el juego " .. gameId .. " cargado con éxito.")
    else
        warn("Error al cargar el script. Revisa la URL y la conexión a Internet.")
    end
else
    print("No se encontró un script para este juego en la base de datos.")
end

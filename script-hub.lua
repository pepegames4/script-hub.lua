-- Script Hub para ejecutar scripts específicos de cada juego.
-- Este script corrige los errores de "attempt to call a nil value"
-- y "expected identifier", haciendo la ejecución más estable.

local gameId = game.PlaceId

-- URLs de los scripts para cada juego.
-- Asegúrate de que los IDs y las URLs sean correctas y públicas.
local scripts = {
    [204354226] = "https://raw.githubusercontent.com/pepegames4/Iron-man-2-script.lua/main/main.lua", -- Iron Man 2 Simulator
    [111163066268338] = "https://raw.githubusercontent.com/pepegames4/Kat-x-script.lua/main/katana.lua", -- KAT X
}

local scriptUrl = scripts[gameId]

if scriptUrl then
    local success, content = pcall(function()
        return game:HttpGet(scriptUrl, true)
    end)
    
    if success and content and string.len(content) > 0 then
        -- Verifica que el contenido del script no esté vacío.
        loadstring(content)()
        print("Script para el juego " .. gameId .. " cargado con éxito.")
    else
        warn("Error: No se pudo cargar el script desde la URL.")
        print("Revisa que el repositorio sea público y la URL sea correcta.")
    end
else
    print("No se encontró un script para este juego en la base de datos.")
end
